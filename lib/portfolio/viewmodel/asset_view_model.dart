import 'package:cash_stacker_flutter_app/common/utill/fire_store_collections.dart';
import 'package:cash_stacker_flutter_app/common/utill/logger.dart';
import 'package:cash_stacker_flutter_app/common/utill/number_format.dart';
import 'package:cash_stacker_flutter_app/common/viewmodels/exchange_rate_view_model.dart';
import 'package:cash_stacker_flutter_app/portfolio/model/asset_model.dart';
import 'package:cash_stacker_flutter_app/portfolio/model/asset_transaction.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final assetViewModelProvider =
    StateNotifierProvider<AssetViewModel, List<Asset>>(
        (ref) => AssetViewModel(ref));

class AssetViewModel extends StateNotifier<List<Asset>> {
  final Ref _ref;
  AssetViewModel(this._ref) : super([]);

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

  /// 현재가(원화)/ 현재환율 필요.
  /// 현재 환율 * 현재가
  double getCurrentKrwPrice(Asset asset) {
    final exchangeRate = _ref
        .watch(exchangeRateProvider)
        .firstWhere((rate) => rate.cur_unit == asset.currency?.currencyCode);

    if (asset.currency?.currencyCode == 'KRW') {
      return asset.inputCurrentPrice;
    } else {
      return asset.inputCurrentPrice *
          double.parse(removeComma(exchangeRate.deal_bas_r));
    }
  }

  ///현재 평가액(원화)
  double getCurrentKrwTotalEvaluation(Asset asset) {
    return getCurrentKrwPrice(asset) * asset.totalQuantity;
  }

  /// 원화 환산 수익률
  double getKrwProfitLossRate(Asset asset) {
    final totalPurchase = asset.totalPurchaseAmount;
    final totalEval = getCurrentKrwTotalEvaluation(asset);
    return totalPurchase > 0
        ? ((totalEval - totalPurchase) / totalPurchase) * 100
        : 0;
  }
}
