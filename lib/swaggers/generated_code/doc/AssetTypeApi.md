# openapi.api.AssetTypeApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**workspaceIdAssetTypeGet**](AssetTypeApi.md#workspaceidassettypeget) | **GET** /{workspaceId}/asset/type | Get all asset types
[**workspaceIdAssetTypeIdDelete**](AssetTypeApi.md#workspaceidassettypeiddelete) | **DELETE** /{workspaceId}/asset/type/{id} | Delete an asset type
[**workspaceIdAssetTypeIdPut**](AssetTypeApi.md#workspaceidassettypeidput) | **PUT** /{workspaceId}/asset/type/{id} | Update an asset type
[**workspaceIdAssetTypePost**](AssetTypeApi.md#workspaceidassettypepost) | **POST** /{workspaceId}/asset/type | Create a new asset type


# **workspaceIdAssetTypeGet**
> BuiltList<AssetType> workspaceIdAssetTypeGet(workspaceId)

Get all asset types

Retrieve all asset types for the specified workspace.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAssetTypeApi();
final String workspaceId = workspaceId_example; // String | The ID of the workspace

try {
    final response = api.workspaceIdAssetTypeGet(workspaceId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AssetTypeApi->workspaceIdAssetTypeGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workspaceId** | **String**| The ID of the workspace | 

### Return type

[**BuiltList&lt;AssetType&gt;**](AssetType.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **workspaceIdAssetTypeIdDelete**
> workspaceIdAssetTypeIdDelete(workspaceId, id)

Delete an asset type

Delete an existing asset type by its ID.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAssetTypeApi();
final String workspaceId = workspaceId_example; // String | The ID of the workspace
final int id = 56; // int | The ID of the asset type

try {
    api.workspaceIdAssetTypeIdDelete(workspaceId, id);
} catch on DioException (e) {
    print('Exception when calling AssetTypeApi->workspaceIdAssetTypeIdDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workspaceId** | **String**| The ID of the workspace | 
 **id** | **int**| The ID of the asset type | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **workspaceIdAssetTypeIdPut**
> AssetType workspaceIdAssetTypeIdPut(workspaceId, id, workspaceIdAssetTypeIdPutRequest)

Update an asset type

Update an existing asset type by its ID.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAssetTypeApi();
final String workspaceId = workspaceId_example; // String | The ID of the workspace
final int id = 56; // int | The ID of the asset type
final WorkspaceIdAssetTypeIdPutRequest workspaceIdAssetTypeIdPutRequest = ; // WorkspaceIdAssetTypeIdPutRequest | 

try {
    final response = api.workspaceIdAssetTypeIdPut(workspaceId, id, workspaceIdAssetTypeIdPutRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AssetTypeApi->workspaceIdAssetTypeIdPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workspaceId** | **String**| The ID of the workspace | 
 **id** | **int**| The ID of the asset type | 
 **workspaceIdAssetTypeIdPutRequest** | [**WorkspaceIdAssetTypeIdPutRequest**](WorkspaceIdAssetTypeIdPutRequest.md)|  | 

### Return type

[**AssetType**](AssetType.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **workspaceIdAssetTypePost**
> AssetType workspaceIdAssetTypePost(workspaceId, workspaceIdAssetTypePostRequest)

Create a new asset type

Create a new asset type for the specified workspace.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAssetTypeApi();
final String workspaceId = workspaceId_example; // String | The ID of the workspace
final WorkspaceIdAssetTypePostRequest workspaceIdAssetTypePostRequest = ; // WorkspaceIdAssetTypePostRequest | 

try {
    final response = api.workspaceIdAssetTypePost(workspaceId, workspaceIdAssetTypePostRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AssetTypeApi->workspaceIdAssetTypePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workspaceId** | **String**| The ID of the workspace | 
 **workspaceIdAssetTypePostRequest** | [**WorkspaceIdAssetTypePostRequest**](WorkspaceIdAssetTypePostRequest.md)|  | 

### Return type

[**AssetType**](AssetType.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

