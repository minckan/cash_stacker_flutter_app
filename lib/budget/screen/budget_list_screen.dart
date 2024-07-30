import 'package:cash_stacker_flutter_app/budget/model/budget_state.dart';
import 'package:cash_stacker_flutter_app/budget/screen/budget_setting_screen.dart';
import 'package:cash_stacker_flutter_app/budget/viewmodels/budget_view_model.dart';
import 'package:cash_stacker_flutter_app/common/const/app_colors.dart';
import 'package:cash_stacker_flutter_app/common/layout/default_layout.dart';
import 'package:cash_stacker_flutter_app/common/utill/date_format.dart';
import 'package:cash_stacker_flutter_app/common/utill/number_format.dart';
import 'package:cash_stacker_flutter_app/swaggers/openapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BudgetListScreen extends ConsumerStatefulWidget {
  const BudgetListScreen({super.key});

  @override
  ConsumerState<BudgetListScreen> createState() => _BudgetListScreenState();
}

class _BudgetListScreenState extends ConsumerState<BudgetListScreen> {
  int? selectedBudgetId;

  @override
  void initState() {
    super.initState();

    // 초기 로딩을 위한 Future 호출
    Future.microtask(
        () => ref.read(budgetViewModelProvider.notifier).loadBudgets());
  }

  @override
  Widget build(BuildContext context) {
    final budgetState = ref.watch(budgetViewModelProvider);

    return DefaultLayout(
      title: '예산 설정 하기',
      actions: [
        if (selectedBudgetId != null)
          TextButton(
            onPressed: () {
              handleChangeActivationStatus(
                ref: ref,
                id: selectedBudgetId!,
              );
            },
            child: const Text('활성화'),
          ),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const BudgetSettingScreen()));
          },
        )
      ],
      child: budgetState is BudgetStatLoading
          ? const Center(child: CircularProgressIndicator())
          : budgetState is BudgetState
              ? budgetState.budgets!.isEmpty
                  ? const Center(
                      child: Text('저장된 예산이 없습니다.'),
                    )
                  : ListView.builder(
                      itemCount: budgetState.budgets!.length,
                      itemBuilder: (context, index) {
                        final budget = budgetState.budgets![index];
                        return ListTile(
                          title: Text(
                            '${getDateKey(budget.startDate!)}~${getDateKey(budget.endDate!)}',
                            style: const TextStyle(fontSize: 14),
                          ),
                          subtitle: Text(
                            '예산: ${addComma(budget.amount)}원',
                          ),
                          contentPadding:
                              const EdgeInsets.only(left: 0, right: 0),
                          leading: Radio<int?>(
                            value: budget.budgetId,
                            groupValue: selectedBudgetId,
                            onChanged: budget.isActive == true
                                ? null
                                : (value) {
                                    setState(() {
                                      selectedBudgetId = value as int;
                                    });
                                  },
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              budget.isActive == true
                                  ? _buildActiveChip()
                                  : const SizedBox(),
                              IconButton(
                                onPressed: () {
                                  ref
                                      .read(budgetViewModelProvider.notifier)
                                      .deleteBudget(budgetId: budget.budgetId!);
                                },
                                icon: const Icon(Icons.delete),
                              ),
                            ],
                          ),
                        );
                      },
                    )
              : const Center(
                  child: Text('연결중에 문제가 발생했습니다.'),
                ),
    );
  }

  void handleChangeActivationStatus({
    required WidgetRef ref,
    required int id,
  }) async {
    await ref.read(budgetViewModelProvider.notifier).updateBudgetStatus(
          budgetId: id,
          status: true,
        );
  }

  ChipButton _buildActiveChip() {
    return const ChipButton(
      color: AppColors.active,
      label: '활성',
    );
  }
}

class ChipButton extends StatelessWidget {
  final Color color;
  final String label;

  const ChipButton({
    super.key,
    required this.color,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
