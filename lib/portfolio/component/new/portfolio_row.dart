import 'package:cash_stacker_flutter_app/common/const/app_colors.dart';
import 'package:cash_stacker_flutter_app/common/utill/number_format.dart';
import 'package:cash_stacker_flutter_app/portfolio/model/asset_model.dart';
import 'package:cash_stacker_flutter_app/portfolio/model/table_row_asset.dart';
import 'package:cash_stacker_flutter_app/portfolio/viewmodel/asset_detail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PortfolioRow extends ConsumerWidget {
  final Asset asset;

  const PortfolioRow({
    super.key,
    required this.asset,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assetVM = AssetDetailViewModel(asset: asset, ref: ref);
    final row = TableRowAsset.fromAsset(asset, assetVM);
    final hasTransactions = assetVM.transactions;

    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.tableBorder),
          left: BorderSide(color: AppColors.tableBorder),
          right: BorderSide(color: AppColors.tableBorder),
        ),
      ),
      child: Table(
        border: const TableBorder.symmetric(
            inside: BorderSide(color: AppColors.tableBorderLight, width: 1)),
        columnWidths: const {
          0: FlexColumnWidth(1),
          1: FlexColumnWidth(1),
          2: FlexColumnWidth(1),
          3: FlexColumnWidth(1),
        },
        children: [
          // 헤더 행
          TableRow(
            children: [
              TableCell(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildTableRowCell(name: row.name),
                      _buildTableRowCell(
                          name:
                              '${row.purchasePriceKrw}\n(${row.purchasePriceForeign})'),
                      _buildTableRowCell(
                          name:
                              '${row.currentPriceKrw}\n(${row.currentPriceForeign})',
                          bottomBorder: false),
                    ],
                  ),
                ),
              ),
              TableCell(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildTableRowCell(name: '현재 수익금액\n(외화)'),
                    _buildTableRowCell(name: row.amount),
                    _buildTableRowCell(
                        name: row.initialPurchaseDate, bottomBorder: false),
                  ],
                ),
              ),
              TableCell(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildTableRowCell(
                          name:
                              '${row.profitLossRateKrw}\n(${row.profitLossRateForeign})'),
                      _buildTableRowCell(
                          name: '${row.totalKrwPurchaseAverageAmt}\n(외화)'),
                      _buildTableRowCell(
                          name:
                              '${row.totalEvaluationKrw}\n(${row.totalEvaluationForeign})',
                          bottomBorder: false),
                    ],
                  ),
                ),
              ),
              TableCell(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildTableRowCell(name: row.ratio),
                      _buildTableRowCell(name: row.purchaseExchangeRate ?? '-'),
                      _buildTableRowCell(
                          name: row.currentExchangeRate ?? '-',
                          bottomBorder: false),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container _buildTableRowCell(
      {required String name, bool bottomBorder = true}) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: bottomBorder
            ? const Border(
                bottom: BorderSide(color: AppColors.tableBorderLight, width: 1))
            : null,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.tableColumnText,
                    fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    );
  }

  Widget _buildROIText(TableRowAsset row, String text) {
    if (text == '-') {
      return Text(
        text,
        style: const TextStyle(
            fontSize: 14, color: Colors.black87, fontWeight: FontWeight.w500),
        textAlign: TextAlign.right,
      );
    }
    final condition = double.parse(removePercent(text));

    final isIncrease = condition > 0;
    final isStatic = condition == 0.0;

    final textColor = isIncrease
        ? AppColors.buy
        : isStatic
            ? AppColors.bodyText
            : AppColors.sell;

    const increaseIcon = Icons.arrow_drop_up;
    const decreaseIcon = Icons.arrow_drop_down;

    final icon = isIncrease
        ? Icon(
            increaseIcon,
            color: textColor,
          )
        : isStatic
            ? const Text('(-)')
            : Icon(decreaseIcon, color: textColor);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon,
        Text(
          text,
          style: TextStyle(
              color: textColor, fontSize: 12, fontWeight: FontWeight.w600),
          textAlign: TextAlign.right,
        ),
      ],
    );
  }
}
