# openapi.api.FinancialTrackerApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**workspaceIdFinanceDailyDateKeyGet**](FinancialTrackerApi.md#workspaceidfinancedailydatekeyget) | **GET** /{workspaceId}/finance/daily/{dateKey} | Get daily transactions
[**workspaceIdFinanceIdDelete**](FinancialTrackerApi.md#workspaceidfinanceiddelete) | **DELETE** /{workspaceId}/finance/{id} | Delete a transaction
[**workspaceIdFinanceIdPut**](FinancialTrackerApi.md#workspaceidfinanceidput) | **PUT** /{workspaceId}/finance/{id} | Update a transaction
[**workspaceIdFinanceMonthlyMonthKeyGet**](FinancialTrackerApi.md#workspaceidfinancemonthlymonthkeyget) | **GET** /{workspaceId}/finance/monthly/{monthKey} | Get monthly transactions
[**workspaceIdFinancePost**](FinancialTrackerApi.md#workspaceidfinancepost) | **POST** /{workspaceId}/finance | Create a new transaction


# **workspaceIdFinanceDailyDateKeyGet**
> WorkspaceIdFinanceMonthlyMonthKeyGet200Response workspaceIdFinanceDailyDateKeyGet(workspaceId, dateKey)

Get daily transactions

Retrieve all financial transactions for the specified date.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getFinancialTrackerApi();
final String workspaceId = workspaceId_example; // String | The ID of the workspace
final String dateKey = dateKey_example; // String | The date key in YYYY-MM-DD format

try {
    final response = api.workspaceIdFinanceDailyDateKeyGet(workspaceId, dateKey);
    print(response);
} catch on DioException (e) {
    print('Exception when calling FinancialTrackerApi->workspaceIdFinanceDailyDateKeyGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workspaceId** | **String**| The ID of the workspace | 
 **dateKey** | **String**| The date key in YYYY-MM-DD format | 

### Return type

[**WorkspaceIdFinanceMonthlyMonthKeyGet200Response**](WorkspaceIdFinanceMonthlyMonthKeyGet200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **workspaceIdFinanceIdDelete**
> workspaceIdFinanceIdDelete(workspaceId, id)

Delete a transaction

Delete an existing financial transaction by its ID.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getFinancialTrackerApi();
final String workspaceId = workspaceId_example; // String | The ID of the workspace
final int id = 56; // int | The ID of the transaction

try {
    api.workspaceIdFinanceIdDelete(workspaceId, id);
} catch on DioException (e) {
    print('Exception when calling FinancialTrackerApi->workspaceIdFinanceIdDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workspaceId** | **String**| The ID of the workspace | 
 **id** | **int**| The ID of the transaction | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **workspaceIdFinanceIdPut**
> Transaction workspaceIdFinanceIdPut(workspaceId, id, workspaceIdFinanceIdPutRequest)

Update a transaction

Update an existing financial transaction by its ID.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getFinancialTrackerApi();
final String workspaceId = workspaceId_example; // String | The ID of the workspace
final int id = 56; // int | The ID of the transaction
final WorkspaceIdFinanceIdPutRequest workspaceIdFinanceIdPutRequest = ; // WorkspaceIdFinanceIdPutRequest | 

try {
    final response = api.workspaceIdFinanceIdPut(workspaceId, id, workspaceIdFinanceIdPutRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling FinancialTrackerApi->workspaceIdFinanceIdPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workspaceId** | **String**| The ID of the workspace | 
 **id** | **int**| The ID of the transaction | 
 **workspaceIdFinanceIdPutRequest** | [**WorkspaceIdFinanceIdPutRequest**](WorkspaceIdFinanceIdPutRequest.md)|  | 

### Return type

[**Transaction**](Transaction.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **workspaceIdFinanceMonthlyMonthKeyGet**
> WorkspaceIdFinanceMonthlyMonthKeyGet200Response workspaceIdFinanceMonthlyMonthKeyGet(workspaceId, monthKey)

Get monthly transactions

Retrieve all financial transactions for the specified month.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getFinancialTrackerApi();
final String workspaceId = workspaceId_example; // String | The ID of the workspace
final String monthKey = monthKey_example; // String | The month key in YYYY-MM format

try {
    final response = api.workspaceIdFinanceMonthlyMonthKeyGet(workspaceId, monthKey);
    print(response);
} catch on DioException (e) {
    print('Exception when calling FinancialTrackerApi->workspaceIdFinanceMonthlyMonthKeyGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workspaceId** | **String**| The ID of the workspace | 
 **monthKey** | **String**| The month key in YYYY-MM format | 

### Return type

[**WorkspaceIdFinanceMonthlyMonthKeyGet200Response**](WorkspaceIdFinanceMonthlyMonthKeyGet200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **workspaceIdFinancePost**
> Transaction workspaceIdFinancePost(workspaceId, workspaceIdFinancePostRequest)

Create a new transaction

Create a new financial transaction for the specified workspace.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getFinancialTrackerApi();
final String workspaceId = workspaceId_example; // String | The ID of the workspace
final WorkspaceIdFinancePostRequest workspaceIdFinancePostRequest = ; // WorkspaceIdFinancePostRequest | 

try {
    final response = api.workspaceIdFinancePost(workspaceId, workspaceIdFinancePostRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling FinancialTrackerApi->workspaceIdFinancePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workspaceId** | **String**| The ID of the workspace | 
 **workspaceIdFinancePostRequest** | [**WorkspaceIdFinancePostRequest**](WorkspaceIdFinancePostRequest.md)|  | 

### Return type

[**Transaction**](Transaction.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

