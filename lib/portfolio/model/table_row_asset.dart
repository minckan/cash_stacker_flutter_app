import 'package:cash_stacker_flutter_app/common/utill/number_format.dart';
import 'package:cash_stacker_flutter_app/portfolio/model/asset_model.dart';
import 'package:cash_stacker_flutter_app/portfolio/viewmodel/asset_detail_view_model.dart';
import 'package:intl/intl.dart';

class TableRowAsset {
  final String name;
  final String buyingSinglePriceKrw;
  final String buyingSinglePriceForeign;
  final String amount;
  final String totalEvaluationAmountKrw;
  final String totalEvaluationAmountForeign;
  final String currentSinglePriceKrw;
  final String currentSinglePriceForeign;
  final String ratio;
  final String profitLossRateKrw;
  final String profitLossRateForeign;
  final String initialPurchaseDate;
  String? totalBuyingAmountKrw;
  String? totalBuyingAmountForeign;
  String? totalCurrentAmountKrw;
  String? totalCurrentAmountForeign;
  String? buyingExchangeRate;
  String? currentExchangeRate;

  TableRowAsset({
    required this.name,
    required this.buyingSinglePriceKrw,
    required this.buyingSinglePriceForeign,
    required this.amount,
    required this.totalEvaluationAmountKrw,
    required this.totalEvaluationAmountForeign,
    required this.currentSinglePriceKrw,
    required this.currentSinglePriceForeign,
    required this.ratio,
    required this.profitLossRateKrw,
    required this.profitLossRateForeign,
    required this.initialPurchaseDate,
    this.totalBuyingAmountKrw,
    this.totalBuyingAmountForeign,
    this.totalCurrentAmountKrw,
    this.totalCurrentAmountForeign,
    this.buyingExchangeRate,
    this.currentExchangeRate,
  });

