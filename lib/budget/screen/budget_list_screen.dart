import 'package:cash_stacker_flutter_app/budget/screen/budget_setting_screen.dart';
import 'package:cash_stacker_flutter_app/budget/viewmodels/budget_view_model.dart';
import 'package:cash_stacker_flutter_app/common/const/app_colors.dart';
import 'package:cash_stacker_flutter_app/common/layout/default_layout.dart';
import 'package:cash_stacker_flutter_app/common/utill/date_format.dart';
import 'package:cash_stacker_flutter_app/swaggers/src/model/budget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BudgetListScreen extends ConsumerWidget {
  const BudgetListScreen({super.key});

// TODO : 업데이트, 삭제시 화면에 바로 반영 안됨.
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
        future: ref.watch(budgetViewModelProvider.notifier).loadBudgets(),
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
                        '기간 : ${getDateKey(budget.startDate!)}~${getDateKey(budget.endDate!)}',
                        style: const TextStyle(fontSize: 14),
                      ),
                      subtitle: Text(
                        budget.amount.toString(),
                      ),
                      contentPadding: const EdgeInsets.only(left: 20, right: 0),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          budget.isActive == true
                              ? _buildActiveChip(
                                  onTab: () => handleChangeActivationStatus(
                                      ref: ref,
                                      id: budget.budgetId!,
                                      status: !budget.isActive!),
                                )
                              : _buildInactiveChip(
                                  onTab: () => handleChangeActivationStatus(
                                    ref: ref,
                                    id: budget.budgetId!,
                                    status: !budget.isActive!,
                                  ),
                                ),
                          IconButton(
                            onPressed: () {
                              ref
                                  .read(budgetViewModelProvider.notifier)
                                  .deleteBudget(budgetId: budget.budgetId!);
                            },
                            icon: const Icon(Icons.delete),
                          )
                        ],
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

  void handleChangeActivationStatus({
    required WidgetRef ref,
    required int id,
    required bool status,
  }) async {
    await ref.read(budgetViewModelProvider.notifier).updateBudgetStatus(
          budgetId: id,
          status: status,
        );
  }

  ChipButton _buildActiveChip({required Function() onTab}) {
    return ChipButton(
      color: AppColors.active,
      label: '활성',
      onTab: onTab,
    );
  }

  ChipButton _buildInactiveChip({required Function() onTab}) {
    return ChipButton(
      color: AppColors.inactive,
      label: '비활성',
      onTab: onTab,
    );
  }
}

class ChipButton extends StatelessWidget {
  final Color color;
  final String label;
  final Function() onTab;

  const ChipButton({
    super.key,
    required this.color,
    required this.label,
    required this.onTab,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: color, width: 1),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Text(
            label,
            style: TextStyle(color: color),
          ),
        ),
      ),
    );
  }
}
