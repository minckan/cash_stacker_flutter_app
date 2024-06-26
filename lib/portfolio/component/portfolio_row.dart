import 'package:cash_stacker_flutter_app/common/utill/number_format.dart';
import 'package:cash_stacker_flutter_app/portfolio/model/asset_model.dart';
import 'package:cash_stacker_flutter_app/portfolio/model/table_row_asset.dart';
import 'package:cash_stacker_flutter_app/portfolio/screen/asset_transaction_list_screen.dart';
import 'package:cash_stacker_flutter_app/portfolio/viewmodel/asset_detail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cash_stacker_flutter_app/common/const/app_colors.dart';

class PortfolioRow extends ConsumerWidget {
  const PortfolioRow({
    super.key,
    required this.maxColumnWidth,
    required this.asset,
  });

  final double maxColumnWidth;
  final Asset asset;

  final rowMinHeight = 40.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assetVM = AssetDetailViewModel(asset: asset, ref: ref);
    final row = TableRowAsset.fromAsset(asset, assetVM);
    final hasTransactions = assetVM.transactions;

    return _buildRows(
      context: context,
      assetId: asset.id,
      row: row,
      hasTransactions: hasTransactions.isNotEmpty,
    );
  }

  Column _buildRows({
    required String assetId,
    required BuildContext context,
    required TableRowAsset row,
    required bool hasTransactions,
  }) {
    const TextStyle rowStyle = TextStyle(
        fontSize: 14, color: Colors.black87, fontWeight: FontWeight.w500);
    final smallColumnWidth =
        (MediaQuery.of(context).size.width - maxColumnWidth - 20) / 3;

    const rightBorder = Border(
      right: BorderSide(color: AppColors.tableBorderLight, width: 1),
    );

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 종목명
              GestureDetector(
                onTap: () {
                  if (hasTransactions) {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          AssetTransactionListScreen(assetId: assetId),
                    ));
                  }
                },
                child: Container(
                  width: maxColumnWidth,
                  alignment: Alignment.centerRight,
                  decoration: const BoxDecoration(border: rightBorder),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        row.name,
                        style: rowStyle.copyWith(
                            decoration: hasTransactions
                                ? TextDecoration.underline
                                : null,
                            letterSpacing: 0),
                        textAlign: TextAlign.left,
                      ),
                      if (hasTransactions) ...[
                        const SizedBox(width: 1),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: AppColors.chipViolet,
                          ),
                          width: 12,
                          height: 12,
                          child: const Icon(
                            Icons.add,
                            size: 12,
                            color: Colors.white,
                          ),
                        )
                      ]
                    ],
                  ),
                ),
              ),
              // 매입가(원화)
              Container(
                width: smallColumnWidth,
                alignment: Alignment.centerRight,
                decoration: const BoxDecoration(border: rightBorder),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Column(
                    children: [
                      Text(
                        row.buyingSinglePriceKrw,
                        style: rowStyle.copyWith(fontSize: 13),
                        textAlign: TextAlign.right,
                      ),
                      if (row.buyingExchangeRate != '')
                        Text(
                          '(${row.buyingExchangeRate})',
                          style: rowStyle.copyWith(
                            fontSize: 11,
                            color: AppColors.tableColumnLightText,
                          ),
                          textAlign: TextAlign.center,
                        ),
                    ],
                  ),
                ),
              ),
              // 매입가(외화)
              Container(
                width: smallColumnWidth,
                alignment: Alignment.center,
                decoration: const BoxDecoration(border: rightBorder),
                child: Text(
                  row.buyingSinglePriceForeign,
                  style: rowStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              // 수량
              Container(
                width: smallColumnWidth,
                alignment: Alignment.center,
                decoration: const BoxDecoration(border: rightBorder),
                child: Text(
                  row.amount,
                  style: rowStyle,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 1,
          color: AppColors.tableBorderLight,
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 평가액(원화환산 평가액)
              Container(
                width: maxColumnWidth,
                alignment: Alignment.centerRight,
                decoration: const BoxDecoration(border: rightBorder),
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          row.totalEvaluationAmountKrw,
                          style: rowStyle,
                          textAlign: TextAlign.right,
                        ),
                        if (row.totalBuyingAmountKrw != '')
                          Text(
                            '(${row.totalBuyingAmountKrw})',
                            style: rowStyle.copyWith(
                              fontSize: 12,
                              color: AppColors.tableColumnLightText,
                            ),
                            textAlign: TextAlign.right,
                          ),
                      ],
                    )),
              ),
              // 현재가 (원화)
              Container(
                width: smallColumnWidth,
                alignment: Alignment.centerRight,
                decoration: const BoxDecoration(border: rightBorder),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Column(
                    children: [
                      Text(
                        row.currentSinglePriceKrw,
                        style: rowStyle.copyWith(fontSize: 13),
                        textAlign: TextAlign.right,
                      ),
                      if (row.currentExchangeRate != '')
                        Text(
                          '(${row.currentExchangeRate})',
                          style: rowStyle.copyWith(
                            fontSize: 11,
                            color: AppColors.tableColumnLightText,
                          ),
                          textAlign: TextAlign.right,
                        )
                    ],
                  ),
                ),
              ),
              // 현재가(외화)
              Container(
                width: smallColumnWidth,
                alignment: Alignment.center,
                decoration: const BoxDecoration(border: rightBorder),
                child: Column(
                  children: [
                    Text(
                      row.currentSinglePriceForeign,
                      style: rowStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              // 비중
              Container(
                width: smallColumnWidth,
                alignment: Alignment.center,
                child: Text(
                  row.ratio,
                  style: rowStyle.copyWith(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 1,
          color: AppColors.tableBorderLight,
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 외화 평가액
              Container(
                width: maxColumnWidth,
                alignment: Alignment.centerRight,
                decoration: const BoxDecoration(border: rightBorder),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Text(
                    row.totalEvaluationAmountForeign,
                    style: rowStyle,
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
              // 평가 수익률 (원화환산)
              Container(
                width: smallColumnWidth,
                alignment: Alignment.centerRight,
                decoration: const BoxDecoration(border: rightBorder),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: _buildROIText(row, row.profitLossRateKrw),
                ),
              ),
              // 평가 수익률 (외화)
              Container(
                width: smallColumnWidth,
                alignment: Alignment.center,
                decoration: const BoxDecoration(border: rightBorder),
                child: _buildROIText(row, row.profitLossRateForeign),
              ),
              // 최초 편입일
              Container(
                width: smallColumnWidth,
                alignment: Alignment.center,
                child: Text(
                  row.initialPurchaseDate,
                  style: rowStyle.copyWith(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ],
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
