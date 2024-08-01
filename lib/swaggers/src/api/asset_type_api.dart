//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';

import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';

import 'package:built_collection/built_collection.dart';
import '../api_util.dart';
import '../model/asset_type.dart';
import '../model/create_asset_type_req.dart';
import '../model/update_asset_type_req.dart';

class AssetTypeApi {
  final Dio _dio;

  final Serializers _serializers;

  const AssetTypeApi(this._dio, this._serializers);

  /// Create a new asset type
  /// Create a new asset type for the specified workspace.
  ///
  /// Parameters:
  /// * [workspaceId] - The ID of the workspace
  /// * [createAssetTypeReq]
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [AssetType] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<AssetType>> createAssetType({
    required String workspaceId,
    required CreateAssetTypeReq createAssetTypeReq,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final path = r'/{workspaceId}/asset/type'.replaceAll(
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
      const type = FullType(CreateAssetTypeReq);
      bodyData =
          _serializers.serialize(createAssetTypeReq, specifiedType: type);
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

    AssetType? responseData;

    try {
      final rawResponse = response.data;
      responseData = rawResponse == null
          ? null
          : _serializers.deserialize(
              rawResponse,
              specifiedType: const FullType(AssetType),
            ) as AssetType;
    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<AssetType>(
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

  /// Delete an asset type
  /// Delete an existing asset type by its ID.
  ///
  /// Parameters:
  /// * [workspaceId] - The ID of the workspace
  /// * [id] - The ID of the asset type
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future]
  /// Throws [DioException] if API call or serialization fails
  Future<Response<void>> deleteAssetType({
    required String workspaceId,
    required int id,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final path = r'/{workspaceId}/asset/type/{id}'
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

  /// Get all asset types
  /// Retrieve all asset types for the specified workspace.
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
  /// Returns a [Future] containing a [Response] with a [BuiltList<AssetType>] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<BuiltList<AssetType>>> getAllAssetTypes({
    required String workspaceId,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final path = r'/{workspaceId}/asset/type'.replaceAll(
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

    BuiltList<AssetType>? responseData;

    try {
      final rawResponse = response.data;
      responseData = rawResponse == null
          ? null
          : _serializers.deserialize(
              rawResponse,
              specifiedType: const FullType(BuiltList, [FullType(AssetType)]),
            ) as BuiltList<AssetType>;
    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<BuiltList<AssetType>>(
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

  /// Update an asset type
  /// Update an existing asset type by its ID.
  ///
  /// Parameters:
  /// * [workspaceId] - The ID of the workspace
  /// * [id] - The ID of the asset type
  /// * [updateAssetTypeReq]
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [AssetType] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<AssetType>> updateAssetType({
    required String workspaceId,
    required int id,
    required UpdateAssetTypeReq updateAssetTypeReq,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final path = r'/{workspaceId}/asset/type/{id}'
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
      const type = FullType(UpdateAssetTypeReq);
      bodyData =
          _serializers.serialize(updateAssetTypeReq, specifiedType: type);
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

    AssetType? responseData;

    try {
      final rawResponse = response.data;
      responseData = rawResponse == null
          ? null
          : _serializers.deserialize(
              rawResponse,
              specifiedType: const FullType(AssetType),
            ) as AssetType;
    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<AssetType>(
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
