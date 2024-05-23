import 'package:cash_stacker_flutter_app/portfolio/component/portfolio_column.dart';
import 'package:cash_stacker_flutter_app/portfolio/component/portfolio_row.dart';
import 'package:cash_stacker_flutter_app/portfolio/model/asset_model.dart';
import 'package:cash_stacker_flutter_app/portfolio/viewmodel/asset_view_model.dart';
import 'package:cash_stacker_flutter_app/setting/model/category_model.dart';
import 'package:flutter/material.dart';

import 'package:cash_stacker_flutter_app/common/const/app_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sticky_headers/sticky_headers.dart';

class PortfolioTable extends ConsumerStatefulWidget {
  const PortfolioTable({super.key});

  @override
  ConsumerState<PortfolioTable> createState() => _PortfolioTableState();
}

class _PortfolioTableState extends ConsumerState<PortfolioTable> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const double maxColumnWidth = 130;
    final safePadding = MediaQuery.of(context).padding.top;

    final assets = ref.watch(assetViewModelProvider).toList();

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
}
