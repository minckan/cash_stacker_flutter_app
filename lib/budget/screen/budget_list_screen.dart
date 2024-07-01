import 'package:cash_stacker_flutter_app/budget/screen/budget_setting_screen.dart';
import 'package:cash_stacker_flutter_app/budget/viewmodels/budget_view_model.dart';
import 'package:cash_stacker_flutter_app/common/layout/default_layout.dart';
import 'package:cash_stacker_flutter_app/common/utill/date_format.dart';
import 'package:cash_stacker_flutter_app/swaggers/src/model/budget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BudgetListScreen extends ConsumerWidget {
  const BudgetListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultLayout(
      title: '예산 설정 하기',
      actions: [
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const BudgetSettingScreen()));
          },
        )
      ],
      child: FutureBuilder<List<Budget>?>(
        future: ref.read(budgetViewModelProvider.notifier).loadBudgets(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());

            case ConnectionState.done:
              if (!snapshot.hasData) {
                return const Center(
                  child: Text('저장된 예산이 없습니다.'),
                );
              } else if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final budget = snapshot.data![index];
                    return ListTile(
                      title: Text(
                        '${getDateKey(budget.startDate!)}~${getDateKey(budget.endDate!)}',
                      ),
                      subtitle: Text(
                        budget.amount.toString(),
                      ),
                    );
                  },
                );
              }

            default:
              return const Text('연결 중에 문제가 발생했습니다.');
          }

          return const Text('연결 중에 문제가 발생했습니다.');
        },
      ),
    );
  }
}
