import 'package:cash_stacker_flutter_app/common/utill/number_format.dart';
import 'package:cash_stacker_flutter_app/portfolio/model/asset_model.dart';
import 'package:cash_stacker_flutter_app/portfolio/viewmodel/asset_detail_view_model.dart';
import 'package:intl/intl.dart';

class TableRowAsset {
  final String name;
  final String purchasePriceKrw;
  final String purchasePriceForeign;
  final String amount;
  final String totalEvaluationKrw;
  final String totalEvaluationForeign;
  final String currentPriceKrw;
  final String currentPriceForeign;
  final String ratio;
  final String profitLossRateKrw;
  final String profitLossRateForeign;
  final String initialPurchaseDate;

  TableRowAsset({
    required this.name,
    required this.purchasePriceKrw,
    required this.purchasePriceForeign,
    required this.amount,
    required this.totalEvaluationKrw,
    required this.totalEvaluationForeign,
    required this.currentPriceKrw,
    required this.currentPriceForeign,
    required this.ratio,
    required this.profitLossRateKrw,
    required this.profitLossRateForeign,
    required this.initialPurchaseDate,
  });

  factory TableRowAsset.fromAsset(Asset asset, AssetDetailViewModel assetVM) {
    String name;
    String purchasePriceKrw;
    String purchasePriceForeign;
    String amount;
    String totalEvaluationKrw;
    String totalEvaluationForeign;
    String currentPriceKrw;
    String currentPriceForeign;
    String ratio;
    String profitLossRateKrw;
    String profitLossRateForeign;
    String initialPurchaseDate;

    if (assetVM.isCashAsset) {
      name = '현금';
      purchasePriceKrw = '';
      purchasePriceForeign = '';
      amount = '';
      totalEvaluationKrw = '';
      totalEvaluationForeign = '';
      currentPriceKrw = '';
      currentPriceForeign = '';
      ratio = '';
      profitLossRateKrw = '';
      profitLossRateForeign = '';
      initialPurchaseDate = '';
    } else {
      name = asset.name;
      purchasePriceKrw = addComma.format(asset.averageKrwPrice);
      purchasePriceForeign = addComma.format(asset.averagePrice);
      amount = addComma.format(asset.totalQuantity);
      totalEvaluationKrw = addComma.format(assetVM.currentKrwTotalEvaluation);
      totalEvaluationForeign = addComma.format(asset.totalEvaluation);
      currentPriceKrw = addComma.format(assetVM.currentKrwPrice);
      currentPriceForeign = addComma.format(asset.currentPrice);
      ratio = '${assetVM.ratioValue.toStringAsFixed(1)}%';
      profitLossRateKrw = asset.inputCurrentPrice == 0
          ? '-'
          : '${assetVM.krwProfitLossRate.toStringAsFixed(2)}%';
      profitLossRateForeign = asset.inputCurrentPrice == 0
          ? '-'
          : '${asset.profitLossRate.toStringAsFixed(2)}%';
      initialPurchaseDate =
          DateFormat('yyyy.MM.dd').format(asset.initialPurchaseDate);
    }
    return TableRowAsset(
      name: name,
      purchasePriceKrw: purchasePriceKrw,
      purchasePriceForeign: purchasePriceForeign,
      amount: amount,
      totalEvaluationKrw: totalEvaluationKrw,
      totalEvaluationForeign: totalEvaluationForeign,
      currentPriceKrw: currentPriceKrw,
      currentPriceForeign: currentPriceForeign,
      ratio: ratio,
      profitLossRateKrw: profitLossRateKrw,
      profitLossRateForeign: profitLossRateForeign,
      initialPurchaseDate: initialPurchaseDate,
    );
  }
}
