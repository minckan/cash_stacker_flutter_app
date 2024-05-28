import 'package:cash_stacker_flutter_app/common/utill/number_format.dart';
import 'package:cash_stacker_flutter_app/portfolio/model/asset_model.dart';
import 'package:cash_stacker_flutter_app/portfolio/viewmodel/asset_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

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
    const TextStyle rowStyle = TextStyle(
        fontSize: 14, color: Colors.black87, fontWeight: FontWeight.w500);
    final smallColumnWidth =
        (MediaQuery.of(context).size.width - maxColumnWidth - 20) / 3;

    const rightBorder = Border(
      right: BorderSide(color: AppColors.tableBorderLight, width: 1),
    );

    final assetViewModel = ref.read(assetViewModelProvider.notifier);
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 종목명
              Container(
                width: maxColumnWidth,
                alignment: Alignment.center,
                decoration: const BoxDecoration(border: rightBorder),
                child: Text(
                  asset.name,
                  style: rowStyle.copyWith(
                      decoration: TextDecoration.underline, letterSpacing: 0),
                  textAlign: TextAlign.left,
                ),
              ),
              // 매입가(원화)
              Container(
                width: smallColumnWidth,
                alignment: Alignment.centerRight,
                decoration: const BoxDecoration(border: rightBorder),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Text(
                    addComma.format(asset.averageKrwPrice),
                    style: rowStyle,
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
              // 매입가(외화)
              Container(
                width: smallColumnWidth,
                alignment: Alignment.center,
                decoration: const BoxDecoration(border: rightBorder),
                child: Text(
                  addComma.format(asset.averagePrice),
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
                  addComma.format(asset.totalQuantity),
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
          height: rowMinHeight,
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
                  child: Text(
                    addComma.format(
                        assetViewModel.getCurrentKrwTotalEvaluation(asset)),
                    style: rowStyle,
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
              // 현재가 (원화)
              Container(
                width: smallColumnWidth,
                alignment: Alignment.centerRight,
                decoration: const BoxDecoration(border: rightBorder),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Text(
                    addComma.format(assetViewModel.getCurrentKrwPrice(asset)),
                    style: rowStyle,
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
              // 현재가(외화)
              Container(
                width: smallColumnWidth,
                alignment: Alignment.center,
                decoration: const BoxDecoration(border: rightBorder),
                child: Text(
                  addComma.format(asset.currentPrice),
                  style: rowStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              // 비중
              Container(
                width: smallColumnWidth,
                alignment: Alignment.center,
                child: Text(
                  '10%',
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
                    addComma.format(asset.totalEvaluation),
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
                  child: Text(
                    asset.inputCurrentPrice == 0
                        ? '-'
                        : '${assetViewModel.getKrwProfitLossRate(asset).toStringAsFixed(2)}%',
                    style: rowStyle,
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
              // 평가 수익률 (외화)
              Container(
                width: smallColumnWidth,
                alignment: Alignment.center,
                decoration: const BoxDecoration(border: rightBorder),
                child: Text(
                  asset.inputCurrentPrice == 0
                      ? '-'
                      : '${asset.profitLossRate.toStringAsFixed(2)}%',
                  style: rowStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              // 최초 편입일
              Container(
                width: smallColumnWidth,
                alignment: Alignment.center,
                child: Text(
                  DateFormat('yyyy.MM.dd').format(asset.initialPurchaseDate),
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
}
