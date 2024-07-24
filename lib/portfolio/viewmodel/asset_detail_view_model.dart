import 'package:cash_stacker_flutter_app/common/providers/asset_provider.dart';
import 'package:cash_stacker_flutter_app/common/providers/exchange_rate_provider.dart';
import 'package:cash_stacker_flutter_app/common/utill/calculation_helpers.dart';
import 'package:cash_stacker_flutter_app/common/utill/date_format.dart';

import 'package:cash_stacker_flutter_app/common/utill/number_format.dart';

import 'package:cash_stacker_flutter_app/portfolio/viewmodel/asset_transaction_viewModel.dart';
import 'package:cash_stacker_flutter_app/setting/viewmodel/asset_type_view_model.dart';
import 'package:cash_stacker_flutter_app/swaggers/openapi.dart';

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

  bool get _isKrwAsset => asset.currencyCode == 'KRW';

  bool get isCashAsset {
    final categoryVm = ref.read(assetTypeViewModelProvider.notifier);
    final krwCashAssetId = categoryVm.cashAsset.assetTypeId;

    final foreignCashAssetId = categoryVm.foreignCashAsset.assetTypeId;

    return krwCashAssetId == asset.assetTypeId ||
        foreignCashAssetId == asset.assetTypeId;
  }

  bool get isKrwCashAsset =>
      asset.assetTypeId ==
      ref.read(assetTypeViewModelProvider.notifier).cashAsset.assetTypeId;

  bool get isForeignCashAsset =>
      asset.assetTypeId ==
      ref
          .read(assetTypeViewModelProvider.notifier)
          .foreignCashAsset
          .assetTypeId;

  //================================================================

  /// 환율 정보가 각 통화 1unit 당 한화로 내려오지 않고 엔화와 인도네시아 루피아는 100unit당 한화로 내려오기 때문에 구분이 필요.
  bool get isJPYOrIDR {
    return asset.currencyCode == 'JPY' || asset.currencyCode == 'IDR';
  }

  //================================================================

  /// 영업일 기준 1시간 단위로 업데이트 되는 환율 정보
  double get exchangeRate {
    if (asset.currencyCode == 'BRL') return 0;

// TODO: Bad state: No element ERROR
    final exchangeRate = ref.watch(exchangeRateProvider).firstWhere(
        (rate) => rate.currencyCode.contains(asset.currencyCode as Pattern));

    final parseDouble = double.parse(removeComma(exchangeRate.rate));
    final valueTransformed =
        asset.currencyCode == 'JPY' ? (parseDouble / 100) : parseDouble; // IDR

    return valueTransformed;
  }

  //================================================================
  /// 각 자산의 거래내역
  List<AssetTransaction> get transactions {
    final allTR = ref.read(assetTransactionViewModelProvider);
    final assetId = asset.assetId;

    return allTR
        .where((transaction) => transaction.assetId == assetId)
        .toList();
  }

  /// 매수 이력 리스트
  List<AssetTransaction> get purchaseTransactions {
    return transactions
        .where((transaction) =>
            transaction.transactionType ==
            AssetTransactionRequestTransactionTypeEnum.buy)
        .toList();
  }

  /// 매도 이력 리스트
  List<AssetTransaction> get sellingTransactions {
    return transactions
        .where((transaction) =>
            transaction.transactionType ==
            AssetTransactionRequestTransactionTypeEnum.sell)
        .toList();
  }

  /// 전체 투자 수량
  double get totalQuantity {
    return purchaseTransactions.fold(
            0, (sum, transaction) => sum + (transaction.shares ?? 0)) -
        sellingTransactions.fold(
            0, (sum, transaction) => sum + (transaction.shares ?? 0));
  }

  /// 매수금액 기준 자산 비율
  double get ratioValue {
    final totalValue = ref
        .read(thisMonthMonthlyAssetAmountProvider(getMonth(DateTime.now())))!
        .totalValue;

    if (isCashAsset) {
      return (totalBuyingAmountKrw / totalValue) * 100;
    }

    return (totalBuyingAmountKrw / totalValue) * 100;
  }

  //================================================================

  /// [원화] 실제 투자원금 총액
  double get totalBuyingAmountKrw {
    if (isKrwCashAsset) {
      return asset.balance ?? 0;
    } else if (isForeignCashAsset) {
      final totalBuying = purchaseTransactions.fold(0.0,
          (total, transaction) => total + transaction.totalTransactionPrice);
      final totalSelling = sellingTransactions.fold(0.0,
          (total, transaction) => total + transaction.totalTransactionPrice);

      return (totalBuying - totalSelling) * averageExchangeRate;
    }

    final totalBuying = purchaseTransactions.fold(
        0.0, (total, transaction) => total + transaction.quantity);
    final totalSelling = sellingTransactions.fold(
        0.0, (total, transaction) => total + transaction.quantity);

    final total = totalBuying - totalSelling;

    return total * buyingSinglePriceKrw;
  }

  /// [원화] 평균 매입가
  double get buyingSinglePriceKrw {
    final totalPurchasePrice = purchaseTransactions.fold(
        0.0, (sum, transaction) => sum + transaction.krwSinglePrice);
    return totalPurchasePrice / purchaseTransactions.length;
  }

  /// [원화] 입력 받은 현재가
  double get currentSinglePriceKrw {
    if (_isKrwAsset) {
      return asset.balance ?? 0;
    } else {
      return (asset.balance ?? 0) * exchangeRate;
    }
  }

  /// [원화] 현재가 * 수량 = 현재가 총금액
  double get totalCurrentAmountKrw {
    return currentSinglePriceKrw * totalQuantity;
  }

  /// [원화] 원화환산금액의 수익률
  double get profitLossRateKrw {
    final prev = totalBuyingAmountKrw;
    final current = totalCurrentAmountKrw;
    return calculatePercentageIncrease(prev, current);
  }

  /// [원화] 현재 평가 수익금액
  double get totalEvaluationAmountKrw {
    if (totalCurrentAmountKrw == 0) {
      return 0;
    }
    return totalCurrentAmountKrw - totalBuyingAmountKrw;
  }

  //================================================================

  /// [외화] 실제 투자원금 총액
  double get totalBuyingAmountForeign {
    if (isForeignCashAsset) {
      final totalBuying = purchaseTransactions.fold(0.0,
          (total, transaction) => total + transaction.totalTransactionPrice);
      final totalSelling = sellingTransactions.fold(0.0,
          (total, transaction) => total + transaction.totalTransactionPrice);

      final total = totalBuying - totalSelling;
      return total;
    }
    final totalBuying = purchaseTransactions.fold(
        0.0, (total, transaction) => total + transaction.shares!);
    final totalSelling = sellingTransactions.fold(
        0.0, (total, transaction) => total + transaction.shares!);

    final total = totalBuying - totalSelling;
    return total * buyingSinglePriceForeign;
  }

  /// [외화] 평균 매입가
  double get buyingSinglePriceForeign {
    final totalPurchasePrice = purchaseTransactions.fold(
        0.0, (sum, transaction) => sum + transaction.pricePerShare!);

    return totalPurchasePrice / purchaseTransactions.length;
  }

  /// [외화] 입력받은 현재가
  double get currentSinglePriceForeign {
    return asset.balance ?? 0;
  }

  /// [외화] 현재가 * 수량 = 현재가 총금액
  double get totalCurrentAmountForeign {
    return currentSinglePriceForeign * totalQuantity;
  }

  /// [외화] 외화 수익률
  double get profitLossRateForeign {
    final prev = totalBuyingAmountForeign;
    final current = totalCurrentAmountForeign;
    return calculatePercentageIncrease(prev, current);
  }

  /// [외화] 외화 예상 수익금
  double get totalEvaluationAmountForeign {
    if (totalCurrentAmountForeign == 0) {
      return 0;
    }
    return totalCurrentAmountForeign - totalBuyingAmountForeign;
  }

  //================================================================
  /// [외환] 현재환율 * 총 금액
  double get totalCurrentCashAmountForeignKrw {
    return exchangeRate * totalBuyingAmountForeign;
  }

  /// [외환] 원화 예상 수익금
  double get totalCashEvaluationAmountForeign {
    if (totalCurrentCashAmountForeignKrw == 0) {
      return 0;
    }
    return totalCurrentCashAmountForeignKrw - totalBuyingAmountKrw;
  }

  /// 환차익율
  double get foreignCashProfitLossRate {
    final previousPrice = totalBuyingAmountKrw;
    final currentPrice = totalCurrentCashAmountForeignKrw;

    return calculatePercentageIncrease(previousPrice, currentPrice);
  }
  //================================================================

  /// 매입 환율 평균
  double get averageExchangeRate {
    final transactionSize = purchaseTransactions.length;
    final value = purchaseTransactions.fold(0.0, (total, transaction) {
          return total + (transaction.exchangeRate!);
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
