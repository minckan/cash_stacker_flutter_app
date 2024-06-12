import 'package:cash_stacker_flutter_app/common/utill/fire_store_collections.dart';
import 'package:cash_stacker_flutter_app/common/utill/logger.dart';
import 'package:cash_stacker_flutter_app/setting/model/category_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoryViewModelProvider =
    StateNotifierProvider<CategoryViewModel, List<CategoryModel>>(
        (ref) => CategoryViewModel());

class CategoryViewModel extends StateNotifier<List<CategoryModel>> {
  CategoryViewModel() : super([]);

  CategoryModel get cashAsset {
    return state.firstWhere((item) => item.name == '현금');
  }

  CategoryModel get foreignCashAsset {
    return state.firstWhere((item) => item.name == '외환');
  }

  List<CategoryModel> get expenseCategories {
    return state
        .where((category) => category.type == CategoryType.expense)
        .toList();
  }

  List<CategoryModel> get incomeCategories {
    return state
        .where((category) => category.type == CategoryType.income)
        .toList();
  }

  List<CategoryModel> get assetCategories {
    return state
        .where((category) => category.type == CategoryType.asset)
        .toList();
  }

  Future<void> loadCategory({required String workspaceId}) async {
    final QuerySnapshot categorySnapshot = await FirebaseFirestore.instance
        .collection(Collection.workspaces)
        .doc(workspaceId)
        .collection(Collection.category)
        .get();
    final defaultCategorySnapshot = await FirebaseFirestore.instance
        .collection(Collection.globalSetting)
        .doc(Collection.defaultCategory)
        .get();

    final defaultCategories =
        defaultCategorySnapshot.data()?.entries.map((entry) {
      return CategoryModel.fromJson(entry.value);
    }).toList();

    if (categorySnapshot.docs.isNotEmpty) {
      state = categorySnapshot.docs
          .map((doc) =>
              CategoryModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    }

    if (defaultCategories != null && defaultCategories.isNotEmpty) {
      state = [...state, ...defaultCategories];
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
