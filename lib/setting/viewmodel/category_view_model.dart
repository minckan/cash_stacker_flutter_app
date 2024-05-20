import 'package:cash_stacker_flutter_app/common/utill/fire_store_collections.dart';
import 'package:cash_stacker_flutter_app/setting/model/category_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoryViewModelProvider =
    StateNotifierProvider<CategoryViewModel, List<CategoryModel>>(
        (ref) => CategoryViewModel());

class CategoryViewModel extends StateNotifier<List<CategoryModel>> {
  CategoryViewModel() : super([]);

  Future<void> loadCategory(
      {required String workspaceId, required CategoryType type}) async {
    final QuerySnapshot categorySnapshot = await FirebaseFirestore.instance
        .collection(Collection.workspaces)
        .doc(workspaceId)
        .collection(Collection.category)
        .where('type', isEqualTo: type)
        .get();

    if (categorySnapshot.docs.isNotEmpty) {
      state = categorySnapshot.docs
          .map((doc) =>
              CategoryModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    }
  }

  Future<void> addCategory(CategoryModel category, String workspaceId) async {
    await FirebaseFirestore.instance
        .collection(Collection.workspaces)
        .doc(workspaceId)
        .collection(Collection.category)
        .doc(category.id)
        .set(category.toJson());

    state = [...state, category];
  }

  Future<void> updateCategory(
      CategoryModel category, String workspaceId) async {
    await FirebaseFirestore.instance
        .collection(Collection.workspaces)
        .doc(workspaceId)
        .collection(Collection.category)
        .doc(category.id)
        .set(category.toJson());

    state = state.map((e) => e.id == category.id ? category : e).toList();
  }

  Future<void> removeCategory(
      CategoryModel category, String workspaceId) async {
    await FirebaseFirestore.instance
        .collection(Collection.workspaces)
        .doc(workspaceId)
        .collection(Collection.category)
        .doc(category.id)
        .delete();
    state = state.where((e) => e.id != category.id).toList();
  }
}
