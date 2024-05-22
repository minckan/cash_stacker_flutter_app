import 'package:cash_stacker_flutter_app/common/utill/fire_store_collections.dart';
import 'package:cash_stacker_flutter_app/portfolio/model/asset_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final assetViewModelProvider =
    StateNotifierProvider<AssetViewModel, List<Asset>>(
        (ref) => AssetViewModel());

class AssetViewModel extends StateNotifier<List<Asset>> {
  AssetViewModel() : super([]);

  Future<void> loadAssets(String workspaceId) async {
    final QuerySnapshot assetsQuery = await FirebaseFirestore.instance
        .collection(Collection.workspaces)
        .doc(workspaceId)
        .collection(Collection.assets)
        .get();

    state = assetsQuery.docs
        .map((doc) => Asset.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }

  Future<void> addAsset(Asset asset, String workspaceId) async {
    final QuerySnapshot doc = await FirebaseFirestore.instance
        .collection(Collection.workspaces)
        .doc(workspaceId)
        .collection(Collection.assets)
        .where('id', isEqualTo: asset.id)
        .get();

    print('has asset? ${doc.size}');

    // TODO: 여기서 아이디 셋팅이랑 최초 구매일 셋팅 (initialBuyingDate)
    await FirebaseFirestore.instance
        .collection(Collection.workspaces)
        .doc(workspaceId)
        .collection(Collection.assets)
        .doc(asset.id)
        .set(
          asset.toJson(),
        );
    state = [...state, asset];
  }

  Future<void> updateAsset(Asset asset, String workspaceId) async {
    await FirebaseFirestore.instance
        .collection(Collection.workspaces)
        .doc(workspaceId)
        .collection(Collection.assets)
        .doc(asset.id)
        .set(asset.toJson());

    state = state.map((e) => e.id == asset.id ? asset : e).toList();
  }

  Future<void> removeAsset(Asset asset, String workspaceId) async {
    await FirebaseFirestore.instance
        .collection(Collection.workspaces)
        .doc(workspaceId)
        .collection(Collection.assets)
        .doc(asset.id)
        .delete();

    state = state.where((element) => element.id != asset.id).toList();
  }

  void clearAssets() {
    state = [];
  }

  List<Asset> getParticularAssets(String assetId) {
    final result = state.where((element) => element.id == assetId).toList();
    result.sort((a, b) => b.buyingDate.compareTo(a.buyingDate));

    return result;
  }
}
