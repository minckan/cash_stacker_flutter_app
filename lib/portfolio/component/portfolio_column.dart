import 'package:flutter/material.dart';
import 'package:cash_stacker_flutter_app/common/const/app_colors.dart';

class PortfolioColumn extends StatelessWidget {
  const PortfolioColumn({
    super.key,
    required this.maxColumnWidth,
    required this.columnStyle,
  });

  final double maxColumnWidth;
  final TextStyle columnStyle;

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
              Container(
                width: maxColumnWidth,
                alignment: Alignment.center,
                child: Text(
                  '종목명',
                  style: columnStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                width: smallColumnWidth,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '매입가',
                      style: columnStyle,
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      '(매입환율)',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          height: 1,
                          color: AppColors.tableColumnLightText),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Container(
                width: smallColumnWidth,
                alignment: Alignment.center,
                child: Text(
                  '수량',
                  style: columnStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                width: smallColumnWidth,
                alignment: Alignment.center,
                child: Text(
                  '비중',
                  style: columnStyle,
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
              Container(
                alignment: Alignment.center,
                width: maxColumnWidth,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '평가액',
                      style: columnStyle,
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      '(원화환산 평가액)',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          height: 1,
                          color: AppColors.tableColumnLightText),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Container(
                width: smallColumnWidth,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '현재가',
                      style: columnStyle,
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      '(현재환율)',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          height: 1,
                          color: AppColors.tableColumnLightText),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Container(
                width: smallColumnWidth,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '수익률',
                      style: columnStyle,
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      '(원화환산 수익률)',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          height: 1,
                          color: AppColors.tableColumnLightText),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Container(
                width: smallColumnWidth,
                alignment: Alignment.center,
                child: Text(
                  '최초\n편입일',
                  style: columnStyle,
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
