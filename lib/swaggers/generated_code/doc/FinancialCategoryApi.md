# openapi.api.FinancialCategoryApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**workspaceIdFinanceCategoryIdDelete**](FinancialCategoryApi.md#workspaceidfinancecategoryiddelete) | **DELETE** /{workspaceId}/finance/category/{id} | Delete a financial category
[**workspaceIdFinanceCategoryIdPut**](FinancialCategoryApi.md#workspaceidfinancecategoryidput) | **PUT** /{workspaceId}/finance/category/{id} | Update a financial category
[**workspaceIdFinanceCategoryPost**](FinancialCategoryApi.md#workspaceidfinancecategorypost) | **POST** /{workspaceId}/finance/category | Create a new financial category
[**workspaceIdFinanceCategoryTypeGet**](FinancialCategoryApi.md#workspaceidfinancecategorytypeget) | **GET** /{workspaceId}/finance/category/{type} | Get financial categories by type


# **workspaceIdFinanceCategoryIdDelete**
> workspaceIdFinanceCategoryIdDelete(workspaceId, id)

Delete a financial category

Delete an existing financial category by its ID.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getFinancialCategoryApi();
final String workspaceId = workspaceId_example; // String | The ID of the workspace
final int id = 56; // int | The ID of the category

try {
    api.workspaceIdFinanceCategoryIdDelete(workspaceId, id);
} catch on DioException (e) {
    print('Exception when calling FinancialCategoryApi->workspaceIdFinanceCategoryIdDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workspaceId** | **String**| The ID of the workspace | 
 **id** | **int**| The ID of the category | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **workspaceIdFinanceCategoryIdPut**
> TransactionCategory workspaceIdFinanceCategoryIdPut(workspaceId, id, workspaceIdFinanceCategoryIdPutRequest)

Update a financial category

Update an existing financial category by its ID.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getFinancialCategoryApi();
final String workspaceId = workspaceId_example; // String | The ID of the workspace
final int id = 56; // int | The ID of the category
final WorkspaceIdFinanceCategoryIdPutRequest workspaceIdFinanceCategoryIdPutRequest = ; // WorkspaceIdFinanceCategoryIdPutRequest | 

try {
    final response = api.workspaceIdFinanceCategoryIdPut(workspaceId, id, workspaceIdFinanceCategoryIdPutRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling FinancialCategoryApi->workspaceIdFinanceCategoryIdPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workspaceId** | **String**| The ID of the workspace | 
 **id** | **int**| The ID of the category | 
 **workspaceIdFinanceCategoryIdPutRequest** | [**WorkspaceIdFinanceCategoryIdPutRequest**](WorkspaceIdFinanceCategoryIdPutRequest.md)|  | 

### Return type

[**TransactionCategory**](TransactionCategory.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **workspaceIdFinanceCategoryPost**
> TransactionCategory workspaceIdFinanceCategoryPost(workspaceId, workspaceIdFinanceCategoryPostRequest)

Create a new financial category

Create a new financial category for the specified workspace.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getFinancialCategoryApi();
final String workspaceId = workspaceId_example; // String | The ID of the workspace
final WorkspaceIdFinanceCategoryPostRequest workspaceIdFinanceCategoryPostRequest = ; // WorkspaceIdFinanceCategoryPostRequest | 

try {
    final response = api.workspaceIdFinanceCategoryPost(workspaceId, workspaceIdFinanceCategoryPostRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling FinancialCategoryApi->workspaceIdFinanceCategoryPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workspaceId** | **String**| The ID of the workspace | 
 **workspaceIdFinanceCategoryPostRequest** | [**WorkspaceIdFinanceCategoryPostRequest**](WorkspaceIdFinanceCategoryPostRequest.md)|  | 

### Return type

[**TransactionCategory**](TransactionCategory.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **workspaceIdFinanceCategoryTypeGet**
> BuiltList<TransactionCategory> workspaceIdFinanceCategoryTypeGet(workspaceId, type)

Get financial categories by type

Retrieve all financial categories of a specified type for the specified workspace.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getFinancialCategoryApi();
final String workspaceId = workspaceId_example; // String | The ID of the workspace
final String type = type_example; // String | The type of the categories (income or expense)

try {
    final response = api.workspaceIdFinanceCategoryTypeGet(workspaceId, type);
    print(response);
} catch on DioException (e) {
    print('Exception when calling FinancialCategoryApi->workspaceIdFinanceCategoryTypeGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workspaceId** | **String**| The ID of the workspace | 
 **type** | **String**| The type of the categories (income or expense) | 

### Return type

[**BuiltList&lt;TransactionCategory&gt;**](TransactionCategory.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

