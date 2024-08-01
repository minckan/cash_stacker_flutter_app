import 'package:cash_stacker_flutter_app/common/repository/finance_tracker_category_repository.dart';
import 'package:cash_stacker_flutter_app/common/utill/logger.dart';
import 'package:cash_stacker_flutter_app/home/viewmodels/workspace_viewmodel.dart';
import 'package:cash_stacker_flutter_app/swaggers/openapi.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class TransactionCategories {
  final List<TransactionCategory> income;
  final List<TransactionCategory> expense;

  TransactionCategories({required this.income, required this.expense});

  bool get isEmpty {
    return income.isEmpty && expense.isEmpty;
  }

  TransactionCategories copyWith({
    List<TransactionCategory>? income,
    List<TransactionCategory>? expense,
  }) {
    return TransactionCategories(
      income: income ?? this.income,
      expense: expense ?? this.expense,
    );
  }
}

final transactionCategoryViewModelProvider =
    StateNotifierProvider<TransactionCategoryViewModel, TransactionCategories>(
  (ref) => TransactionCategoryViewModel(ref),
);

class TransactionCategoryViewModel
    extends StateNotifier<TransactionCategories> {
  final Ref _ref;

  TransactionCategoryViewModel(this._ref)
      : super(TransactionCategories(income: [], expense: []));

  String? get workspaceId {
    return _ref.read(workspaceViewModelProvider)?.workspaceId;
  }

  Future<void> loadCategory() async {
    try {
      if (workspaceId != null) {
        final incomeCategoryRes = await _ref
            .read(financialTrackerCategoryRepositoryProvider)
            .getAllTransactionCategoryByType(
                workspaceId: workspaceId!, type: 'income');
        final expenseCategoryRes = await _ref
            .read(financialTrackerCategoryRepositoryProvider)
            .getAllTransactionCategoryByType(
                workspaceId: workspaceId!, type: 'expense');
        state = TransactionCategories(
          income: incomeCategoryRes.data?.toList() ?? [],
          expense: expenseCategoryRes.data?.toList() ?? [],
        );
      }
    } catch (e) {
      logger.e(e);
    }
  }

  Future<bool> addCategory(CreateFinancialTrackerCategoryReq category) async {
    try {
      if (workspaceId != null) {
        final response = await _ref
            .read(financialTrackerCategoryRepositoryProvider)
            .createTransactionCategory(
                workspaceId: workspaceId!, body: category);
        // Add the category to the state
        if (category.categoryType == 'income') {
          state = state.copyWith(
            income: [...state.income, response.data!],
          );
        } else if (category.categoryType == 'expense') {
          state = state.copyWith(
            expense: [...state.expense, response.data!],
          );
        }
        return true; // 성공 시 true 반환
      }
    } catch (e) {
      logger.e(e);
    }
    return false; // 실패 시 false 반환
  }

  Future<void> updateCategory(
    int categoryId,
    UpdateFinancialTrackerCategoryReq body,
  ) async {
    try {
      if (workspaceId != null) {
        final response = await _ref
            .read(financialTrackerCategoryRepositoryProvider)
            .updateTransactionCategory(
              workspaceId: workspaceId!,
              id: categoryId,
              body: body,
            );

        // Update the category in the state
        if (response.data!.categoryType == 'income') {
          final categories = state.income.map((c) {
            return c.categoryId == response.data!.categoryId
                ? response.data!
                : c;
          }).toList();
          state = state.copyWith(income: categories);
        } else if (response.data!.categoryType == 'expense') {
          final categories = state.expense.map((c) {
            return c.categoryId == response.data!.categoryId
                ? response.data!
                : c;
          }).toList();
          state = state.copyWith(expense: categories);
        }
      }
    } catch (e) {
      logger.e(e);
    }
  }

  Future<void> removeCategory(TransactionCategory category) async {
    try {
      if (workspaceId != null) {
        await _ref
            .read(financialTrackerCategoryRepositoryProvider)
            .deleteTransactionCategory(
              workspaceId: workspaceId!,
              id: category.categoryId!,
            );

        // Remove the category from the state
        if (category.categoryType == 'income') {
          final categories = state.income
              .where((c) => c.categoryId != category.categoryId)
              .toList();
          state = state.copyWith(income: categories);
        } else if (category.categoryType == 'expense') {
          final categories = state.expense
              .where((c) => c.categoryId != category.categoryId)
              .toList();
          state = state.copyWith(expense: categories);
        }
      }
    } catch (e) {
      logger.e(e);
    }
  }
}
