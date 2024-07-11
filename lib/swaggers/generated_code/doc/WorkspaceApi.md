# openapi.api.WorkspaceApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**workspacesGet**](WorkspaceApi.md#workspacesget) | **GET** /workspaces | Get all workspaces
[**workspacesIdGet**](WorkspaceApi.md#workspacesidget) | **GET** /workspaces/{id} | Get a workspace by ID
[**workspacesPost**](WorkspaceApi.md#workspacespost) | **POST** /workspaces | Create a new workspace


# **workspacesGet**
> BuiltList<Workspace> workspacesGet()

Get all workspaces

Retrieve all workspaces.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getWorkspaceApi();

try {
    final response = api.workspacesGet();
    print(response);
} catch on DioException (e) {
    print('Exception when calling WorkspaceApi->workspacesGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;Workspace&gt;**](Workspace.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **workspacesIdGet**
> Workspace workspacesIdGet(id)

Get a workspace by ID

Retrieve a specific workspace by its ID.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getWorkspaceApi();
final String id = id_example; // String | The ID of the workspace.

try {
    final response = api.workspacesIdGet(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling WorkspaceApi->workspacesIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The ID of the workspace. | 

### Return type

[**Workspace**](Workspace.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **workspacesPost**
> WorkspacesPost201Response workspacesPost(workspacesPostRequest)

Create a new workspace

Create a new workspace with the provided information.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getWorkspaceApi();
final WorkspacesPostRequest workspacesPostRequest = ; // WorkspacesPostRequest | 

try {
    final response = api.workspacesPost(workspacesPostRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling WorkspaceApi->workspacesPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workspacesPostRequest** | [**WorkspacesPostRequest**](WorkspacesPostRequest.md)|  | 

### Return type

[**WorkspacesPost201Response**](WorkspacesPost201Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

