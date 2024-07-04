//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';

import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';

import 'package:built_collection/built_collection.dart';
import '../api_util.dart';
import '../model/asset.dart';
import '../model/asset_transaction.dart';
import '../model/workspace_id_assets_asset_id_transactions_id_delete201_response.dart';
import '../model/workspace_id_assets_asset_id_transactions_id_delete500_response.dart';
import '../model/workspace_id_assets_asset_id_transactions_id_put_request.dart';
import '../model/workspace_id_assets_id_put_request.dart';
import '../model/workspace_id_assets_monthly_trend_get200_response_inner.dart';
import '../model/workspace_id_assets_post_request.dart';

class AssetApi {
  final Dio _dio;

  final Serializers _serializers;

  const AssetApi(this._dio, this._serializers);

  /// Delete an asset transaction by ID
  /// Delete a specific asset transaction by its ID.
  ///
  /// Parameters:
  /// * [workspaceId] - The ID of the workspace
  /// * [assetId] - The ID of the asset
  /// * [id] - The ID of the asset transaction
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [WorkspaceIdAssetsAssetIdTransactionsIdDelete201Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<WorkspaceIdAssetsAssetIdTransactionsIdDelete201Response>>
      workspaceIdAssetsAssetIdTransactionsIdDelete({
    required String workspaceId,
    required int assetId,
    required int id,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final path = r'/{workspaceId}/assets/{assetId}/transactions/{id}'
        .replaceAll(
            '{' r'workspaceId' '}',
            encodeQueryParameter(
                    _serializers, workspaceId, const FullType(String))
                .toString())
        .replaceAll(
            '{' r'assetId' '}',
            encodeQueryParameter(_serializers, assetId, const FullType(int))
                .toString())
        .replaceAll(
            '{' r'id' '}',
            encodeQueryParameter(_serializers, id, const FullType(int))
                .toString());
    final options = Options(
      method: r'DELETE',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {
            'type': 'http',
            'scheme': 'bearer',
            'name': 'bearerAuth',
          },
        ],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final response = await _dio.request<Object>(
      path,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    WorkspaceIdAssetsAssetIdTransactionsIdDelete201Response? responseData;

    try {
      final rawResponse = response.data;
      responseData = rawResponse == null
          ? null
          : _serializers.deserialize(
              rawResponse,
              specifiedType: const FullType(
                  WorkspaceIdAssetsAssetIdTransactionsIdDelete201Response),
            ) as WorkspaceIdAssetsAssetIdTransactionsIdDelete201Response;
    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<WorkspaceIdAssetsAssetIdTransactionsIdDelete201Response>(
      data: responseData,
      headers: response.headers,
      isRedirect: response.isRedirect,
      requestOptions: response.requestOptions,
      redirects: response.redirects,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      extra: response.extra,
    );
  }

  /// update asset transaction by ID
  /// update specific asset transaction by its ID.
  ///
  /// Parameters:
  /// * [workspaceId] - The ID of the workspace
  /// * [assetId] - The ID of the asset
  /// * [id] - The ID of the asset transaction
  /// * [workspaceIdAssetsAssetIdTransactionsIdPutRequest]
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [AssetTransaction] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<AssetTransaction>> workspaceIdAssetsAssetIdTransactionsIdPut({
    required String workspaceId,
    required int assetId,
    required int id,
    required WorkspaceIdAssetsAssetIdTransactionsIdPutRequest
        workspaceIdAssetsAssetIdTransactionsIdPutRequest,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final path = r'/{workspaceId}/assets/{assetId}/transactions/{id}'
        .replaceAll(
            '{' r'workspaceId' '}',
            encodeQueryParameter(
                    _serializers, workspaceId, const FullType(String))
                .toString())
        .replaceAll(
            '{' r'assetId' '}',
            encodeQueryParameter(_serializers, assetId, const FullType(int))
                .toString())
        .replaceAll(
            '{' r'id' '}',
            encodeQueryParameter(_serializers, id, const FullType(int))
                .toString());
    final options = Options(
      method: r'PUT',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {
            'type': 'http',
            'scheme': 'bearer',
            'name': 'bearerAuth',
          },
        ],
        ...?extra,
      },
      contentType: 'application/json',
      validateStatus: validateStatus,
    );

    dynamic bodyData;

    try {
      const type = FullType(WorkspaceIdAssetsAssetIdTransactionsIdPutRequest);
      bodyData = _serializers.serialize(
          workspaceIdAssetsAssetIdTransactionsIdPutRequest,
          specifiedType: type);
    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: options.compose(
          _dio.options,
          path,
        ),
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    final response = await _dio.request<Object>(
      path,
      data: bodyData,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    AssetTransaction? responseData;

    try {
      final rawResponse = response.data;
      responseData = rawResponse == null
          ? null
          : _serializers.deserialize(
              rawResponse,
              specifiedType: const FullType(AssetTransaction),
            ) as AssetTransaction;
    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<AssetTransaction>(
      data: responseData,
      headers: response.headers,
      isRedirect: response.isRedirect,
      requestOptions: response.requestOptions,
      redirects: response.redirects,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      extra: response.extra,
    );
  }

  /// Create a new asset transaction
  /// Create a new asset transaction for the specified asset
  ///
  /// Parameters:
  /// * [workspaceId] - The ID of the workspace
  /// * [assetId] - The ID of the asset
  /// * [assetTransaction]
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [AssetTransaction] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<AssetTransaction>> workspaceIdAssetsAssetIdTransactionsPost({
    required String workspaceId,
    required String assetId,
    required AssetTransaction assetTransaction,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final path = r'/{workspaceId}/assets/{assetId}/transactions'
        .replaceAll(
            '{' r'workspaceId' '}',
            encodeQueryParameter(
                    _serializers, workspaceId, const FullType(String))
                .toString())
        .replaceAll(
            '{' r'assetId' '}',
            encodeQueryParameter(_serializers, assetId, const FullType(String))
                .toString());
    final options = Options(
      method: r'POST',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {
            'type': 'http',
            'scheme': 'bearer',
            'name': 'bearerAuth',
          },
        ],
        ...?extra,
      },
      contentType: 'application/json',
      validateStatus: validateStatus,
    );

    dynamic bodyData;

    try {
      const type = FullType(AssetTransaction);
      bodyData = _serializers.serialize(assetTransaction, specifiedType: type);
    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: options.compose(
          _dio.options,
          path,
        ),
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    final response = await _dio.request<Object>(
      path,
      data: bodyData,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    AssetTransaction? responseData;

    try {
      final rawResponse = response.data;
      responseData = rawResponse == null
          ? null
          : _serializers.deserialize(
              rawResponse,
              specifiedType: const FullType(AssetTransaction),
            ) as AssetTransaction;
    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<AssetTransaction>(
      data: responseData,
      headers: response.headers,
      isRedirect: response.isRedirect,
      requestOptions: response.requestOptions,
      redirects: response.redirects,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      extra: response.extra,
    );
  }

  /// Get all assets
  /// Retrieve all assets for the specified workspace.
  ///
  /// Parameters:
  /// * [workspaceId] - The ID of the workspace
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [BuiltList<Asset>] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<BuiltList<Asset>>> workspaceIdAssetsGet({
    required String workspaceId,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final path = r'/{workspaceId}/assets'.replaceAll(
        '{' r'workspaceId' '}',
        encodeQueryParameter(_serializers, workspaceId, const FullType(String))
            .toString());
    final options = Options(
      method: r'GET',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {
            'type': 'http',
            'scheme': 'bearer',
            'name': 'bearerAuth',
          },
        ],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final response = await _dio.request<Object>(
      path,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    BuiltList<Asset>? responseData;

    try {
      final rawResponse = response.data;
      responseData = rawResponse == null
          ? null
          : _serializers.deserialize(
              rawResponse,
              specifiedType: const FullType(BuiltList, [FullType(Asset)]),
            ) as BuiltList<Asset>;
    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<BuiltList<Asset>>(
      data: responseData,
      headers: response.headers,
      isRedirect: response.isRedirect,
      requestOptions: response.requestOptions,
      redirects: response.redirects,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      extra: response.extra,
    );
  }

  /// Delete an asset by ID
  /// Delete a specific asset by its ID.
  ///
  /// Parameters:
  /// * [workspaceId] - The ID of the workspace
  /// * [id] - The ID of the asset
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future]
  /// Throws [DioException] if API call or serialization fails
  Future<Response<void>> workspaceIdAssetsIdDelete({
    required String workspaceId,
    required int id,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final path = r'/{workspaceId}/assets/{id}'
        .replaceAll(
            '{' r'workspaceId' '}',
            encodeQueryParameter(
                    _serializers, workspaceId, const FullType(String))
                .toString())
        .replaceAll(
            '{' r'id' '}',
            encodeQueryParameter(_serializers, id, const FullType(int))
                .toString());
    final options = Options(
      method: r'DELETE',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {
            'type': 'http',
            'scheme': 'bearer',
            'name': 'bearerAuth',
          },
        ],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final response = await _dio.request<Object>(
      path,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    return response;
  }

  /// asset ID로 자산 조회
  /// Retrieve a specific asset by its ID.
  ///
  /// Parameters:
  /// * [workspaceId] - The ID of the workspace
  /// * [id] - The ID of the asset
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [Asset] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<Asset>> workspaceIdAssetsIdGet({
    required String workspaceId,
    required int id,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final path = r'/{workspaceId}/assets/{id}'
        .replaceAll(
            '{' r'workspaceId' '}',
            encodeQueryParameter(
                    _serializers, workspaceId, const FullType(String))
                .toString())
        .replaceAll(
            '{' r'id' '}',
            encodeQueryParameter(_serializers, id, const FullType(int))
                .toString());
    final options = Options(
      method: r'GET',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {
            'type': 'http',
            'scheme': 'bearer',
            'name': 'bearerAuth',
          },
        ],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final response = await _dio.request<Object>(
      path,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    Asset? responseData;

    try {
      final rawResponse = response.data;
      responseData = rawResponse == null
          ? null
          : _serializers.deserialize(
              rawResponse,
              specifiedType: const FullType(Asset),
            ) as Asset;
    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<Asset>(
      data: responseData,
      headers: response.headers,
      isRedirect: response.isRedirect,
      requestOptions: response.requestOptions,
      redirects: response.redirects,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      extra: response.extra,
    );
  }

  /// 자산 데이터 수정
  /// Update the name of a specific asset by its ID.
  ///
  /// Parameters:
  /// * [workspaceId] - The ID of the workspace
  /// * [id] - The ID of the asset
  /// * [workspaceIdAssetsIdPutRequest]
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [Asset] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<Asset>> workspaceIdAssetsIdPut({
    required String workspaceId,
    required int id,
    required WorkspaceIdAssetsIdPutRequest workspaceIdAssetsIdPutRequest,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final path = r'/{workspaceId}/assets/{id}'
        .replaceAll(
            '{' r'workspaceId' '}',
            encodeQueryParameter(
                    _serializers, workspaceId, const FullType(String))
                .toString())
        .replaceAll(
            '{' r'id' '}',
            encodeQueryParameter(_serializers, id, const FullType(int))
                .toString());
    final options = Options(
      method: r'PUT',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {
            'type': 'http',
            'scheme': 'bearer',
            'name': 'bearerAuth',
          },
        ],
        ...?extra,
      },
      contentType: 'application/json',
      validateStatus: validateStatus,
    );

    dynamic bodyData;

    try {
      const type = FullType(WorkspaceIdAssetsIdPutRequest);
      bodyData = _serializers.serialize(workspaceIdAssetsIdPutRequest,
          specifiedType: type);
    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: options.compose(
          _dio.options,
          path,
        ),
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    final response = await _dio.request<Object>(
      path,
      data: bodyData,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    Asset? responseData;

    try {
      final rawResponse = response.data;
      responseData = rawResponse == null
          ? null
          : _serializers.deserialize(
              rawResponse,
              specifiedType: const FullType(Asset),
            ) as Asset;
    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<Asset>(
      data: responseData,
      headers: response.headers,
      isRedirect: response.isRedirect,
      requestOptions: response.requestOptions,
      redirects: response.redirects,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      extra: response.extra,
    );
  }

  /// Get monthly asset trend
  /// Retrieve the monthly trend of assets for the specified workspace.
  ///
  /// Parameters:
  /// * [workspaceId] - The ID of the workspace
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [BuiltList<WorkspaceIdAssetsMonthlyTrendGet200ResponseInner>] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<BuiltList<WorkspaceIdAssetsMonthlyTrendGet200ResponseInner>>>
      workspaceIdAssetsMonthlyTrendGet({
    required String workspaceId,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final path = r'/{workspaceId}/assets/monthlyTrend'.replaceAll(
        '{' r'workspaceId' '}',
        encodeQueryParameter(_serializers, workspaceId, const FullType(String))
            .toString());
    final options = Options(
      method: r'GET',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {
            'type': 'http',
            'scheme': 'bearer',
            'name': 'bearerAuth',
          },
        ],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final response = await _dio.request<Object>(
      path,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    BuiltList<WorkspaceIdAssetsMonthlyTrendGet200ResponseInner>? responseData;

    try {
      final rawResponse = response.data;
      responseData = rawResponse == null
          ? null
          : _serializers.deserialize(
              rawResponse,
              specifiedType: const FullType(BuiltList,
                  [FullType(WorkspaceIdAssetsMonthlyTrendGet200ResponseInner)]),
            ) as BuiltList<WorkspaceIdAssetsMonthlyTrendGet200ResponseInner>;
    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<
        BuiltList<WorkspaceIdAssetsMonthlyTrendGet200ResponseInner>>(
      data: responseData,
      headers: response.headers,
      isRedirect: response.isRedirect,
      requestOptions: response.requestOptions,
      redirects: response.redirects,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      extra: response.extra,
    );
  }

  /// Create a new asset
  /// Create a new asset for the specified workspace.
  ///
  /// Parameters:
  /// * [workspaceId] - The ID of the workspace
  /// * [workspaceIdAssetsPostRequest]
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [Asset] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<Asset>> workspaceIdAssetsPost({
    required String workspaceId,
    required WorkspaceIdAssetsPostRequest workspaceIdAssetsPostRequest,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final path = r'/{workspaceId}/assets'.replaceAll(
        '{' r'workspaceId' '}',
        encodeQueryParameter(_serializers, workspaceId, const FullType(String))
            .toString());
    final options = Options(
      method: r'POST',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {
            'type': 'http',
            'scheme': 'bearer',
            'name': 'bearerAuth',
          },
        ],
        ...?extra,
      },
      contentType: 'application/json',
      validateStatus: validateStatus,
    );

    dynamic bodyData;

    try {
      const type = FullType(WorkspaceIdAssetsPostRequest);
      bodyData = _serializers.serialize(workspaceIdAssetsPostRequest,
          specifiedType: type);
    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: options.compose(
          _dio.options,
          path,
        ),
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    final response = await _dio.request<Object>(
      path,
      data: bodyData,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    Asset? responseData;

    try {
      final rawResponse = response.data;
      responseData = rawResponse == null
          ? null
          : _serializers.deserialize(
              rawResponse,
              specifiedType: const FullType(Asset),
            ) as Asset;
    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<Asset>(
      data: responseData,
      headers: response.headers,
      isRedirect: response.isRedirect,
      requestOptions: response.requestOptions,
      redirects: response.redirects,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      extra: response.extra,
    );
  }
}
