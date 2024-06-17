import 'package:cash_stacker_flutter_app/common/utill/fire_store_collections.dart';
import 'package:cash_stacker_flutter_app/setting/model/asset_type_model.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final assetTypeViewModelProvider =
    StateNotifierProvider<CategoryViewModel, List<AssetTypeModel>>(
        (ref) => CategoryViewModel());

class CategoryViewModel extends StateNotifier<List<AssetTypeModel>> {
  CategoryViewModel() : super([]);

  AssetTypeModel get cashAsset {
    return state.firstWhere((item) => item.name == '현금');
  }

  AssetTypeModel get foreignCashAsset {
    return state.firstWhere((item) => item.name == '외환');
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
      return AssetTypeModel.fromJson(entry.value);
    }).toList();

    if (categorySnapshot.docs.isNotEmpty) {
      state = categorySnapshot.docs
          .map((doc) =>
              AssetTypeModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    }

    if (defaultCategories != null && defaultCategories.isNotEmpty) {
      state = [...state, ...defaultCategories];
    }
  }

  Future<void> addCategory(AssetTypeModel category, String workspaceId) async {
    await FirebaseFirestore.instance
        .collection(Collection.workspaces)
        .doc(workspaceId)
        .collection(Collection.category)
        .doc(category.id)
        .set(category.toJson());

    state = [...state, category];
  }

  Future<void> updateCategory(
      AssetTypeModel category, String workspaceId) async {
    await FirebaseFirestore.instance
        .collection(Collection.workspaces)
        .doc(workspaceId)
        .collection(Collection.category)
        .doc(category.id)
        .set(category.toJson());

    state = state.map((e) => e.id == category.id ? category : e).toList();
  }

  Future<void> removeCategory(
      AssetTypeModel category, String workspaceId) async {
    await FirebaseFirestore.instance
        .collection(Collection.workspaces)
        .doc(workspaceId)
        .collection(Collection.category)
        .doc(category.id)
        .delete();
    state = state.where((e) => e.id != category.id).toList();
  }
}
