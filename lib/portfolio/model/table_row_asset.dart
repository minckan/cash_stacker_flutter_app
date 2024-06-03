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
      if (asset.currency?.currencyCode == 'KRW') {
        name = '현금';
        purchasePriceKrw = '';
        purchasePriceForeign = '';
        amount = '';
        totalEvaluationKrw =
            addComma.format(assetVM.currentCashKrwTotalEvaluation);
        totalEvaluationForeign = '';
        currentPriceKrw = '';
        currentPriceForeign = '';
        ratio = '${assetVM.ratioValue}%';
        profitLossRateKrw = '';
        profitLossRateForeign = '';
        initialPurchaseDate = '';
      } else {
        String addSymbol(String value, String? symbol) {
          return '$symbol $value';
        }

        name = '현금(${asset.currency?.currencyCode})';
        purchasePriceKrw = '-';
        purchasePriceForeign = addSymbol('${assetVM.averageForeignCashPrice}',
            asset.currency?.currencySymbol);
        amount = '-';
        totalEvaluationKrw =
            addComma.format(assetVM.currentCashKrwTotalEvaluation);
        totalEvaluationForeign =
            '${asset.currency?.currencySymbol} ${addComma.format(asset.inputCurrentPrice)}';
        currentPriceKrw = '-';
        currentPriceForeign = addSymbol(assetVM.exchangeRate.toStringAsFixed(2),
            asset.currency?.currencySymbol);
        ratio = '${assetVM.ratioValue}%';
        profitLossRateKrw = '-';
        profitLossRateForeign =
            '${assetVM.foreignCashProfitLossRate.toStringAsFixed(1)}%';
        initialPurchaseDate =
            DateFormat('yyyy.MM.dd').format(asset.initialPurchaseDate);
      }
    } else {
      name = asset.name;
      purchasePriceKrw = addComma.format(assetVM.averageKrwPrice);
      purchasePriceForeign = addComma.format(assetVM.averagePrice);
      amount = addComma.format(assetVM.totalQuantity);
      totalEvaluationKrw = addComma.format(assetVM.currentKrwTotalEvaluation);
      totalEvaluationForeign = addComma.format(assetVM.totalEvaluation);
      currentPriceKrw = addComma.format(assetVM.currentKrwPrice);
      currentPriceForeign = addComma.format(assetVM.currentPrice);
      ratio = '${assetVM.ratioValue}%';
      profitLossRateKrw = asset.inputCurrentPrice == 0
          ? '-'
          : '${assetVM.krwProfitLossRate.toStringAsFixed(2)}%';
      profitLossRateForeign = asset.inputCurrentPrice == 0
          ? '-'
          : '${assetVM.profitLossRate.toStringAsFixed(2)}%';
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
