# openapi.api.AssetApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**workspaceIdAssetsAssetIdTransactionsIdDelete**](AssetApi.md#workspaceidassetsassetidtransactionsiddelete) | **DELETE** /{workspaceId}/assets/{assetId}/transactions/{id} | Delete an asset transaction by ID
[**workspaceIdAssetsAssetIdTransactionsIdPut**](AssetApi.md#workspaceidassetsassetidtransactionsidput) | **PUT** /{workspaceId}/assets/{assetId}/transactions/{id} | update asset transaction by ID
[**workspaceIdAssetsAssetIdTransactionsPost**](AssetApi.md#workspaceidassetsassetidtransactionspost) | **POST** /{workspaceId}/assets/{assetId}/transactions | Create a new asset transaction
[**workspaceIdAssetsGet**](AssetApi.md#workspaceidassetsget) | **GET** /{workspaceId}/assets | Get all assets
[**workspaceIdAssetsIdDelete**](AssetApi.md#workspaceidassetsiddelete) | **DELETE** /{workspaceId}/assets/{id} | Delete an asset by ID
[**workspaceIdAssetsIdGet**](AssetApi.md#workspaceidassetsidget) | **GET** /{workspaceId}/assets/{id} | asset ID로 자산 조회
[**workspaceIdAssetsIdPut**](AssetApi.md#workspaceidassetsidput) | **PUT** /{workspaceId}/assets/{id} | 자산 데이터 수정
[**workspaceIdAssetsMonthlyTrendGet**](AssetApi.md#workspaceidassetsmonthlytrendget) | **GET** /{workspaceId}/assets/monthlyTrend | Get monthly asset trend
[**workspaceIdAssetsPost**](AssetApi.md#workspaceidassetspost) | **POST** /{workspaceId}/assets | Create a new asset


# **workspaceIdAssetsAssetIdTransactionsIdDelete**
> WorkspaceIdAssetsAssetIdTransactionsIdDelete201Response workspaceIdAssetsAssetIdTransactionsIdDelete(workspaceId, assetId, id)

Delete an asset transaction by ID

Delete a specific asset transaction by its ID.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAssetApi();
final String workspaceId = workspaceId_example; // String | The ID of the workspace
final int assetId = 56; // int | The ID of the asset
final int id = 56; // int | The ID of the asset transaction

try {
    final response = api.workspaceIdAssetsAssetIdTransactionsIdDelete(workspaceId, assetId, id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AssetApi->workspaceIdAssetsAssetIdTransactionsIdDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workspaceId** | **String**| The ID of the workspace | 
 **assetId** | **int**| The ID of the asset | 
 **id** | **int**| The ID of the asset transaction | 

### Return type

[**WorkspaceIdAssetsAssetIdTransactionsIdDelete201Response**](WorkspaceIdAssetsAssetIdTransactionsIdDelete201Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **workspaceIdAssetsAssetIdTransactionsIdPut**
> AssetTransaction workspaceIdAssetsAssetIdTransactionsIdPut(workspaceId, assetId, id, workspaceIdAssetsAssetIdTransactionsIdPutRequest)

update asset transaction by ID

update specific asset transaction by its ID.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAssetApi();
final String workspaceId = workspaceId_example; // String | The ID of the workspace
final int assetId = 56; // int | The ID of the asset
final int id = 56; // int | The ID of the asset transaction
final WorkspaceIdAssetsAssetIdTransactionsIdPutRequest workspaceIdAssetsAssetIdTransactionsIdPutRequest = ; // WorkspaceIdAssetsAssetIdTransactionsIdPutRequest | 

try {
    final response = api.workspaceIdAssetsAssetIdTransactionsIdPut(workspaceId, assetId, id, workspaceIdAssetsAssetIdTransactionsIdPutRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AssetApi->workspaceIdAssetsAssetIdTransactionsIdPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workspaceId** | **String**| The ID of the workspace | 
 **assetId** | **int**| The ID of the asset | 
 **id** | **int**| The ID of the asset transaction | 
 **workspaceIdAssetsAssetIdTransactionsIdPutRequest** | [**WorkspaceIdAssetsAssetIdTransactionsIdPutRequest**](WorkspaceIdAssetsAssetIdTransactionsIdPutRequest.md)|  | 

### Return type

[**AssetTransaction**](AssetTransaction.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **workspaceIdAssetsAssetIdTransactionsPost**
> AssetTransaction workspaceIdAssetsAssetIdTransactionsPost(workspaceId, assetId, assetTransaction)

Create a new asset transaction

Create a new asset transaction for the specified asset

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAssetApi();
final String workspaceId = workspaceId_example; // String | The ID of the workspace
final String assetId = assetId_example; // String | The ID of the asset
final AssetTransaction assetTransaction = ; // AssetTransaction | 

try {
    final response = api.workspaceIdAssetsAssetIdTransactionsPost(workspaceId, assetId, assetTransaction);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AssetApi->workspaceIdAssetsAssetIdTransactionsPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workspaceId** | **String**| The ID of the workspace | 
 **assetId** | **String**| The ID of the asset | 
 **assetTransaction** | [**AssetTransaction**](AssetTransaction.md)|  | 

### Return type

[**AssetTransaction**](AssetTransaction.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **workspaceIdAssetsGet**
> BuiltList<Asset> workspaceIdAssetsGet(workspaceId)

Get all assets

Retrieve all assets for the specified workspace.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAssetApi();
final String workspaceId = workspaceId_example; // String | The ID of the workspace

try {
    final response = api.workspaceIdAssetsGet(workspaceId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AssetApi->workspaceIdAssetsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workspaceId** | **String**| The ID of the workspace | 

### Return type

[**BuiltList&lt;Asset&gt;**](Asset.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **workspaceIdAssetsIdDelete**
> workspaceIdAssetsIdDelete(workspaceId, id)

Delete an asset by ID

Delete a specific asset by its ID.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAssetApi();
final String workspaceId = workspaceId_example; // String | The ID of the workspace
final int id = 56; // int | The ID of the asset

try {
    api.workspaceIdAssetsIdDelete(workspaceId, id);
} catch on DioException (e) {
    print('Exception when calling AssetApi->workspaceIdAssetsIdDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workspaceId** | **String**| The ID of the workspace | 
 **id** | **int**| The ID of the asset | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **workspaceIdAssetsIdGet**
> Asset workspaceIdAssetsIdGet(workspaceId, id)

asset ID로 자산 조회

Retrieve a specific asset by its ID.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAssetApi();
final String workspaceId = workspaceId_example; // String | The ID of the workspace
final int id = 56; // int | The ID of the asset

try {
    final response = api.workspaceIdAssetsIdGet(workspaceId, id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AssetApi->workspaceIdAssetsIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workspaceId** | **String**| The ID of the workspace | 
 **id** | **int**| The ID of the asset | 

### Return type

[**Asset**](Asset.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **workspaceIdAssetsIdPut**
> Asset workspaceIdAssetsIdPut(workspaceId, id, workspaceIdAssetsIdPutRequest)

자산 데이터 수정

Update the name of a specific asset by its ID.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAssetApi();
final String workspaceId = workspaceId_example; // String | The ID of the workspace
final int id = 56; // int | The ID of the asset
final WorkspaceIdAssetsIdPutRequest workspaceIdAssetsIdPutRequest = ; // WorkspaceIdAssetsIdPutRequest | 

try {
    final response = api.workspaceIdAssetsIdPut(workspaceId, id, workspaceIdAssetsIdPutRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AssetApi->workspaceIdAssetsIdPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workspaceId** | **String**| The ID of the workspace | 
 **id** | **int**| The ID of the asset | 
 **workspaceIdAssetsIdPutRequest** | [**WorkspaceIdAssetsIdPutRequest**](WorkspaceIdAssetsIdPutRequest.md)|  | 

### Return type

[**Asset**](Asset.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **workspaceIdAssetsMonthlyTrendGet**
> BuiltList<WorkspaceIdAssetsMonthlyTrendGet200ResponseInner> workspaceIdAssetsMonthlyTrendGet(workspaceId)

Get monthly asset trend

Retrieve the monthly trend of assets for the specified workspace.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAssetApi();
final String workspaceId = workspaceId_example; // String | The ID of the workspace

try {
    final response = api.workspaceIdAssetsMonthlyTrendGet(workspaceId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AssetApi->workspaceIdAssetsMonthlyTrendGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workspaceId** | **String**| The ID of the workspace | 

### Return type

[**BuiltList&lt;WorkspaceIdAssetsMonthlyTrendGet200ResponseInner&gt;**](WorkspaceIdAssetsMonthlyTrendGet200ResponseInner.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **workspaceIdAssetsPost**
> Asset workspaceIdAssetsPost(workspaceId, workspaceIdAssetsPostRequest)

Create a new asset

Create a new asset for the specified workspace.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAssetApi();
final String workspaceId = workspaceId_example; // String | The ID of the workspace
final WorkspaceIdAssetsPostRequest workspaceIdAssetsPostRequest = ; // WorkspaceIdAssetsPostRequest | 

try {
    final response = api.workspaceIdAssetsPost(workspaceId, workspaceIdAssetsPostRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AssetApi->workspaceIdAssetsPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workspaceId** | **String**| The ID of the workspace | 
 **workspaceIdAssetsPostRequest** | [**WorkspaceIdAssetsPostRequest**](WorkspaceIdAssetsPostRequest.md)|  | 

### Return type

[**Asset**](Asset.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

