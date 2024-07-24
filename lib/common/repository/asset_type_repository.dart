import 'package:built_collection/built_collection.dart';
import 'package:cash_stacker_flutter_app/common/dio/dio.dart';
import 'package:cash_stacker_flutter_app/swaggers/openapi.dart';

import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_riverpod/flutter_riverpod.dart';

final assetTypeRepositoryProvider = Provider<AssetTypeRepository>(
  (ref) {
    final dio = ref.watch(dioProvider);
    final openapi = Openapi(dio: dio);
    final repository = AssetTypeRepository(openapi.getAssetTypeApi());
    return repository;
  },
);

class AssetTypeRepository {
  final AssetTypeApi _assetTypeApi;

  AssetTypeRepository(this._assetTypeApi);

  static const basePath = '/{workspaceId}/asset/type';

  Future<Response<BuiltList<AssetType>>> getAllAssetTypes({
    required String workspaceId,
  }) {
    return _assetTypeApi.workspaceIdAssetTypeGet(
      workspaceId: workspaceId,
    );
  }

  Future<Response<AssetType>> createAssetType({
    required String workspaceId,
    required WorkspaceIdAssetTypePostRequest body,
  }) {
    return _assetTypeApi.workspaceIdAssetTypePost(
      workspaceId: workspaceId,
      workspaceIdAssetTypePostRequest: body,
    );
  }

  Future<Response<AssetType>> updateAssetType({
    required String workspaceId,
    required int id,
    required WorkspaceIdAssetTypeIdPutRequest body,
  }) {
    return _assetTypeApi.workspaceIdAssetTypeIdPut(
      workspaceId: workspaceId,
      id: id,
      workspaceIdAssetTypeIdPutRequest: body,
    );
  }

  Future<Response<void>> deleteAssetType({
    required String workspaceId,
    required int id,
  }) {
    return _assetTypeApi.workspaceIdAssetTypeIdDelete(
      workspaceId: workspaceId,
      id: id,
    );
  }
}
