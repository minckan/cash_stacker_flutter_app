import 'package:built_collection/built_collection.dart';
import 'package:cash_stacker_flutter_app/common/dio/dio.dart';
import 'package:cash_stacker_flutter_app/swaggers/openapi.dart';
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
    required CreateAssetReq body,
  }) {
    return _assetApi.createNewAsset(
      workspaceId: workspaceId,
      createAssetReq: body,
    );
  }

  Future<Response<AllAssetsResponseType>> getAllAssetsTransactions({
    required String workspaceId,
  }) {
    return _assetApi.getAllAssetsTransaction(
      workspaceId: workspaceId,
    );
  }

  Future<Response<AssetDetailResponseType>> getOneAsset({
    required String workspaceId,
    required int id,
  }) {
    return _assetApi.getAssetById(
      workspaceId: workspaceId,
      id: id,
    );
  }

  Future<Response<Asset>> updateAsset({
    required String workspaceId,
    required int id,
    required UpdateAssetRes body,
  }) {
    return _assetApi.updateAsset(
      workspaceId: workspaceId,
      id: id,
      updateAssetRes: body,
    );
  }

  Future<Response<void>> deleteAsset({
    required String workspaceId,
    required int id,
  }) {
    return _assetApi.deleteAsset(
      workspaceId: workspaceId,
      id: id,
    );
  }

  Future<Response<AssetTransaction>> createAssetTransaction({
    required String workspaceId,
    required int assetId,
    required AssetTransactionRequest body,
  }) {
    return _assetApi.createAssetTransaction(
      workspaceId: workspaceId,
      assetId: assetId.toString(),
      assetTransactionRequest: body,
    );
  }

  Future<Response<AssetTransaction>> updateAssetTransaction({
    required String workspaceId,
    required int assetId,
    required int id,
    required UpdateAssetTransactionByIdReq body,
  }) {
    return _assetApi.updateAssetTransactionById(
      workspaceId: workspaceId,
      id: id,
      updateAssetTransactionByIdReq: body,
      assetId: assetId,
    );
  }

  Future<Response<DeleteAssetTransaction201Response>> deleteAssetTransaction({
    required String workspaceId,
    required int assetId,
    required int id,
  }) {
    return _assetApi.deleteAssetTransaction(
      workspaceId: workspaceId,
      assetId: assetId,
      id: id,
    );
  }

  Future<Response<BuiltList<GetMonthlyAssetTrend200ResponseInner>>>
      getMonthlyTrends({
    required String workspaceId,
  }) {
    return _assetApi.getMonthlyAssetTrend(
      workspaceId: workspaceId,
    );
  }
}
