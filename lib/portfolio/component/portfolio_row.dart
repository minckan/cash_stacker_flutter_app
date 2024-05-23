import 'package:cash_stacker_flutter_app/common/utill/number_format.dart';
import 'package:cash_stacker_flutter_app/portfolio/model/asset_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import 'package:cash_stacker_flutter_app/common/const/app_colors.dart';

class PortfolioRow extends StatelessWidget {
  const PortfolioRow({
    super.key,
    required this.maxColumnWidth,
    required this.asset,
  });

  final double maxColumnWidth;
  final Asset asset;

  final rowMinHeight = 40.0;

  @override
  Widget build(BuildContext context) {
    const TextStyle rowStyle = TextStyle(
        fontSize: 14, color: Colors.black87, fontWeight: FontWeight.w500);
    final smallColumnWidth =
        (MediaQuery.of(context).size.width - maxColumnWidth - 20) / 3;

    const rightBorder = Border(
      right: BorderSide(color: AppColors.tableBorderLight, width: 1),
    );
    return Column(
      children: [
        SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 종목명
              Container(
                width: maxColumnWidth,
                alignment: Alignment.center,
                decoration: const BoxDecoration(border: rightBorder),
                child: Text(
                  asset.assetName,
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
                    addComma.format(asset.krwBuyingPrice),
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
                  addComma.format(asset.originalCurrencyBuyingPrice),
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
                  addComma.format(asset.buyingAmount),
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
        SizedBox(
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
                    addComma.format(asset.krwBuyingPrice * asset.buyingAmount),
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
                    addComma.format(asset.currentKrwPrice),
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
                child: const Text(
                  '${0}%',
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
        SizedBox(
          height: rowMinHeight,
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
                    addComma.format(0),
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
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6),
                  child: Text(
                    '${0}%',
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
                child: const Text(
                  '${0}%',
                  style: rowStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              // 최초 편입일
              Container(
                width: smallColumnWidth,
                alignment: Alignment.center,
                child: Text(
                  DateFormat('yyyy.MM.dd').format(asset.buyingDate),
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
