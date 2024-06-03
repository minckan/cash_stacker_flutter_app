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
  String? totalKrwPurchaseAverageAmt;
  String? purchaseExchangeRate;
  String? currentExchangeRate;

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
    this.totalKrwPurchaseAverageAmt,
    this.purchaseExchangeRate,
    this.currentExchangeRate,
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
    String totalKrwPurchaseAverageAmt = '';
    String purchaseExchangeRate = '';
    String currentExchangeRate = '';

    /// =================================================================
    /// [현금] 🇰🇷 한화
    /// =================================================================
    if (assetVM.isCashAsset) {
      if (asset.currency?.currencyCode == 'KRW') {
        name = '현금';
        purchasePriceKrw = '-';
        purchasePriceForeign = '-';
        amount = '-';
        totalEvaluationKrw = addSymbol(
            addComma.format(assetVM.currentCashKrwTotalEvaluation),
            asset.currency?.currencySymbol);
        totalEvaluationForeign = '-';
        currentPriceKrw = '-';
        currentPriceForeign = '-';
        ratio = '${assetVM.ratioValue.toStringAsFixed(2)}%';
        profitLossRateKrw = '-';
        profitLossRateForeign = '-';
        initialPurchaseDate = '-';
      } else {
        /// =================================================================
        /// [현금] 외환
        /// =================================================================
        name = '현금(${asset.currency?.currencyCode})';
        purchasePriceKrw = '-';
        purchasePriceForeign = addSymbol(
            '${assetVM.averageExchangeRate}', asset.currency?.currencySymbol);
        amount = '-';
        totalEvaluationKrw = addSymbol(
            addComma.format(assetVM.currentCashKrwTotalEvaluation), '₩');
        totalEvaluationForeign = addSymbol(
            addComma.format(asset.inputCurrentPrice),
            asset.currency?.currencySymbol);
        currentPriceKrw = '-';
        currentPriceForeign = addSymbol(assetVM.exchangeRate.toStringAsFixed(2),
            asset.currency?.currencySymbol);
        ratio = '${assetVM.ratioValue.toStringAsFixed(2)}%';
        profitLossRateKrw = '-';
        profitLossRateForeign =
            '${assetVM.foreignExchangeRateProfitLossRate.toStringAsFixed(1)}%';
        initialPurchaseDate =
            DateFormat('yyyy.MM.dd').format(asset.initialPurchaseDate);
        totalKrwPurchaseAverageAmt = addSymbol(
            addComma.format(assetVM.averageTotalKrwPurchasePrice), '₩');
      }
    } else {
      /// =================================================================
      /// [자산] 🇰🇷 국내
      /// =================================================================
      if (asset.currency?.currencyCode == 'KRW') {
        name = asset.name;
        purchasePriceKrw =
            addSymbol(addComma.format(assetVM.averageKrwPrice), '₩');
        purchasePriceForeign = '-';
        amount = addComma.format(assetVM.totalQuantity);
        totalEvaluationKrw =
            addSymbol(addComma.format(assetVM.currentKrwTotalEvaluation), '₩');
        totalEvaluationForeign = '-';
        currentPriceKrw =
            addSymbol(addComma.format(assetVM.currentKrwPrice), '₩');
        currentPriceForeign = '-';
        ratio = '${assetVM.ratioValue.toStringAsFixed(2)}%';
        profitLossRateKrw = asset.inputCurrentPrice == 0
            ? '-'
            : '${assetVM.krwProfitLossRate.toStringAsFixed(2)}%';
        profitLossRateForeign = '-';
        initialPurchaseDate =
            DateFormat('yyyy.MM.dd').format(asset.initialPurchaseDate);
      } else {
        /// =================================================================
        /// [자산] 해외
        /// =================================================================
        name = asset.name;
        purchasePriceKrw =
            addSymbol(addComma.format(assetVM.averageKrwPrice), '₩');
        purchasePriceForeign = addSymbol(addComma.format(assetVM.averagePrice),
            asset.currency?.currencySymbol);
        amount = addComma.format(assetVM.totalQuantity);
        totalEvaluationKrw =
            addSymbol(addComma.format(assetVM.currentKrwTotalEvaluation), '₩');
        totalEvaluationForeign = addSymbol(
            addComma.format(assetVM.totalEvaluation),
            asset.currency?.currencySymbol);
        currentPriceKrw =
            addSymbol(addComma.format(assetVM.currentKrwPrice), '₩');
        currentPriceForeign = addSymbol(addComma.format(assetVM.currentPrice),
            asset.currency?.currencySymbol);
        ratio = '${assetVM.ratioValue.toStringAsFixed(2)}%';
        profitLossRateKrw = asset.inputCurrentPrice == 0
            ? '-'
            : '${assetVM.krwProfitLossRate.toStringAsFixed(2)}%';
        profitLossRateForeign = asset.inputCurrentPrice == 0
            ? '-'
            : '${assetVM.profitLossRate.toStringAsFixed(2)}%';
        initialPurchaseDate =
            DateFormat('yyyy.MM.dd').format(asset.initialPurchaseDate);
        purchaseExchangeRate = '${assetVM.averageExchangeRate}';
        currentExchangeRate = assetVM.exchangeRate.toStringAsFixed(2);
        totalKrwPurchaseAverageAmt = addSymbol(
            addComma.format(assetVM.averageTotalKrwPurchasePrice), '₩');
      }
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
      totalKrwPurchaseAverageAmt: totalKrwPurchaseAverageAmt,
      purchaseExchangeRate: purchaseExchangeRate,
      currentExchangeRate: currentExchangeRate,
    );
  }
}

String addSymbol(String value, String? symbol) {
  return '$symbol$value';
}
