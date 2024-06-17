import 'package:cash_stacker_flutter_app/setting/model/transaction_category_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final transactionCategoryViewModelProvider = StateNotifierProvider<
    TransactionCategoryViewModel,
    List<TransactionCategoryModel>>((ref) => TransactionCategoryViewModel());

class TransactionCategoryViewModel
    extends StateNotifier<List<TransactionCategoryModel>> {
  TransactionCategoryViewModel() : super([]);

  Future<void> loadCategory({required String workspaceId}) async {
    // if (categorySnapshot.docs.isNotEmpty) {
    //   state = categorySnapshot.docs
    //       .map((doc) => TransactionCategoryModel.fromJson(
    //           doc.data() as Map<String, dynamic>))
    //       .toList();
    // }

    // if (defaultCategories != null && defaultCategories.isNotEmpty) {
    //   state = [...state, ...defaultCategories];
    // }
  }

  Future<void> addCategory(
      TransactionCategoryModel category, String workspaceId) async {
    state = [...state, category];
  }

  Future<void> updateCategory(
      TransactionCategoryModel category, String workspaceId) async {
    state = state.map((e) => e.id == category.id ? category : e).toList();
  }

  Future<void> removeCategory(
      TransactionCategoryModel category, String workspaceId) async {
    state = state.where((e) => e.id != category.id).toList();
  }
}
