# openapi.api.BudgetApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**workspaceIdBudgetActiveGet**](BudgetApi.md#workspaceidbudgetactiveget) | **GET** /{workspaceId}/budget/active | Get active budgets
[**workspaceIdBudgetGet**](BudgetApi.md#workspaceidbudgetget) | **GET** /{workspaceId}/budget | Get all budgets
[**workspaceIdBudgetIdDelete**](BudgetApi.md#workspaceidbudgetiddelete) | **DELETE** /{workspaceId}/budget/{id} | Delete a budget
[**workspaceIdBudgetIdPut**](BudgetApi.md#workspaceidbudgetidput) | **PUT** /{workspaceId}/budget/{id} | Update a budget
[**workspaceIdBudgetPost**](BudgetApi.md#workspaceidbudgetpost) | **POST** /{workspaceId}/budget | Create a new budget


# **workspaceIdBudgetActiveGet**
> WorkspaceIdBudgetActiveGet200Response workspaceIdBudgetActiveGet(workspaceId)

Get active budgets

Retrieve all budgets for the specified workspace.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getBudgetApi();
final String workspaceId = workspaceId_example; // String | The ID of the workspace

try {
    final response = api.workspaceIdBudgetActiveGet(workspaceId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling BudgetApi->workspaceIdBudgetActiveGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workspaceId** | **String**| The ID of the workspace | 

### Return type

[**WorkspaceIdBudgetActiveGet200Response**](WorkspaceIdBudgetActiveGet200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **workspaceIdBudgetGet**
> BuiltList<Budget> workspaceIdBudgetGet(workspaceId)

Get all budgets

Retrieve all active budgets for the specified workspace.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getBudgetApi();
final String workspaceId = workspaceId_example; // String | The ID of the workspace

try {
    final response = api.workspaceIdBudgetGet(workspaceId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling BudgetApi->workspaceIdBudgetGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workspaceId** | **String**| The ID of the workspace | 

### Return type

[**BuiltList&lt;Budget&gt;**](Budget.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **workspaceIdBudgetIdDelete**
> workspaceIdBudgetIdDelete(workspaceId, id)

Delete a budget

Delete an existing budget by its ID.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getBudgetApi();
final String workspaceId = workspaceId_example; // String | The ID of the workspace
final int id = 56; // int | The ID of the budget

try {
    api.workspaceIdBudgetIdDelete(workspaceId, id);
} catch on DioException (e) {
    print('Exception when calling BudgetApi->workspaceIdBudgetIdDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workspaceId** | **String**| The ID of the workspace | 
 **id** | **int**| The ID of the budget | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **workspaceIdBudgetIdPut**
> Budget workspaceIdBudgetIdPut(workspaceId, id, workspaceIdBudgetPostRequest)

Update a budget

Update an existing budget by its ID.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getBudgetApi();
final String workspaceId = workspaceId_example; // String | The ID of the workspace
final int id = 56; // int | The ID of the budget
final WorkspaceIdBudgetPostRequest workspaceIdBudgetPostRequest = ; // WorkspaceIdBudgetPostRequest | 

try {
    final response = api.workspaceIdBudgetIdPut(workspaceId, id, workspaceIdBudgetPostRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling BudgetApi->workspaceIdBudgetIdPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workspaceId** | **String**| The ID of the workspace | 
 **id** | **int**| The ID of the budget | 
 **workspaceIdBudgetPostRequest** | [**WorkspaceIdBudgetPostRequest**](WorkspaceIdBudgetPostRequest.md)|  | 

### Return type

[**Budget**](Budget.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **workspaceIdBudgetPost**
> Budget workspaceIdBudgetPost(workspaceId, workspaceIdBudgetPostRequest)

Create a new budget

Create a new budget for the specified workspace.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getBudgetApi();
final String workspaceId = workspaceId_example; // String | The ID of the workspace
final WorkspaceIdBudgetPostRequest workspaceIdBudgetPostRequest = ; // WorkspaceIdBudgetPostRequest | 

try {
    final response = api.workspaceIdBudgetPost(workspaceId, workspaceIdBudgetPostRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling BudgetApi->workspaceIdBudgetPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workspaceId** | **String**| The ID of the workspace | 
 **workspaceIdBudgetPostRequest** | [**WorkspaceIdBudgetPostRequest**](WorkspaceIdBudgetPostRequest.md)|  | 

### Return type

[**Budget**](Budget.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

