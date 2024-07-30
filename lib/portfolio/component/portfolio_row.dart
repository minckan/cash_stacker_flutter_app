import 'package:cash_stacker_flutter_app/common/const/app_colors.dart';
import 'package:cash_stacker_flutter_app/common/providers/exchange_rate_provider.dart';
import 'package:cash_stacker_flutter_app/common/utill/number_format.dart';
import 'package:cash_stacker_flutter_app/portfolio/screen/asset_transaction_list_screen.dart';
import 'package:cash_stacker_flutter_app/swaggers/openapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PortfolioRow extends ConsumerWidget {
  final AssetInfo row;
  final void Function(String) onTap;

  const PortfolioRow({
    super.key,
    required this.row,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const hasTransactions = true;

    // final exchanges = ref.watch(exchangeRateProvider);

    // if (exchanges.isEmpty) {
    //   return const Padding(
    //     padding: EdgeInsets.all(8.0),
    //     child: Center(
    //       child: CircularProgressIndicator(),
    //     ),
    //   );
    // }

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
                      // 종목명
                      _buildTableRowCell(
                        key: 'name',
                        child: _buildRowName(
                          context: context,
                          name: row.name ?? '',
                          assetId: int.parse('${row.id}'),
                          hasTransactions: hasTransactions,
                        ),
                      ),
                      // 매입가\n(외화)
                      _buildTableRowCell(
                        key: 'buyingSinglePrice',
                        child: _buildCommonText(
                          text: _buildKrwAndForeignStr(
                            row.buyingSinglePriceKrw,
                            row.buyingSinglePriceForeign,
                          ),
                        ),
                      ),
                      // 현재가\n(외화)
                      _buildTableRowCell(
                        key: 'currentSinglePrice',
                        child: _buildCommonText(
                          text: _buildKrwAndForeignStr(
                            row.currentSinglePriceKrw,
                            row.currentSinglePriceForeign,
                          ),
                        ),
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
                    // 원화평가수익\n(수익률)
                    _buildTableRowCell(
                      key: 'totalEvaluationAmountKrw',
                      child: Column(
                        children: [
                          _buildCommonText(
                              text: addComma(row.totalEvaluationAmountKrw) ??
                                  '-'),
                          if (row.profitLossRateKrw != null)
                            _buildROIText(
                                row, row.profitLossRateKrw?.toStringAsFixed(2))
                        ],
                      ),
                    ),
                    // 수량
                    _buildTableRowCell(
                      key: 'amount',
                      child: _buildCommonText(text: '${row.amount}'),
                    ),
                    // 최초편입일
                    _buildTableRowCell(
                      key: 'initialPurchaseDate',
                      child: _buildCommonText(
                          text: row.initialPurchaseDate.toString()),
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
                      // 외화평가수익\n(수익률)
                      _buildTableRowCell(
                        key: 'totalEvaluationAmountForeign',
                        child: Column(
                          children: [
                            if (row.totalEvaluationAmountForeign != null ||
                                row.profitLossRateForeign != null) ...[
                              _buildCommonText(
                                  text: addComma(
                                          row.totalEvaluationAmountForeign) ??
                                      '-'),
                              _buildROIText(row,
                                  '${row.profitLossRateForeign?.toStringAsFixed(2)}'),
                            ] else
                              const Text('-')
                          ],
                        ),
                      ),
                      // 매입 총 금액\n(외화)
                      _buildTableRowCell(
                        key: 'totalBuyingAmount',
                        child: _buildCommonText(
                          text: _buildKrwAndForeignStr(
                            row.totalBuyingAmountKrw,
                            row.totalBuyingAmountForeign,
                          ),
                        ),
                      ),
                      // 현재가 총 금액\n(외화)
                      _buildTableRowCell(
                        key: 'totalCurrentAmount',
                        child: _buildCommonText(
                          text: _buildKrwAndForeignStr(
                            row.totalCurrentAmountKrw,
                            row.totalCurrentAmountForeign,
                          ),
                        ),
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
                      // 비중
                      _buildTableRowCell(
                        key: 'ratio',
                        child: _buildCommonText(
                            text: '${row.ratio?.toStringAsFixed(2)}%'),
                      ),
                      // 구매환율
                      _buildTableRowCell(
                        key: 'buyingExchangeRate',
                        child: _buildCommonText(
                            text: addComma(row.buyingExchangeRate) ?? '-'),
                      ),
                      // 현재환율
                      _buildTableRowCell(
                        key: 'currentExchangeRate',
                        child: _buildCommonText(text: '-'),
                        bottomBorder: false,
                      ),
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

  String _buildKrwAndForeignStr(
    num? krw,
    num? foreign,
  ) {
    if (krw == null) {
      return '-';
    }
    if (foreign == null) {
      return '${addComma(krw)}';
    }
    return '${addComma(krw)}\n(${addComma(foreign)})';
  }

  Widget _buildTableRowCell({
    required String key,
    required Widget child,
    bool bottomBorder = true,
  }) {
    return GestureDetector(
      onTap: () => onTap(key),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        child: Container(
          height: 50,
          // padding: const EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            border: bottomBorder
                ? const Border(
                    bottom:
                        BorderSide(color: AppColors.tableBorderLight, width: 1))
                : null,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: child,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRowName({
    required BuildContext context,
    required String name,
    required int assetId,
    required bool hasTransactions,
  }) {
    return GestureDetector(
      onTap: () {
        if (hasTransactions) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AssetTransactionListScreen(assetId: assetId),
          ));
        }
      },
      child: Container(
        alignment: Alignment.centerRight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
                decoration: hasTransactions ? TextDecoration.underline : null,
                letterSpacing: 0,
              ),
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
    );
  }

  Widget _buildCommonText({
    required String text,
  }) {
    if (text == 'null') {
      return const Text('-');
    }
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 12,
        color: AppColors.tableColumnText,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildROIText(AssetInfo row, String? text) {
    if (text == null || text == 'null') {
      return const Text('-');
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
