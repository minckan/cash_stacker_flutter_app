import 'package:cash_stacker_flutter_app/common/repository/finance_tracker_category_repository.dart';
import 'package:cash_stacker_flutter_app/common/utill/logger.dart';
import 'package:cash_stacker_flutter_app/home/viewmodels/workspace_viewmodel.dart';

import 'package:cash_stacker_flutter_app/swaggers/openapi.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final transactionCategoryViewModelProvider = StateNotifierProvider<
        TransactionCategoryViewModel, Map<String, List<TransactionCategory>>>(
    (ref) => TransactionCategoryViewModel(ref));

class TransactionCategoryViewModel
    extends StateNotifier<Map<String, List<TransactionCategory>>> {
  final Ref _ref;

  TransactionCategoryViewModel(this._ref)
      : super({'expense': [], 'income': []});

  String? get workspaceId {
    return _ref.read(workspaceViewModelProvider)?.workspaceId;
  }

  Future<void> loadCategory() async {
    if (workspaceId != null) {
      final incomeCategoryRes = await _ref
          .read(financialTrackerCategoryRepositoryProvider)
          .getAllTransactionCategoryByType(
              workspaceId: workspaceId!, type: 'income');
      final expenseCategoryRes = await _ref
          .read(financialTrackerCategoryRepositoryProvider)
          .getAllTransactionCategoryByType(
              workspaceId: workspaceId!, type: 'expense');
      state = {
        'income': incomeCategoryRes.data?.toList() ?? [],
        'expense': expenseCategoryRes.data?.toList() ?? [],
      };
    }
  }

  List<TransactionCategory> getCategoriesByType(String type) {
    return state[type] ?? [];
  }

  Future<void> addCategory(
      WorkspaceIdFinanceCategoryPostRequest category) async {
    if (workspaceId != null) {
      final response = await _ref
          .read(financialTrackerCategoryRepositoryProvider)
          .createTransactionCategory(workspaceId: workspaceId!, body: category);
      // Add the category to the state

      state = {
        ...state,
        category.categoryType!: [
          ...state[category.categoryType]!,
          response.data!
        ],
      };
    }
  }

  Future<void> updateCategory(
    int categoryId,
    WorkspaceIdFinanceCategoryIdPutRequest body,
  ) async {
    if (workspaceId != null) {
      final response = await _ref
          .read(financialTrackerCategoryRepositoryProvider)
          .updateTransactionCategory(
            workspaceId: workspaceId!,
            id: categoryId,
            body: body,
          );

      // Update the category in the state
      final categories = state[response.data!.categoryType]!.map((c) {
        return c.categoryId == response.data!.categoryId ? response.data! : c;
      }).toList();
      state = {
        ...state,
        response.data!.categoryType!: categories,
      };
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
        final categories = state[category.categoryType]!
            .where((c) => c.categoryId != category.categoryId)
            .toList();
        state = {
          ...state,
          category.categoryType!: categories,
        };
      }
    } catch (e) {
      logger.e(e);
    }
  }
}
