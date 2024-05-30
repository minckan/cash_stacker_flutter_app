import 'package:cash_stacker_flutter_app/common/utill/date_format.dart';
import 'package:cash_stacker_flutter_app/common/utill/fire_store_collections.dart';
import 'package:cash_stacker_flutter_app/home/viewmodels/asset_summary_view_model.dart';
import 'package:cash_stacker_flutter_app/portfolio/model/asset_model.dart';
import 'package:cash_stacker_flutter_app/portfolio/model/asset_transaction.dart';
import 'package:cash_stacker_flutter_app/portfolio/viewmodel/asset_detail_view_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final assetViewModelProvider =
    StateNotifierProvider<AssetsViewModel, List<Asset>>(
        (ref) => AssetsViewModel(ref));

class AssetsViewModel extends StateNotifier<List<Asset>> {
  final Ref _ref;
  AssetsViewModel(this._ref) : super([]);

  Future<void> loadAssets(String workspaceId) async {
    final QuerySnapshot assetsQuery = await FirebaseFirestore.instance
        .collection(Collection.workspaces)
        .doc(workspaceId)
        .collection(Collection.assets)
        .get();

    state = assetsQuery.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>?;

      if (data != null) {
        return Asset.fromJson(data);
      } else {
        throw Exception("Document data is null");
      }
    }).toList();
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

  Asset getParticularAssets(String assetId) {
    final result = state.firstWhere((element) => element.id == assetId);

    result.transactions.sort((a, b) => b.date.compareTo(a.date));

    return result;
  }

  List<AssetTransaction> getAllAssetTransactions() {
    return state.fold<List<AssetTransaction>>([], (prev, elem) {
      return [...prev, ...elem.transactions];
    });
  }
}
