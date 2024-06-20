import 'package:cash_stacker_flutter_app/common/repository/budget_repository.dart';
import 'package:cash_stacker_flutter_app/common/utill/error.dart';
import 'package:cash_stacker_flutter_app/home/model/budget_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final budgetViewModelProvider =
    StateNotifierProvider<BudgetViewModel, Budget?>((ref) {
  return BudgetViewModel(ref);
});

class BudgetViewModel extends StateNotifier<Budget?> {
  final Ref _ref;

  BudgetViewModel(this._ref) : super(null);

  Future<void> loadBudgets(String? workspaceId) async {
    try {
      if (workspaceId != null) {
        final response = await _ref
            .read(budgetRepositoryProvider)
            .getActiveBudget(workspaceId: workspaceId);

        if (response != null && response.isNotEmpty) {
          state = response[0];
        }
      } else {
        setError('loadBudgets', 'workspaceId is Null');
      }
    } catch (e) {
      setError('loadBudgets', e);
    }
  }
}
