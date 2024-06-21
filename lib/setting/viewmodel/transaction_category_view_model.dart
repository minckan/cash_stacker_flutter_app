import 'package:cash_stacker_flutter_app/common/repository/finance_tracker_category_repository.dart';
import 'package:cash_stacker_flutter_app/setting/model/transaction_category_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final transactionCategoryViewModelProvider = StateNotifierProvider<
        TransactionCategoryViewModel,
        Map<String, List<TransactionCategoryModel>>>(
    (ref) => TransactionCategoryViewModel(ref));

class TransactionCategoryViewModel
    extends StateNotifier<Map<String, List<TransactionCategoryModel>>> {
  final Ref _ref;

  TransactionCategoryViewModel(this._ref)
      : super({'expense': [], 'income': []});

  Future<void> loadCategory({required String workspaceId}) async {
    final incomeCategory = await _ref
        .read(financialTrackerCategoryRepositoryProvider)
        .getAllTransactionCategoryByType(
            workspaceId: workspaceId, type: 'income');
    final expenseCategory = await _ref
        .read(financialTrackerCategoryRepositoryProvider)
        .getAllTransactionCategoryByType(
            workspaceId: workspaceId, type: 'expense');
    state = {
      'income': incomeCategory,
      'expense': expenseCategory,
    };
  }

  List<TransactionCategoryModel> getCategoriesByType(String type) {
    return state[type] ?? [];
  }

  Future<void> addCategory(
      TransactionCategoryModel category, String workspaceId) async {
    await _ref
        .read(financialTrackerCategoryRepositoryProvider)
        .createTransactionCategory(workspaceId: workspaceId, body: category);

    // Add the category to the state
    state = {
      ...state,
      '${category.type}': [...state['${category.type}']!, category],
    };
  }

  Future<void> updateCategory(
      TransactionCategoryModel category, String workspaceId) async {
    await _ref
        .read(financialTrackerCategoryRepositoryProvider)
        .updateTransactionCategory(
      workspaceId: workspaceId,
      id: category.id!,
      body: {
        'category_name': category.name,
      },
    );

    // Update the category in the state
    final categories = state[category.type]!.map((c) {
      return c.id == category.id ? category : c;
    }).toList();
    state = {
      ...state,
      '${category.type}': categories,
    };
  }

  Future<void> removeCategory(
      TransactionCategoryModel category, String workspaceId) async {
    await _ref
        .read(financialTrackerCategoryRepositoryProvider)
        .deleteTransactionCategory(
          workspaceId: workspaceId,
          id: category.id!,
        );

    // Remove the category from the state
    final categories =
        state[category.type]!.where((c) => c.id != category.id).toList();
    state = {
      ...state,
      '${category.type}': categories,
    };
  }
}
