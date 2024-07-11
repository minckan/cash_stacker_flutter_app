# openapi.api.InvitationApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**workspaceIdInvitationGet**](InvitationApi.md#workspaceidinvitationget) | **GET** /{workspaceId}/invitation | Get all invitations
[**workspaceIdInvitationIdDelete**](InvitationApi.md#workspaceidinvitationiddelete) | **DELETE** /{workspaceId}/invitation/{id} | Delete an invitation
[**workspaceIdInvitationIdPut**](InvitationApi.md#workspaceidinvitationidput) | **PUT** /{workspaceId}/invitation/{id} | Update an invitation
[**workspaceIdInvitationPost**](InvitationApi.md#workspaceidinvitationpost) | **POST** /{workspaceId}/invitation | Create a new invitation


# **workspaceIdInvitationGet**
> BuiltList<Invitation> workspaceIdInvitationGet(workspaceId)

Get all invitations

Retrieve all invitations sent from the specified workspace.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getInvitationApi();
final String workspaceId = workspaceId_example; // String | The ID of the workspace

try {
    final response = api.workspaceIdInvitationGet(workspaceId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling InvitationApi->workspaceIdInvitationGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workspaceId** | **String**| The ID of the workspace | 

### Return type

[**BuiltList&lt;Invitation&gt;**](Invitation.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **workspaceIdInvitationIdDelete**
> workspaceIdInvitationIdDelete(workspaceId, id)

Delete an invitation

Delete an existing invitation by its ID.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getInvitationApi();
final String workspaceId = workspaceId_example; // String | The ID of the workspace
final String id = id_example; // String | The ID of the invitation

try {
    api.workspaceIdInvitationIdDelete(workspaceId, id);
} catch on DioException (e) {
    print('Exception when calling InvitationApi->workspaceIdInvitationIdDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workspaceId** | **String**| The ID of the workspace | 
 **id** | **String**| The ID of the invitation | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **workspaceIdInvitationIdPut**
> Invitation workspaceIdInvitationIdPut(workspaceId, id, workspaceIdInvitationIdPutRequest)

Update an invitation

Update the status of an existing invitation by its ID.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getInvitationApi();
final String workspaceId = workspaceId_example; // String | The ID of the workspace
final String id = id_example; // String | The ID of the invitation
final WorkspaceIdInvitationIdPutRequest workspaceIdInvitationIdPutRequest = ; // WorkspaceIdInvitationIdPutRequest | 

try {
    final response = api.workspaceIdInvitationIdPut(workspaceId, id, workspaceIdInvitationIdPutRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling InvitationApi->workspaceIdInvitationIdPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workspaceId** | **String**| The ID of the workspace | 
 **id** | **String**| The ID of the invitation | 
 **workspaceIdInvitationIdPutRequest** | [**WorkspaceIdInvitationIdPutRequest**](WorkspaceIdInvitationIdPutRequest.md)|  | 

### Return type

[**Invitation**](Invitation.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **workspaceIdInvitationPost**
> Invitation workspaceIdInvitationPost(workspaceId, workspaceIdInvitationPostRequest)

Create a new invitation

Create a new invitation for the specified workspace.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getInvitationApi();
final String workspaceId = workspaceId_example; // String | The ID of the workspace
final WorkspaceIdInvitationPostRequest workspaceIdInvitationPostRequest = ; // WorkspaceIdInvitationPostRequest | 

try {
    final response = api.workspaceIdInvitationPost(workspaceId, workspaceIdInvitationPostRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling InvitationApi->workspaceIdInvitationPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workspaceId** | **String**| The ID of the workspace | 
 **workspaceIdInvitationPostRequest** | [**WorkspaceIdInvitationPostRequest**](WorkspaceIdInvitationPostRequest.md)|  | 

### Return type

[**Invitation**](Invitation.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

