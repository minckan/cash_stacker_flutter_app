import 'package:cash_stacker_flutter_app/portfolio/model/asset_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:cash_stacker_flutter_app/common/const/app_colors.dart';

class PortfolioRow extends StatelessWidget {
  const PortfolioRow({
    super.key,
    required this.maxColumnWidth,
    required this.rowStyle,
    required this.asset,
  });

  final double maxColumnWidth;
  final TextStyle rowStyle;
  final Asset asset;

  @override
  Widget build(BuildContext context) {
    final smallColumnWidth =
        (MediaQuery.of(context).size.width - maxColumnWidth - 20) / 3;
    return Column(
      children: [
        SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 종목명
              Container(
                width: maxColumnWidth,
                alignment: Alignment.center,
                child: Text(
                  asset.assetName,
                  style: rowStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              // 매입가(현재환율)
              Container(
                width: smallColumnWidth,
                alignment: Alignment.center,
                child: Text(
                  asset.buyingPrice.toStringAsFixed(2),
                  style: rowStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              // 수량
              Container(
                width: smallColumnWidth,
                alignment: Alignment.center,
                child: Text(
                  asset.buyingAmount.toStringAsFixed(0),
                  style: rowStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              // 비중
              Container(
                width: smallColumnWidth,
                alignment: Alignment.center,
                child: Text(
                  '${asset.proportion.toStringAsFixed(1)}%',
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
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 평가액(원화환산 평가액)
              Container(
                alignment: Alignment.center,
                width: maxColumnWidth,
                child: Text(
                  asset.currentExchangedTotalValuation.toStringAsFixed(0),
                  style: rowStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              // 현재가 (현재환율)
              Container(
                width: smallColumnWidth,
                alignment: Alignment.center,
                child: Text(
                  asset.currentExchangedValuation.toStringAsFixed(0),
                  style: rowStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              // 수익률(원화환산 수익률)
              Container(
                width: smallColumnWidth,
                alignment: Alignment.center,
                child: Text(
                  '${asset.rateOfReturn.toStringAsFixed(1)}%',
                  style: rowStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              // 최초 편입일
              Container(
                width: smallColumnWidth,
                alignment: Alignment.center,
                child: Text(
                  DateFormat('yyyy.MM.dd').format(asset.initialBuyingDate),
                  style: rowStyle,
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
