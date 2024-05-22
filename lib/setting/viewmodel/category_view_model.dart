import 'package:cash_stacker_flutter_app/common/utill/fire_store_collections.dart';
import 'package:cash_stacker_flutter_app/setting/model/transaction_category_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoryViewModelProvider =
    StateNotifierProvider<CategoryViewModel, List<TransactionCategoryModel>>(
        (ref) => CategoryViewModel());

class CategoryViewModel extends StateNotifier<List<TransactionCategoryModel>> {
  CategoryViewModel() : super([]);

  Future<void> loadCategory({required String workspaceId}) async {
    final QuerySnapshot categorySnapshot = await FirebaseFirestore.instance
        .collection(Collection.workspaces)
        .doc(workspaceId)
        .collection(Collection.category)
        .get();

    if (categorySnapshot.docs.isNotEmpty) {
      state = categorySnapshot.docs
          .map((doc) => TransactionCategoryModel.fromJson(
              doc.data() as Map<String, dynamic>))
          .toList();
    }
  }

  Future<void> addCategory(
      TransactionCategoryModel category, String workspaceId) async {
    await FirebaseFirestore.instance
        .collection(Collection.workspaces)
        .doc(workspaceId)
        .collection(Collection.category)
        .doc(category.id)
        .set(category.toJson());

    state = [...state, category];
  }

  Future<void> updateCategory(
      TransactionCategoryModel category, String workspaceId) async {
    await FirebaseFirestore.instance
        .collection(Collection.workspaces)
        .doc(workspaceId)
        .collection(Collection.category)
        .doc(category.id)
        .set(category.toJson());

    state = state.map((e) => e.id == category.id ? category : e).toList();
  }

  Future<void> removeCategory(
      TransactionCategoryModel category, String workspaceId) async {
    await FirebaseFirestore.instance
        .collection(Collection.workspaces)
        .doc(workspaceId)
        .collection(Collection.category)
        .doc(category.id)
        .delete();
    state = state.where((e) => e.id != category.id).toList();
  }
}
