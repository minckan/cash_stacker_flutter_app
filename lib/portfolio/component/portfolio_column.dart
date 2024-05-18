import 'package:flutter/material.dart';
import 'package:cash_stacker_flutter_app/common/const/app_colors.dart';

class PortfolioColumn extends StatelessWidget {
  const PortfolioColumn({
    super.key,
    required this.maxColumnWidth,
  });

  final double maxColumnWidth;

  final columnHeight = 40.0;

  @override
  Widget build(BuildContext context) {
    const TextStyle columnStyle = TextStyle(
        fontSize: 12,
        color: AppColors.tableColumnText,
        fontWeight: FontWeight.w500);

    final smallColumnWidth =
        (MediaQuery.of(context).size.width - maxColumnWidth - 20) / 3;

    const rightBorder = Border(
      right: BorderSide(color: AppColors.tableBorderLight, width: 1),
    );

    return Column(
      children: [
        // 첫번째 Column Row
        SizedBox(
          height: columnHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: maxColumnWidth,
                alignment: Alignment.center,
                decoration: const BoxDecoration(border: rightBorder),
                child: const Text(
                  '종목명',
                  style: columnStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                width: smallColumnWidth,
                alignment: Alignment.center,
                decoration: const BoxDecoration(border: rightBorder),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '매입가',
                      style: columnStyle,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '(원화)',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        height: 1,
                        color: AppColors.tableColumnLightText,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Container(
                width: smallColumnWidth,
                alignment: Alignment.center,
                decoration: const BoxDecoration(border: rightBorder),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '매입가',
                      style: columnStyle,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '(외화)',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        height: 1,
                        color: AppColors.tableColumnLightText,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Container(
                width: smallColumnWidth,
                alignment: Alignment.center,
                decoration: const BoxDecoration(border: rightBorder),
                child: const Text(
                  '수량',
                  style: columnStyle,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        // Divider
        Container(
          height: 1,
          color: AppColors.tableBorderLight,
        ),

        // 두번째 Column Row
        SizedBox(
          height: columnHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.center,
                width: maxColumnWidth,
                decoration: const BoxDecoration(border: rightBorder),
                child: const Text(
                  '원화환산 평가액',
                  style: columnStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                width: smallColumnWidth,
                alignment: Alignment.center,
                decoration: const BoxDecoration(border: rightBorder),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '현재가',
                      style: columnStyle,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '(원화)',
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
                decoration: const BoxDecoration(border: rightBorder),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '현재가',
                      style: columnStyle,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '(외화)',
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
                child: const Text(
                  '비중',
                  style: columnStyle,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        // Divider
        Container(
          height: 1,
          color: AppColors.tableBorderLight,
        ),
        // 세번째 Column Row
        SizedBox(
          height: columnHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.center,
                width: maxColumnWidth,
                decoration: const BoxDecoration(border: rightBorder),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '외화 평가액',
                      style: columnStyle,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '(해외 자산)',
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
                decoration: const BoxDecoration(border: rightBorder),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '평가 수익률',
                      style: columnStyle.copyWith(fontSize: 12),
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
                decoration: const BoxDecoration(border: rightBorder),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '평가 수익률',
                      style: columnStyle.copyWith(fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      '(외화 수익률)',
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
                child: const Text(
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
