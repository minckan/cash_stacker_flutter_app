import 'package:cash_stacker_flutter_app/common/utill/date_format.dart';
import 'package:cash_stacker_flutter_app/common/utill/number_format.dart';
import 'package:cash_stacker_flutter_app/common/viewmodels/exchange_rate_view_model.dart';
import 'package:cash_stacker_flutter_app/home/viewmodels/asset_summary_view_model.dart';
import 'package:cash_stacker_flutter_app/portfolio/model/asset_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 위젯 내부에서만 사용가능
class AssetDetailViewModel {
  final Asset asset;
  final WidgetRef ref;
  AssetDetailViewModel({
    required this.asset,
    required this.ref,
  });

  /// 현재가(원화)/ 현재환율 필요.
  double get currentKrwPrice {
    final exchangeRate = ref.watch(exchangeRateProvider).firstWhere((rate) =>
        rate.cur_unit.contains(asset.currency?.currencyCode as Pattern));

    if (asset.currency?.currencyCode == 'KRW') {
      return asset.inputCurrentPrice != 0
          ? asset.inputCurrentPrice
          : asset.averageKrwPrice;
    } else {
      final parseDouble = double.parse(removeComma(exchangeRate.deal_bas_r));
      final valueTransformed = asset.currency!.currencyCode == 'JPY'
          ? (parseDouble / 100)
          : parseDouble; // IDR

      return (asset.inputCurrentPrice != 0
              ? asset.inputCurrentPrice
              : asset.averagePrice) *
          valueTransformed;
    }
  }

  ///현재 평가액(원화)
  double get currentKrwTotalEvaluation {
    return currentKrwPrice * asset.totalQuantity;
  }

  /// 원화 환산 수익률
  double get krwProfitLossRate {
    final totalPurchase = asset.totalPurchaseAmount;
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

    return (currentKrwTotalEvaluation / totalValue) * 100;
  }
}
