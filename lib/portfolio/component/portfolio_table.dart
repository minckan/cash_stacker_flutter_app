import 'package:cash_stacker_flutter_app/portfolio/component/portfolio_column.dart';
import 'package:cash_stacker_flutter_app/portfolio/component/portfolio_row.dart';
import 'package:cash_stacker_flutter_app/portfolio/model/asset_model.dart';
import 'package:flutter/material.dart';

import 'package:cash_stacker_flutter_app/common/const/app_colors.dart';
import 'package:sticky_headers/sticky_headers.dart';

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
    const double maxColumnWidth = 130;
    final safePadding = MediaQuery.of(context).padding.top;

    return StickyHeader(
        header: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: safePadding,
              color: Colors.white,
            ),
            Container(
              decoration: const BoxDecoration(
                color: AppColors.tableColumnBg,
                border: Border(
                  top: BorderSide(color: AppColors.tableBorder),
                  bottom: BorderSide(color: AppColors.tableBorder),
                ),
              ),
              child: const PortfolioColumn(
                maxColumnWidth: maxColumnWidth,
              ),
            ),
          ],
        ),
        content: Column(
          children: [
            ...assets.map(
              (asset) => Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: AppColors.tableBorder),
                  ),
                ),
                child: PortfolioRow(
                  asset: asset,
                  maxColumnWidth: maxColumnWidth,
                ),
              ),
            )
          ],
        ));

    // return Column(
    //   children: [

    //   ],
    // );
  }

  List<Asset> getAssetData() {
    return [
      Asset(
          id: 'testsdkjflksjdklf',
          buyingCurrency: '엔',
          assetName: '엔화노출 미장기국채 ETF엔화노출 미장기국채 ETF엔화노출 미장기국채 ETF (2621)',
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
    ];
  }
}
