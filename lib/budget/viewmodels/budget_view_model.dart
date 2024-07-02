import 'package:cash_stacker_flutter_app/budget/model/budget_state.dart';
import 'package:cash_stacker_flutter_app/common/repository/budget_repository.dart';
import 'package:cash_stacker_flutter_app/home/viewmodels/workspace_viewmodel.dart';
import 'package:cash_stacker_flutter_app/swaggers/openapi.dart';
import 'package:cash_stacker_flutter_app/swaggers/src/model/budget.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final budgetViewModelProvider =
    StateNotifierProvider<BudgetViewModel, BudgetStatBase>((ref) {
  return BudgetViewModel(ref);
});

class BudgetViewModel extends StateNotifier<BudgetStatBase> {
  final Ref _ref;

  BudgetViewModel(this._ref) : super(BudgetStatLoading());

  String? get warningText {
    if (state is BudgetState) {
      final budgetState = state as BudgetState;
      if (budgetState.activeBudget?.expendableBudget?.percentage != null) {
        final percentage =
            budgetState.activeBudget!.expendableBudget!.percentage!;
        if (percentage == 0) {
          return '아직 예산을 사용하지 않으셨군요! 대단합니다!';
        } else if (percentage < 40) {
          return '예산이 충분히 남아있어요!';
        } else if (percentage > 40 && percentage < 70) {
          return '예산을 절반정도 소진했어요!';
        } else if (percentage < 100) {
          return '예산을 대부분 사용했어요!\n예산을 초과하지 않도록 주의해주세요!';
        } else {
          // 100% ~ 그이상
          return '예산을 전부 사용했어요!';
        }
      }
    }
    return null;
  }

  double? get expenseInBudget {
    if (state is BudgetState) {
      final budgetState = state as BudgetState;

      return (budgetState.activeBudget!.budget!.amount ?? 0) -
          (budgetState.activeBudget!.expendableBudget!.expendableBudget ?? 0);
    }
    return null;
  }

  Future<List<Budget>?> loadBudgets() async {
    try {
      final workspaceId = _ref.read(workspaceViewModelProvider)?.id;
      if (workspaceId != null) {
        final response = await _ref
            .read(budgetRepositoryProvider)
            .getAllBudget(workspaceId: workspaceId);

        if (response.data != null && response.data!.isNotEmpty) {
          state = BudgetState(
            budgets: response.data!.toList(),
            activeBudget: (state as BudgetState).activeBudget,
          );
          return response.data!.toList();
        }
      } else {
        setError('workspaceId is null');
      }
    } catch (e) {
      setError(e.toString());
    }
    return null;
  }

  Future<void> loadActiveBudget(String? workspaceId) async {
    try {
      if (workspaceId != null) {
        final response = await _ref
            .read(budgetRepositoryProvider)
            .getActiveBudget(workspaceId: workspaceId);

        if (response.data != null) {
          state = BudgetState(
            activeBudget: response.data,
            budgets: (state as BudgetState).budgets,
          );
        }
      } else {
        setError('workspaceId is null');
      }
    } catch (e) {
      setError(e.toString());
    }
  }

  Future<dynamic> addBudget({
    required String? workspaceId,
    required WorkspaceIdBudgetPostRequest body,
  }) async {
    try {
      if (workspaceId != null) {
        final response = await _ref
            .read(budgetRepositoryProvider)
            .createBudget(workspaceId: workspaceId, body: body);

        if (response.data != null) {
          state = BudgetState(
            activeBudget: (state as BudgetState).activeBudget,
            budgets: [
              ...((state as BudgetState).budgets ?? []),
              response.data!,
            ],
          );
          return true;
        } else {
          return 'Failed to add budget, response data is null';
        }
      } else {
        return 'workspaceId is null';
      }
    } catch (e) {
      return '[Add Budget] ${e.toString()}';
    }
  }

  void setError(String error) {
    state = BudgetStatError(errorMessage: error);
  }
}
