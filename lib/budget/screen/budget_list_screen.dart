import 'package:cash_stacker_flutter_app/budget/model/budget_state.dart';
import 'package:cash_stacker_flutter_app/budget/viewmodels/budget_view_model.dart';
import 'package:cash_stacker_flutter_app/common/layout/default_layout.dart';
import 'package:cash_stacker_flutter_app/common/utill/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BudgetListScreen extends ConsumerWidget {
  const BudgetListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final budgetState0 = ref.watch(budgetViewModelProvider);

    if (budgetState0 is BudgetStatLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    final budgetState = budgetState0 as BudgetState;
    return DefaultLayout(
      child: budgetState.budgets == null || budgetState.budgets!.isEmpty
          ? const Center(
              child: Text('저장된 예산이 없습니다.'),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                final budget = budgetState.budgets![index];
                return ListTile(
                  title: Text(
                    '${getDateKey(budget.startDate!)}~${getDateKey(budget.endDate!)}',
                  ),
                  subtitle: Text(
                    budget.amount.toString(),
                  ),
                );
              },
            ),
    );
  }
}
