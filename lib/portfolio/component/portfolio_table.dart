import 'package:cash_stacker_flutter_app/common/const/color.dart';
import 'package:cash_stacker_flutter_app/portfolio/component/portfolio_column.dart';
import 'package:cash_stacker_flutter_app/portfolio/component/portfolio_row.dart';
import 'package:cash_stacker_flutter_app/portfolio/model/asset_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PortfolioTable extends StatefulWidget {
  const PortfolioTable({super.key});

  @override
  State<PortfolioTable> createState() => _PortfolioTableState();
}

class _PortfolioTableState extends State<PortfolioTable> {
  List<Asset> assets = <Asset>[];

  @override
  void initState() {
    super.initState();
    assets = getAssetData();
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle columnStyle = TextStyle(
        fontSize: 14,
        color: TABLE_COLUMN_TEXT_COLOR,
        fontWeight: FontWeight.w500);
    const TextStyle rowStyle = TextStyle(
        fontSize: 14, color: Colors.black87, fontWeight: FontWeight.w500);

    const double maxColumnWidth = 130;

    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: TABLE_COLUMN_BG_COLOR,
            border: Border(
              top: BorderSide(color: TABLE_BORDER_COLOR),
              bottom: BorderSide(color: TABLE_BORDER_COLOR),
            ),
          ),
          child: const PortfolioColumn(
              maxColumnWidth: maxColumnWidth, columnStyle: columnStyle),
        ),
        ...assets.map(
          (asset) => Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: TABLE_BORDER_COLOR),
              ),
            ),
            child: PortfolioRow(
                asset: asset,
                maxColumnWidth: maxColumnWidth,
                rowStyle: rowStyle),
          ),
        )
      ],
    );
  }

  List<Asset> getAssetData() {
    return [
      Asset(
          buyingCurrency: '엔',
          assetName: '엔화노출 미장기국채 ETF (2621)',
          assetCategory: '채권',
          buyingPrice: 1000,
          buyingAmount: 100,
          proportion: 100,
          currentOriginalTotalValuation: 120000,
          currentOriginalValuation: 12000,
          initialBuyingDate: DateTime.now(),
          buyingCurrencyUnit: '엔',
          exchangeRate: 890,
          currentExchangedTotalValuation: 890000,
          currentExchangedValuation: 890,
          rateOfReturn: 0.6),
      Asset(
          buyingCurrency: '엔',
          assetName: '엔화노출 미장기국채 ETF (2621)',
          assetCategory: '채권',
          buyingPrice: 1000,
          buyingAmount: 100,
          proportion: 100,
          currentOriginalTotalValuation: 120000,
          currentOriginalValuation: 12000,
          initialBuyingDate: DateTime.now(),
          buyingCurrencyUnit: '엔',
          exchangeRate: 890,
          currentExchangedTotalValuation: 890000,
          currentExchangedValuation: 890,
          rateOfReturn: 0.6),
      Asset(
          buyingCurrency: '엔',
          assetName: '엔화노출 미장기국채 ETF (2621)',
          assetCategory: '채권',
          buyingPrice: 1000,
          buyingAmount: 100,
          proportion: 100,
          currentOriginalTotalValuation: 120000,
          currentOriginalValuation: 12000,
          initialBuyingDate: DateTime.now(),
          buyingCurrencyUnit: '엔',
          exchangeRate: 890,
          currentExchangedTotalValuation: 890000,
          currentExchangedValuation: 890,
          rateOfReturn: 0.6),
      Asset(
          buyingCurrency: '엔',
          assetName: '엔화노출 미장기국채 ETF (2621)',
          assetCategory: '채권',
          buyingPrice: 1000,
          buyingAmount: 100,
          proportion: 100,
          currentOriginalTotalValuation: 120000,
          currentOriginalValuation: 12000,
          initialBuyingDate: DateTime.now(),
          buyingCurrencyUnit: '엔',
          exchangeRate: 890,
          currentExchangedTotalValuation: 890000,
          currentExchangedValuation: 890,
          rateOfReturn: 0.6),
      Asset(
          buyingCurrency: '엔',
          assetName: '엔화노출 미장기국채 ETF (2621)',
          assetCategory: '채권',
          buyingPrice: 1000,
          buyingAmount: 100,
          proportion: 100,
          currentOriginalTotalValuation: 120000,
          currentOriginalValuation: 12000,
          initialBuyingDate: DateTime.now(),
          buyingCurrencyUnit: '엔',
          exchangeRate: 890,
          currentExchangedTotalValuation: 890000,
          currentExchangedValuation: 890,
          rateOfReturn: 0.6),
      Asset(
          buyingCurrency: '엔',
          assetName: '엔화노출 미장기국채 ETF (2621)',
          assetCategory: '채권',
          buyingPrice: 1000,
          buyingAmount: 100,
          proportion: 100,
          currentOriginalTotalValuation: 120000,
          currentOriginalValuation: 12000,
          initialBuyingDate: DateTime.now(),
          buyingCurrencyUnit: '엔',
          exchangeRate: 890,
          currentExchangedTotalValuation: 890000,
          currentExchangedValuation: 890,
          rateOfReturn: 0.6)
    ];
  }
}
