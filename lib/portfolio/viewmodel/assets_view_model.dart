import 'package:cash_stacker_flutter_app/common/model/currency_model.dart';
import 'package:cash_stacker_flutter_app/common/providers/exchange_rate_provider.dart';
import 'package:cash_stacker_flutter_app/common/repository/asset_repository.dart';
import 'package:cash_stacker_flutter_app/home/viewmodels/workspace_viewmodel.dart';

import 'package:cash_stacker_flutter_app/setting/viewmodel/asset_type_view_model.dart';
import 'package:cash_stacker_flutter_app/swaggers/src/model/asset.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final assetViewModelProvider =
    StateNotifierProvider<AssetsViewModel, List<Asset>>(
        (ref) => AssetsViewModel(ref));

class AssetsViewModel extends StateNotifier<List<Asset>> {
  final Ref _ref;

  AssetsViewModel(this._ref) : super([]);

  String? get workspaceId {
    return _ref.read(workspaceViewModelProvider)?.workspaceId;
  }

  Asset? get krwCashAsset {
    final krwCashCategoryId =
        _ref.read(assetTypeViewModelProvider.notifier).cashAsset.assetTypeId;
    try {
      return state.firstWhere(
        (asset) => asset.assetTypeId == krwCashCategoryId,
      );
    } catch (e) {
      return null;
    }
  }

  Future<void> loadAssets() async {
    if (workspaceId != null) {
      final response = await _ref
          .read(assetRepositoryProvider)
          .getAllAssets(workspaceId: workspaceId!);

      if (response.data != null || response.data!.isNotEmpty) {
        List<Asset> assets = response.data!.toList();
        state = _sortAssets(assets);
      }
    }
  }

  Future<void> addAsset(Asset asset) async {
    if (workspaceId != null) {
      state = _sortAssets([...state, asset]);
    }
  }

  Future<void> updateAsset(Asset asset) async {
    if (workspaceId != null) {
      state = _sortAssets(state
          .map((e) => e.assetTypeId == asset.assetTypeId ? asset : e)
          .toList());
    }
  }

  Future<void> removeAsset(Asset asset) async {
    if (workspaceId != null) {
      state = _sortAssets(state
          .where((element) => element.assetTypeId != asset.assetTypeId)
          .toList());
    }
  }

  void clearAssets() {
    state = [];
  }

  Asset getParticularAssets(int assetId) {
    final result =
        state.firstWhere((element) => element.assetTypeId == assetId);

    return result;
  }

  List<Asset> _sortAssets(List<Asset> assets) {
    final cashCategoryId =
        _ref.read(assetTypeViewModelProvider.notifier).cashAsset.assetTypeId;

    List<Asset> nonCashAssets =
        assets.where((asset) => asset.assetTypeId != cashCategoryId).toList();
    List<Asset> cashAssets =
        assets.where((asset) => asset.assetTypeId == cashCategoryId).toList();
    return [...nonCashAssets, ...cashAssets];
  }

  Currency? getAssetCurrency(Asset asset) {
    final currency = _ref
        .read(exchangeRateProvider)
        .firstWhere((currency) => currency.currencyCode == asset.currencyCode);
    return currency;
  }
}
