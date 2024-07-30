import 'package:cash_stacker_flutter_app/portfolio/component/portfolio_column.dart';
import 'package:cash_stacker_flutter_app/portfolio/component/portfolio_row.dart';
import 'package:cash_stacker_flutter_app/portfolio/screen/all_asset_transaction_list_screen.dart';

import 'package:cash_stacker_flutter_app/portfolio/screen/asset_transaction_list_screen.dart';
import 'package:cash_stacker_flutter_app/swaggers/openapi.dart';
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

class PortfolioTable extends StatefulWidget {
  const PortfolioTable({
    super.key,
    required this.rows,
  });

  final List<AssetInfo> rows;
  @override
  State<PortfolioTable> createState() => _PortfolioTableState();
}

class _PortfolioTableState extends State<PortfolioTable> {
  String tappedKey = '';
  @override
  Widget build(BuildContext context) {
    final safePadding = MediaQuery.of(context).padding.top;
    return StickyHeader(
        header: Column(
          children: [
            Container(
              height: safePadding,
              color: Colors.white,
            ),
            PortfolioColumn(tappedKey: tappedKey),
          ],
        ),
        content: Column(
          children: [
            ...widget.rows.map(
              (row) => PortfolioRow(
                  row: row,
                  onTap: (String key) {
                    setState(() {
                      tappedKey = key;
                    });
                  }),
            ),
            Container(
              height: 100,
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          const AllAssetTransactionListScreen(),
                    ),
                  );
                },
                child: const Text('거래내역 모두보기'),
              ),
            )
          ],
        ));
  }
}
