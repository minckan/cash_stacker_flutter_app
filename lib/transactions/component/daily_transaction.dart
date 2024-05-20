import 'package:cash_stacker_flutter_app/common/utill/number_format.dart';
import 'package:cash_stacker_flutter_app/transactions/model/transaction_model.dart';
import 'package:cash_stacker_flutter_app/transactions/viewmodels/transactions_view_model.dart';
import 'package:flutter/material.dart';

import 'package:cash_stacker_flutter_app/common/const/app_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DailyTransaction extends ConsumerWidget {
  const DailyTransaction({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactionsViewModel = ref.watch(transactionViewModelProvider);

    return ListView.builder(
      itemBuilder: (context, index) {
        final transaction = transactionsViewModel[index];
        return buildDailyContent(transaction);
      },
      itemCount: transactionsViewModel.length,
    );
  }

  Widget buildDailyContent(TransactionModel transaction) {
    const TextStyle normalStyle = TextStyle(
      color: AppColors.bodyTextDark,
      fontSize: 12,
    );
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
                          transaction.date.day.toString(),
                          style: const TextStyle(
                            fontFamily: 'roboto',
                            fontSize: 24,
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
                            child: Text('월요일',
                                style: normalStyle.copyWith(
                                    color: AppColors.bodyTextDark)),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          addComma.format(2500000),
                          style: normalStyle.copyWith(color: AppColors.income),
                        ),
                        const SizedBox(width: 50),
                        Text(
                          addComma.format(2500000),
                          style: normalStyle.copyWith(color: AppColors.expense),
                        ),
                      ],
                    )
                  ],
                ),
                const Divider(
                  color: AppColors.border,
                ),
                ...List.generate(
                  3,
                  (index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 30,
                          child: Row(
                            children: [
                              const Text(
                                '식비🍣',
                                style: normalStyle,
                              ),
                              const SizedBox(width: 20),
                              Text(
                                '카드',
                                style: normalStyle.copyWith(
                                    color: AppColors.bodyTextDark),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              addComma.format(2500000),
                              style: normalStyle.copyWith(
                                  color: AppColors.expense),
                            ),
                          ],
                        )
                      ],
                    );
                  },
                )
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
