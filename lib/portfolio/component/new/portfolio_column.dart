import 'package:cash_stacker_flutter_app/common/const/app_colors.dart';
import 'package:flutter/material.dart';

class PortfolioColumn extends StatelessWidget {
  final String tappedKey;
  const PortfolioColumn({
    super.key,
    required this.tappedKey,
  });

  @override
  Widget build(BuildContext context) {
    return Table(
      border: const TableBorder.symmetric(
          outside: BorderSide(color: AppColors.tableBorder, width: 1),
          inside: BorderSide(color: AppColors.tableBorderLight, width: 1)),
      columnWidths: const {
        0: FlexColumnWidth(1.4),
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
                    TableColumnCell(
                      columnKey: 'name',
                      name: '종목명',
                      tappedKey: tappedKey,
                    ),
                    TableColumnCell(
                      columnKey: 'buyingSinglePrice',
                      name: '매입가\n(외화)',
                      tappedKey: tappedKey,
                    ),
                    TableColumnCell(
                      columnKey: 'currentSinglePrice',
                      name: '현재가\n(외화)',
                      tappedKey: tappedKey,
                      bottomBorder: false,
                    ),
                  ],
                ),
              ),
            ),
            TableCell(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TableColumnCell(
                    columnKey:
                        'totalEvaluationAmountKrw', // 수익률 : profitLossRateKrw
                    name: '원화평가수익\n(수익률)',
                    tappedKey: tappedKey,
                  ),
                  TableColumnCell(
                    columnKey: 'amount',
                    name: '수량',
                    tappedKey: tappedKey,
                  ),
                  TableColumnCell(
                    columnKey: 'initialPurchaseDate',
                    name: '최초편입일',
                    tappedKey: tappedKey,
                    bottomBorder: false,
                  ),
                ],
              ),
            ),
            TableCell(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TableColumnCell(
                      columnKey:
                          'totalEvaluationAmountForeign', // 수익률 : profitLossRateForeign
                      name: '외화평가수익\n(수익률)',
                      tappedKey: tappedKey,
                    ),
                    TableColumnCell(
                      columnKey: 'totalBuyingAmount',
                      name: '매입 총 금액\n(외화)',
                      tappedKey: tappedKey,
                    ),
                    TableColumnCell(
                      columnKey: 'totalCurrentAmount',
                      name: '현재가 총 금액\n(외화)',
                      tappedKey: tappedKey,
                      bottomBorder: false,
                    ),
                  ],
                ),
              ),
            ),
            TableCell(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TableColumnCell(
                      columnKey: 'ratio',
                      name: '비중',
                      tappedKey: tappedKey,
                    ),
                    TableColumnCell(
                      columnKey: 'buyingExchangeRate',
                      name: '매입환율',
                      tappedKey: tappedKey,
                    ),
                    TableColumnCell(
                      columnKey: 'currentExchangeRate',
                      name: '현재환율',
                      tappedKey: tappedKey,
                      bottomBorder: false,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class TableColumnCell extends StatefulWidget {
  final String name;
  final bool bottomBorder;
  final String tappedKey;
  final String columnKey;

  const TableColumnCell({
    super.key,
    required this.name,
    required this.tappedKey,
    required this.columnKey,
    this.bottomBorder = true,
  });

  @override
  State<TableColumnCell> createState() => _TableColumnCellState();
}

class _TableColumnCellState extends State<TableColumnCell> {
  Color backgroundColor = AppColors.tableColumnBg;

  void _increaseFontSize() {
    setState(() {
      backgroundColor = AppColors.switchOn;
    });

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        backgroundColor = AppColors.tableColumnBg;
      });
    });
  }

  @override
  void didUpdateWidget(TableColumnCell oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.tappedKey == widget.columnKey) {
      _increaseFontSize();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 50,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: widget.bottomBorder
            ? const Border(
                bottom: BorderSide(color: AppColors.tableBorderLight, width: 1))
            : null,
      ),
      child: Center(
        child: Text(
          widget.name,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 12.0,
              color: AppColors.tableColumnText,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