  factory TableRowAsset.fromAsset(Asset asset, AssetDetailViewModel assetVM) {
    String name;
    String buyingSinglePriceKrw;
    String buyingSinglePriceForeign;
    String amount;
    String totalEvaluationAmountKrw;
    String totalEvaluationAmountForeign;
    String currentSinglePriceKrw;
    String currentSinglePriceForeign;
    String ratio;
    String profitLossRateKrw;
    String profitLossRateForeign;
    String initialPurchaseDate;
    String totalBuyingAmountKrw = '';
    String totalBuyingAmountForeign = '';
    String totalCurrentAmountKrw = '';
    String totalCurrentAmountForeign = '';
    String buyingExchangeRate = '';
    String currentExchangeRate = '';

    /// =================================================================
    /// [현금] 🇰🇷 한화
    /// =================================================================

    if (assetVM.isCashAsset) {
      if (asset.currencyCode == 'KRW') {
        name = '현금';
        buyingSinglePriceKrw = '-';
        buyingSinglePriceForeign = '-';
        amount = '-';
        totalEvaluationAmountKrw = '-';
        totalEvaluationAmountForeign = '-';
        currentSinglePriceKrw = '-';
        currentSinglePriceForeign = '-';
        ratio = '${assetVM.ratioValue.toStringAsFixed(2)}%';
        profitLossRateKrw = '-';
        profitLossRateForeign = '-';
        initialPurchaseDate = '-';
        totalBuyingAmountKrw = addSymbol(
            addComma.format(assetVM.totalBuyingAmountKrw),
            // asset.currency?.currencySymbol,
            '');

        totalBuyingAmountForeign = '-';
        totalCurrentAmountKrw = '-';
        totalCurrentAmountForeign = '-';
        buyingExchangeRate = '-';
        currentExchangeRate = '-';
      } else {
        /// =================================================================
        /// [현금] 외환
        /// =================================================================
        name = '외환(${asset.currencyCode})';
        amount = '-';
        buyingSinglePriceKrw = '-';
        buyingSinglePriceForeign = '-';
        totalEvaluationAmountKrw = addSymbol(
            addComma.format(assetVM.totalCashEvaluationAmountForeign), '₩');
        totalEvaluationAmountForeign = '-';
        currentSinglePriceKrw = '-';
        currentSinglePriceForeign = '-';
        ratio = '${assetVM.ratioValue.toStringAsFixed(2)}%';
        profitLossRateKrw =
            '${assetVM.foreignCashProfitLossRate.toStringAsFixed(1)}%';
        profitLossRateForeign = '-';

        initialPurchaseDate =
            DateFormat('yyyy.MM.dd').format(asset.initialPurchaseDate);

        buyingExchangeRate = addSymbol(
          '${assetVM.averageExchangeRate}',
          // asset.currency?.currencySymbol
        );
        currentExchangeRate = addSymbol(
          assetVM.exchangeRate.toStringAsFixed(2),
          // asset.currency?.currencySymbol
        );

        totalCurrentAmountKrw = addSymbol(
            addComma.format(assetVM.totalCurrentCashAmountForeignKrw), '₩');
        totalCurrentAmountForeign = addSymbol(
          addComma.format(assetVM.totalBuyingAmountForeign),
          // asset.currency?.currencySymbol,
        );
        totalBuyingAmountKrw =
            addSymbol(addComma.format(assetVM.totalBuyingAmountKrw), '₩');
        totalBuyingAmountForeign = addSymbol(
          addComma.format(assetVM.totalBuyingAmountForeign),
          // asset.currency?.currencySymbol
        );
      }
    } else {
      /// =================================================================
      /// [자산] 🇰🇷 국내
      /// =================================================================
      if (asset.currencyCode == 'KRW') {
        name = asset.name;
        ratio = '${assetVM.ratioValue.toStringAsFixed(2)}%';
        amount = addComma.format(assetVM.totalQuantity);
        initialPurchaseDate =
            DateFormat('yyyy.MM.dd').format(asset.initialPurchaseDate);
        buyingSinglePriceKrw =
            addSymbol(addComma.format(assetVM.buyingSinglePriceKrw), '₩');
        buyingSinglePriceForeign = '-';
        totalBuyingAmountKrw =
            addSymbol(addComma.format(assetVM.totalBuyingAmountKrw), '₩');
        totalBuyingAmountForeign = '-';
        totalEvaluationAmountKrw =
            addSymbol(addComma.format(assetVM.totalEvaluationAmountKrw), '₩');
        totalEvaluationAmountForeign = '-';
        currentSinglePriceKrw =
            addSymbol(addComma.format(assetVM.currentSinglePriceKrw), '₩');
        currentSinglePriceForeign = '-';
        totalCurrentAmountForeign = '-';
        profitLossRateKrw = asset.balance == 0
            ? '-'
            : '${assetVM.profitLossRateKrw.toStringAsFixed(2)}%';
        profitLossRateForeign = '-';
        currentExchangeRate = '-';
        buyingExchangeRate = '-';
        totalCurrentAmountKrw =
            addSymbol(addComma.format(assetVM.totalCurrentAmountKrw), '₩');
      } else {
        /// =================================================================
        /// [자산] 해외
        /// =================================================================

        name = asset.name;
        amount = addComma.format(assetVM.totalQuantity);
        ratio = '${assetVM.ratioValue.toStringAsFixed(2)}%';
        buyingSinglePriceKrw =
            addSymbol(addComma.format(assetVM.buyingSinglePriceKrw), '₩');
        buyingSinglePriceForeign = addSymbol(
          addComma.format(assetVM.buyingSinglePriceForeign),
          // asset.currency?.currencySymbol,
        );
        totalEvaluationAmountKrw = assetVM.totalEvaluationAmountKrw != 0
            ? addSymbol(addComma.format(assetVM.totalEvaluationAmountKrw), '₩')
            : '-';
        totalEvaluationAmountForeign = assetVM.totalEvaluationAmountForeign != 0
            ? addSymbol(
                addComma.format(assetVM.totalEvaluationAmountForeign),
                // asset.currency?.currencySymbol,
              )
            : '-';
        currentSinglePriceKrw = assetVM.currentSinglePriceKrw != 0
            ? addSymbol(addComma.format(assetVM.currentSinglePriceKrw), '₩')
            : '-';
        currentSinglePriceForeign = assetVM.currentSinglePriceForeign != 0
            ? addSymbol(
                addComma.format(assetVM.currentSinglePriceForeign),
                // asset.currency?.currencySymbol,
              )
            : '-';
        profitLossRateKrw = asset.balance == 0
            ? '-'
            : '${assetVM.profitLossRateKrw.toStringAsFixed(2)}%';
        profitLossRateForeign = asset.balance == 0
            ? '-'
            : '${assetVM.profitLossRateForeign.toStringAsFixed(2)}%';
        initialPurchaseDate =
            DateFormat('yyyy.MM.dd').format(asset.initialPurchaseDate);
        buyingExchangeRate = assetVM.averageExchangeRate.toStringAsFixed(2);
        currentExchangeRate = assetVM.exchangeRate.toStringAsFixed(2);
        totalCurrentAmountKrw = assetVM.totalCurrentAmountKrw != 0
            ? addSymbol(addComma.format(assetVM.totalCurrentAmountKrw), '₩')
            : '-';
        totalCurrentAmountForeign = assetVM.totalCurrentAmountForeign != 0
            ? addSymbol(
                addComma.format(assetVM.totalCurrentAmountForeign),
                // asset.currency?.currencySymbol,
              )
            : '-';
        totalBuyingAmountKrw =
            addSymbol(addComma.format(assetVM.totalBuyingAmountKrw), '₩');
        totalBuyingAmountForeign = addSymbol(
          addComma.format(assetVM.totalBuyingAmountForeign),
          // asset.currency?.currencySymbol,
        );
      }
    }
    return TableRowAsset(
      name: name,
      amount: amount,
      ratio: ratio,
      initialPurchaseDate: initialPurchaseDate,
      buyingSinglePriceKrw: buyingSinglePriceKrw,
      buyingSinglePriceForeign: buyingSinglePriceForeign,
      totalEvaluationAmountKrw: totalEvaluationAmountKrw,
      totalEvaluationAmountForeign: totalEvaluationAmountForeign,
      currentSinglePriceKrw: currentSinglePriceKrw,
      currentSinglePriceForeign: currentSinglePriceForeign,
      profitLossRateKrw: profitLossRateKrw,
      profitLossRateForeign: profitLossRateForeign,
      totalBuyingAmountKrw: totalBuyingAmountKrw,
      totalBuyingAmountForeign: totalBuyingAmountForeign,
      totalCurrentAmountKrw: totalCurrentAmountKrw,
      totalCurrentAmountForeign: totalCurrentAmountForeign,
      buyingExchangeRate: buyingExchangeRate,
      currentExchangeRate: currentExchangeRate,
    );
  }
}

String addSymbol(String value, String? symbol) {
  if (value.contains('-')) {
    final value0 = value.replaceAll('-', '');
    return '- $symbol$value0';
  } else if (value == '0' || value == '0.0' || value == '') {
    return '';
  }
  return '$symbol$value';
}
