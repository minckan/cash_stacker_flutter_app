import 'dart:async';

import 'package:cash_stacker_flutter_app/common/utill/calculation_helpers.dart';
import 'package:cash_stacker_flutter_app/common/utill/date_format.dart';

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
  //================================================================

  bool get _isKrwAsset => asset.currency?.currencyCode == 'KRW';

  bool get isCashAsset {
    final cashAssetId =
        ref.read(categoryViewModelProvider.notifier).cashAsset.id;

    return cashAssetId == asset.category.id;
  }

  bool get isKrwCashAsset => _isKrwAsset && isCashAsset;

  //================================================================

  /// 환율 정보가 각 통화 1unit 당 한화로 내려오지 않고 엔화와 인도네시아 루피아는 100unit당 한화로 내려오기 때문에 구분이 필요.
  bool get isJPYOrIDR {
    return asset.currency!.currencyCode == 'JPY' ||
        asset.currency!.currencyCode == 'IDR';
  }

  //================================================================

  /// 영업일 기준 1시간 단위로 업데이트 되는 환율 정보
  double get exchangeRate {
    final exchangeRate = ref.watch(exchangeRateProvider).firstWhere((rate) =>
        rate.cur_unit.contains(asset.currency?.currencyCode as Pattern));

    final parseDouble = double.parse(removeComma(exchangeRate.deal_bas_r));
    final valueTransformed = asset.currency!.currencyCode == 'JPY'
        ? (parseDouble / 100)
        : parseDouble; // IDR

    return valueTransformed;
  }

  //================================================================
  /// 각 자산의 거래내역
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

  /// 전체 투자 수량
  double get totalQuantity {
    return purchaseTransactions.fold(
        0, (sum, transaction) => sum + transaction.quantity);
  }

  /// 매수금액 기준 자산 비율
  double get ratioValue {
    final totalValue = ref
        .read(assetSummaryProvider.notifier)
        .getAssetSummaryByMonth(getMonth(DateTime.now()))!
        .totalAssets;

    if (isCashAsset) {
      return (averageTotalKrwPurchasePrice / totalValue) * 100;
    }

    return (averageTotalKrwPurchasePrice / totalValue) * 100;
  }

  //================================================================

  /// [원화] 실제 투자원금 총액
  double get averageTotalKrwPurchasePrice {
    if (_isKrwAsset && isCashAsset) {
      return asset.inputCurrentPrice;
    }

    final total = transactions.fold(0.0,
        (total, transaction) => total + transaction.totalKrwTransactionPrice);
    return total / transactions.length;
  }

  /// [원화] 평균 매입가
  double get averageKrwPrice {
    final totalPurchasePrice = purchaseTransactions.fold(
        0.0, (sum, transaction) => sum + transaction.krwSinglePrice);
    return totalPurchasePrice / transactions.length;
  }

  /// [원화] 입력 받은 현재가
  double get currentKrwPrice {
    if (_isKrwAsset) {
      return asset.inputCurrentPrice;
    } else {
      return asset.inputCurrentPrice * exchangeRate;
    }
  }

  /// [원화] 현재가 * 수량 = 현재가 총금액
  double get currentKrwTotalEvaluation {
    return currentKrwPrice * totalQuantity;
  }

  /// [원화] 원화환산금액의 수익률
  double get krwProfitLossRate {
    final prev = averageTotalKrwPurchasePrice;
    final current = currentKrwTotalEvaluation;
    return calculatePercentageIncrease(prev, current);
  }

  /// [원화:현금] 현재 평가금액
  double get currentCashKrwTotalEvaluation {
    if (_isKrwAsset) {
      return asset.inputCurrentPrice;
    } else {
      return asset.inputCurrentPrice * exchangeRate;
    }
  }

  //================================================================

  /// [외화] 실제 투자원금 총액
  double get totalPurchaseAmount {
    return purchaseTransactions.fold(
        0, (sum, transaction) => sum + transaction.totalTransactionPrice);
  }

  /// [외화] 평균 매입가
  double get averagePrice {
    final totalPurchasePrice = purchaseTransactions.fold(
        0.0, (sum, transaction) => sum + transaction.singlePrice);

    return totalPurchasePrice / transactions.length;
  }

  /// [외화] 입력받은 현재가
  double get currentPrice {
    return asset.inputCurrentPrice;
  }

  /// [외화] 현재가 * 수량 = 현재가 총금액
  double get totalEvaluation {
    return currentPrice * totalQuantity;
  }

  /// [외화] 외화 수익률
  double get profitLossRate {
    final prev = totalPurchaseAmount;
    final current = totalEvaluation;
    return calculatePercentageIncrease(prev, current);
  }

  //================================================================

  /// 매입 환율 평균
  double get averageExchangeRate {
    final transactionSize = transactions.length;
    final value = transactions.fold(0.0, (total, transaction) {
          return total + (transaction.exchangeRate);
        }) /
        transactionSize;

    return value;
  }

  /// 환차익율
  double get foreignExchangeRateProfitLossRate {
    final previousPrice = averageExchangeRate;
    final currentPrice = exchangeRate;

    return calculatePercentageIncrease(previousPrice, currentPrice);
  }
}
