import 'package:cash_stacker_flutter_app/portfolio/component/portfolio_column.dart';
import 'package:cash_stacker_flutter_app/portfolio/component/portfolio_row.dart';

import 'package:cash_stacker_flutter_app/portfolio/screen/asset_transaction_list_screen.dart';
import 'package:cash_stacker_flutter_app/swaggers/src/model/asset.dart';
import 'package:flutter/material.dart';

import 'package:cash_stacker_flutter_app/common/const/app_colors.dart';
import 'package:sticky_headers/sticky_headers.dart';

class PortfolioTable extends StatelessWidget {
  const PortfolioTable({
    super.key,
    required this.assets,
  });

  final List<Asset> assets;

  @override
  Widget build(BuildContext context) {
    const double maxColumnWidth = 110;
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
          ),
          Container(
            height: 100,
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AssetTransactionListScreen(),
                  ),
                );
              },
              child: const Text('거래내역 모두보기'),
            ),
          )
        ],
      ),
    );
  }
}
