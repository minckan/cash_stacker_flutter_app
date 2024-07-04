import 'package:cash_stacker_flutter_app/portfolio/component/new/portfolio_column.dart';
import 'package:cash_stacker_flutter_app/portfolio/component/new/portfolio_row.dart';

import 'package:cash_stacker_flutter_app/portfolio/screen/asset_transaction_list_screen.dart';
import 'package:cash_stacker_flutter_app/swaggers/src/model/asset.dart';
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

class PortfolioTable extends StatefulWidget {
  final List<Asset> assets;

  const PortfolioTable({
    super.key,
    required this.assets,
  });

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
            ...widget.assets.map(
              (asset) => PortfolioRow(
                  asset: asset,
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
                      builder: (context) => AssetTransactionListScreen(),
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
