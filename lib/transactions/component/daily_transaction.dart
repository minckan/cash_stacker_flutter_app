import 'package:cash_stacker_flutter_app/common/utill/number_format.dart';
import 'package:cash_stacker_flutter_app/src/model/transaction.dart';

import 'package:cash_stacker_flutter_app/transactions/model/transaction_model.dart';
import 'package:cash_stacker_flutter_app/transactions/viewmodels/transactions_view_model.dart';
import 'package:flutter/material.dart';

import 'package:cash_stacker_flutter_app/common/const/app_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class DailyTransaction extends ConsumerWidget {
  const DailyTransaction({
    super.key,
    required this.transactionSummaries,
  });

  final List<TransactionSummary> transactionSummaries;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (transactionSummaries.isEmpty) {
      return const Center(
        child: Text('데이터가 없습니다.'),
      );
    }
    return ListView.builder(
      itemBuilder: (context, index) {
        final summary = transactionSummaries[index];
        return buildDailyContent(summary);
      },
      itemCount: transactionSummaries.length,
    );
  }

  Widget buildDailyContent(
    TransactionSummary summary,
  ) {
    const TextStyle normalStyle = TextStyle(
      color: AppColors.bodyTextDark,
      fontSize: 12,
    );

    DateFormat dateFormat = DateFormat('EEEE', 'ko');
    DateTime date = summary.date;
    num totalIncome = summary.income;
    num totalExpense = summary.expense;
    num netIncome = summary.total;
    List<Transaction> transactions = summary.transactions;
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(width: 1.0, color: AppColors.border),
              bottom: BorderSide(width: 1.0, color: AppColors.border),
            ),
            color: AppColors.lightBackground1,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          date.day.toString(),
                          style: const TextStyle(
                            fontFamily: 'roboto',
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 3, vertical: 1),
                            child: Text(
                              dateFormat.format(date),
                              style: normalStyle.copyWith(
                                color: AppColors.bodyTextDark,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          addComma.format(totalIncome),
                          style: normalStyle.copyWith(color: AppColors.income),
                        ),
                        Container(
                          width: 120,
                          alignment: Alignment.centerRight,
                          child: Text(
                            addComma.format(totalExpense),
                            style:
                                normalStyle.copyWith(color: AppColors.expense),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const Divider(
                  color: AppColors.border,
                ),
                ...List.generate(transactions.length, (index) {
                  final transaction = transactions[index];
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 30,
                        child: Row(
                          children: [
                            Text(
                              transaction.category!.categoryName ?? "",
                              style: normalStyle,
                            ),
                            const SizedBox(width: 20),
                            Text(
                              transaction.paymentMethod != null
                                  ? transaction.paymentMethod!
                                  : '',
                              style: normalStyle.copyWith(
                                  color: AppColors.bodyTextDark),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            addComma.format(transaction.amount),
                            style: normalStyle.copyWith(
                              color: transaction.transactionType ==
                                      TransactionType.expense.name
                                  ? AppColors.expense
                                  : AppColors.income,
                            ),
                          ),
                        ],
                      )
                    ],
                  );
                })
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
