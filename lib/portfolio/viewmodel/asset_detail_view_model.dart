import 'package:cash_stacker_flutter_app/common/utill/date_format.dart';
import 'package:cash_stacker_flutter_app/common/utill/logger.dart';
import 'package:cash_stacker_flutter_app/common/utill/number_format.dart';
import 'package:cash_stacker_flutter_app/common/viewmodels/exchange_rate_view_model.dart';
import 'package:cash_stacker_flutter_app/home/viewmodels/asset_summary_view_model.dart';
import 'package:cash_stacker_flutter_app/portfolio/model/asset_model.dart';
import 'package:cash_stacker_flutter_app/portfolio/model/asset_transaction.dart';
import 'package:cash_stacker_flutter_app/portfolio/viewmodel/asset_transaction_viewModel.dart';

import 'package:cash_stacker_flutter_app/setting/viewmodel/category_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 위젯 테이블용 데이터 계산
/// 위젯에서만 사용 가능 (다른 뷰모델에서 X)
class AssetDetailViewModel {
  final Asset asset;
  final WidgetRef ref;
  AssetDetailViewModel({
    required this.asset,
    required this.ref,
  });

  bool get _isKrwAsset => asset.currency?.currencyCode == 'KRW';

  bool get isCashAsset {
    final cashAssetId =
        ref.read(categoryViewModelProvider.notifier).cashAsset.id;

    return cashAssetId == asset.category.id;
  }

  bool get isJPYOrIDR {
    return asset.currency!.currencyCode == 'JPY' ||
        asset.currency!.currencyCode == 'IDR';
  }

  double get exchangeRate {
    final exchangeRate = ref.watch(exchangeRateProvider).firstWhere((rate) =>
        rate.cur_unit.contains(asset.currency?.currencyCode as Pattern));

    final parseDouble = double.parse(removeComma(exchangeRate.deal_bas_r));
    final valueTransformed = asset.currency!.currencyCode == 'JPY'
        ? (parseDouble / 100)
        : parseDouble; // IDR

    return valueTransformed;
  }

  List<AssetTransaction> get transactions {
    final allTR = ref.read(assetTransactionViewModelProvider);
    final assetId = asset.id;

    return allTR
        .where((transaction) => transaction.assetId == assetId)
        .toList();
  }

  /// 매수 이력 리스트
  List<AssetTransaction> get purchaseTransactions {
    return transactions
        .where((transaction) => transaction.type == AssetTransactionType.buy)
        .toList();
  }

  /// 매도 이력 리스트
  List<AssetTransaction> get sellingTransactions {
    return transactions
        .where((transaction) => transaction.type == AssetTransactionType.sell)
        .toList();
  }

  /// 전체 투자 금액 (실제 투자 원금 총액)
  double get totalPurchaseAmount {
    return purchaseTransactions.fold(
        0, (sum, transaction) => sum + transaction.totalTransactionPrice);
  }

  /// 전체 투자 수량
  double get totalQuantity {
    return purchaseTransactions.fold(
        0, (sum, transaction) => sum + transaction.quantity);
  }

  /// 평균 매입가 (원화)
  double get averageKrwPrice {
    final totalPurchasePrice = purchaseTransactions.fold(
        0.0, (sum, transaction) => sum + transaction.krwSinglePrice);
    return totalPurchasePrice / transactions.length;
  }

  /// 평균 매입가 (외화)
  double get averagePrice {
    if (_isKrwAsset) {
      return 0;
    } else {
      final totalPurchasePrice = purchaseTransactions.fold(
          0.0, (sum, transaction) => sum + transaction.singlePrice);

      return totalPurchasePrice / transactions.length;
    }
  }

  /// 현재가(외화)
  double get currentPrice {
    if (_isKrwAsset) {
      return 0.0;
    } else {
      return asset.inputCurrentPrice;
    }
  }

  /// 현재 평가액(외화)
  double get totalEvaluation {
    if (_isKrwAsset) {
      return 0;
    } else {
      return currentPrice * totalQuantity;
    }
  }

  /// 외화 수익률
  double get profitLossRate {
    if (_isKrwAsset) {
      return 0;
    } else {
      final totalPurchase = totalPurchaseAmount;
      final totalEval = totalEvaluation;
      return totalPurchase > 0
          ? ((totalEval - totalPurchase) / totalPurchase) * 100
          : 0;
    }
  }

  /// 현재가(원화)/ 현재환율 필요.
  double get currentKrwPrice {
    if (asset.currency?.currencyCode == 'KRW') {
      return asset.inputCurrentPrice != 0
          ? asset.inputCurrentPrice
          : averageKrwPrice;
    } else {
      return (asset.inputCurrentPrice != 0
              ? asset.inputCurrentPrice
              : averagePrice) *
          exchangeRate;
    }
  }

  ///현재 평가액(원화)
  double get currentKrwTotalEvaluation {
    return currentKrwPrice * totalQuantity;
  }

  /// 원화 환산 수익률
  double get krwProfitLossRate {
    final totalPurchase = totalPurchaseAmount;
    final totalEval = currentKrwTotalEvaluation;
    return totalPurchase > 0
        ? ((totalEval - totalPurchase) / totalPurchase) * 100
        : 0;
  }

  double get ratioValue {
    final totalValue = ref
        .read(assetSummaryProvider.notifier)
        .getAssetSummaryByMonth(getMonth(DateTime.now()))!
        .totalAssets;

    if (isCashAsset) {
      return (purchaseCashKrwTotal / totalValue) * 100;
    }

    return (currentKrwTotalEvaluation / totalValue) * 100;
  }

  /// 현금 자산 계산식
  /// 현금 한화 평가액 (외환)
  double get currentCashKrwTotalEvaluation {
    if (asset.currency?.currencyCode == 'KRW') {
      return asset.inputCurrentPrice;
    } else {
      return asset.inputCurrentPrice * exchangeRate;
    }
  }

  double get averageTotalKrwPurchasePrice {
    final total = transactions.fold(0.0,
        (total, transacrion) => total + transacrion.totalKrwTransactionPrice);
    return total / transactions.length;
  }

  double get purchaseCashKrwTotal {
    return averageTotalKrwPurchasePrice;
  }

  /// 외환 매입 환율 평균
  double get averageForeignCashPrice {
    if (isCashAsset == true && asset.currency?.currencyCode != 'KRW') {
      final transactionSize = transactions.length;
      final value = transactions.fold(0.0, (total, transaction) {
            return total + (transaction.exchangeRate);
          }) /
          transactionSize;

      return value;
    }
    return 0.0;
  }

  /// 외환 수익율
  double get foreignCashProfitLossRate {
    final previousPrice = averageForeignCashPrice;
    final currentPrice = exchangeRate;

    return calculatePercentageIncrease(previousPrice, currentPrice);
  }
}

/// 수익율 계산
double calculatePercentageIncrease(double previousPrice, double currentPrice) {
  if (previousPrice == 0) {
    throw ArgumentError('이전 가격은 0이 될 수 없습니다.');
  }
  double increase = currentPrice - previousPrice;
  double percentageIncrease = (increase / previousPrice) * 100;
  return percentageIncrease;
}
