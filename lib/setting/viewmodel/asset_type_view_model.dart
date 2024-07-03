import 'package:cash_stacker_flutter_app/common/repository/asset_type_repository.dart';
import 'package:cash_stacker_flutter_app/swaggers/openapi.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final assetTypeViewModelProvider =
    StateNotifierProvider<AssetTypeViewModel, List<AssetType>>(
        (ref) => AssetTypeViewModel(ref));

class AssetTypeViewModel extends StateNotifier<List<AssetType>> {
  final Ref _ref;
  AssetTypeViewModel(this._ref) : super([]);

  AssetType get cashAsset {
    return state.firstWhere((item) => item.assetTypeName == '현금');
  }

  AssetType get foreignCashAsset {
    return state.firstWhere((item) => item.assetTypeName == '외환');
  }

  Future<void> loadCategory({required String workspaceId}) async {
    try {
      final response = await _ref
          .read(assetTypeRepositoryProvider)
          .getAllAssetTypes(workspaceId: workspaceId);

      if (response.data != null) {
        state = response.data!.toList();
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> addCategory(
      WorkspaceIdAssetTypePostRequest category, String workspaceId) async {
    try {
      final response = await _ref
          .read(assetTypeRepositoryProvider)
          .createAssetType(workspaceId: workspaceId, body: category);
      if (response.data != null) {
        state = [...state, response.data!];
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateCategory(
    int id,
    WorkspaceIdAssetTypePostRequest category,
    String workspaceId,
  ) async {
    try {
      final response =
          await _ref.read(assetTypeRepositoryProvider).updateAssetType(
                workspaceId: workspaceId,
                id: id,
                body: category,
              );

      if (response.data != null) {
        state =
            state.map((e) => e.assetTypeId == id ? response.data! : e).toList();
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> removeCategory(int categoryId, String workspaceId) async {
    try {
      await _ref
          .read(assetTypeRepositoryProvider)
          .deleteAssetType(workspaceId: workspaceId, id: categoryId);
      state = state.where((e) => e.assetTypeId != categoryId).toList();
    } catch (e) {
      print(e);
    }
  }
}
