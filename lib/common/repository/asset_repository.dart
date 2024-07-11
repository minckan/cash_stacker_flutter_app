import 'package:built_collection/built_collection.dart';
import 'package:cash_stacker_flutter_app/common/dio/dio.dart';
import 'package:cash_stacker_flutter_app/swaggers/src/api.dart';

import 'package:cash_stacker_flutter_app/swaggers/src/api/asset_api.dart';
import 'package:cash_stacker_flutter_app/swaggers/src/model/asset.dart';
import 'package:cash_stacker_flutter_app/swaggers/src/model/asset_transaction.dart';
import 'package:cash_stacker_flutter_app/swaggers/src/model/workspace_id_assets_asset_id_transactions_id_delete201_response.dart';
import 'package:cash_stacker_flutter_app/swaggers/src/model/workspace_id_assets_asset_id_transactions_id_put_request.dart';
import 'package:cash_stacker_flutter_app/swaggers/src/model/workspace_id_assets_id_put_request.dart';
import 'package:cash_stacker_flutter_app/swaggers/src/model/workspace_id_assets_monthly_trend_get200_response_inner.dart';
import 'package:cash_stacker_flutter_app/swaggers/src/model/workspace_id_assets_post_request.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_riverpod/flutter_riverpod.dart';

final assetRepositoryProvider = Provider<AssetRepository>(
  (ref) {
    final dio = ref.watch(dioProvider);
    final openapi = Openapi(dio: dio);
    final repository = AssetRepository(openapi.getAssetApi());
    return repository;
  },
);

class AssetRepository {
  final AssetApi _assetApi;
  AssetRepository(this._assetApi);

  static const basePath = '/{workspaceId}/assets';

  Future<Response<Asset>> createAsset({
    required String workspaceId,
    required WorkspaceIdAssetsPostRequest body,
  }) {
    return _assetApi.workspaceIdAssetsPost(
      workspaceId: workspaceId,
      workspaceIdAssetsPostRequest: body,
    );
  }

  Future<Response<BuiltList<Asset>>> getAllAssets({
    required String workspaceId,
  }) {
    return _assetApi.workspaceIdAssetsGet(
      workspaceId: workspaceId,
    );
  }

  Future<Response<Asset>> getOneAsset({
    required String workspaceId,
    required int id,
  }) {
    return _assetApi.workspaceIdAssetsIdGet(
      workspaceId: workspaceId,
      id: id,
    );
  }

  Future<Response<Asset>> updateAsset({
    required String workspaceId,
    required int id,
    required WorkspaceIdAssetsIdPutRequest body,
  }) {
    return _assetApi.workspaceIdAssetsIdPut(
      workspaceId: workspaceId,
      id: id,
      workspaceIdAssetsIdPutRequest: body,
    );
  }

  Future<Response<void>> deleteAsset({
    required String workspaceId,
    required int id,
  }) {
    return _assetApi.workspaceIdAssetsIdDelete(
      workspaceId: workspaceId,
      id: id,
    );
  }

  Future<Response<AssetTransaction>> updateAssetTransaction({
    required String workspaceId,
    required int assetId,
    required int id,
    required WorkspaceIdAssetsAssetIdTransactionsIdPutRequest body,
  }) {
    return _assetApi.workspaceIdAssetsAssetIdTransactionsIdPut(
      workspaceId: workspaceId,
      assetId: assetId,
      id: id,
      workspaceIdAssetsAssetIdTransactionsIdPutRequest: body,
    );
  }

  Future<Response<WorkspaceIdAssetsAssetIdTransactionsIdDelete201Response>>
      deleteAssetTransaction({
    required String workspaceId,
    required int assetId,
    required int id,
  }) {
    return _assetApi.workspaceIdAssetsAssetIdTransactionsIdDelete(
      workspaceId: workspaceId,
      assetId: assetId,
      id: id,
    );
  }

  Future<Response<BuiltList<WorkspaceIdAssetsMonthlyTrendGet200ResponseInner>>>
      getMonthlyTrends({
    required String workspaceId,
  }) {
    return _assetApi.workspaceIdAssetsMonthlyTrendGet(
      workspaceId: workspaceId,
    );
  }
}
