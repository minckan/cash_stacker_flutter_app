import 'package:cash_stacker_flutter_app/common/utill/fire_store_collections.dart';
import 'package:cash_stacker_flutter_app/portfolio/model/asset_model.dart';
import 'package:cash_stacker_flutter_app/setting/viewmodel/transaction_category_view_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final assetViewModelProvider =
    StateNotifierProvider<AssetsViewModel, List<Asset>>(
        (ref) => AssetsViewModel(ref));

class AssetsViewModel extends StateNotifier<List<Asset>> {
  final Ref _ref;

  AssetsViewModel(this._ref) : super([]);

  Asset? get krwCashAsset {
    final krwCashCategoryId =
        _ref.read(categoryViewModelProvider.notifier).cashAsset.id;
    try {
      return state.firstWhere(
        (asset) => asset.category.id == krwCashCategoryId,
      );
    } catch (e) {
      return null;
    }
  }

  Future<void> loadAssets(String workspaceId) async {
    final QuerySnapshot assetsQuery = await FirebaseFirestore.instance
        .collection(Collection.workspaces)
        .doc(workspaceId)
        .collection(Collection.assets)
        .get();

    if (assetsQuery.docs.isEmpty) {
      state = [];
      return;
    }
    List<Asset> assets = assetsQuery.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>?;

      if (data != null) {
        return Asset.fromJson(data);
      } else {
        throw Exception("Document data is null");
      }
    }).toList();

    state = _sortAssets(assets);
  }

  Future<void> addAsset(Asset asset, String workspaceId) async {
    await FirebaseFirestore.instance
        .collection(Collection.workspaces)
        .doc(workspaceId)
        .collection(Collection.assets)
        .doc(asset.id)
        .set(
          asset.toJson(),
        );

    state = _sortAssets([...state, asset]);
  }

  Future<void> updateAsset(Asset asset, String workspaceId) async {
    await FirebaseFirestore.instance
        .collection(Collection.workspaces)
        .doc(workspaceId)
        .collection(Collection.assets)
        .doc(asset.id)
        .set(asset.toJson());

    state =
        _sortAssets(state.map((e) => e.id == asset.id ? asset : e).toList());
  }

  Future<void> removeAsset(Asset asset, String workspaceId) async {
    await FirebaseFirestore.instance
        .collection(Collection.workspaces)
        .doc(workspaceId)
        .collection(Collection.assets)
        .doc(asset.id)
        .delete();

    state =
        _sortAssets(state.where((element) => element.id != asset.id).toList());
  }

  void clearAssets() {
    state = [];
  }

  Asset getParticularAssets(String assetId) {
    final result = state.firstWhere((element) => element.id == assetId);

    return result;
  }

  List<Asset> _sortAssets(List<Asset> assets) {
    final cashCategoryId =
        _ref.read(categoryViewModelProvider.notifier).cashAsset.id;

    List<Asset> nonCashAssets =
        assets.where((asset) => asset.category.id != cashCategoryId).toList();
    List<Asset> cashAssets =
        assets.where((asset) => asset.category.id == cashCategoryId).toList();
    return [...nonCashAssets, ...cashAssets];
  }
}
