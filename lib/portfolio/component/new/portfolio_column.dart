import 'package:cash_stacker_flutter_app/common/const/app_colors.dart';
import 'package:flutter/material.dart';

class PortfolioColumn extends StatelessWidget {
  const PortfolioColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: const TableBorder.symmetric(
          outside: BorderSide(color: AppColors.tableBorder, width: 1),
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
                    _buildTableColumCell(name: '종목명'),
                    _buildTableColumCell(name: '매입가\n(외화)'),
                    _buildTableColumCell(
                        name: '현재가\n(외화)', bottomBorder: false),
                  ],
                ),
              ),
            ),
            TableCell(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildTableColumCell(name: '현재 수익금액\n(외화)'),
                  _buildTableColumCell(name: '수량'),
                  _buildTableColumCell(name: '최초편입일', bottomBorder: false),
                ],
              ),
            ),
            TableCell(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildTableColumCell(name: '현재 수익률\n(외화)'),
                    _buildTableColumCell(name: '매입 총 금액\n(외화)'),
                    _buildTableColumCell(
                        name: '현재가 총 금액\n(외화)', bottomBorder: false),
                  ],
                ),
              ),
            ),
            TableCell(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildTableColumCell(name: '비중'),
                    _buildTableColumCell(name: '구매환율'),
                    _buildTableColumCell(name: '현재환율', bottomBorder: false),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Container _buildTableColumCell(
      {required String name, bool bottomBorder = true}) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.tableColumnBg,
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
}
