# openapi.api.UserApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**usersIdGet**](UserApi.md#usersidget) | **GET** /users/{id} | Retrieve a user by ID
[**usersIdPut**](UserApi.md#usersidput) | **PUT** /users/{id} | Update user status
[**usersPost**](UserApi.md#userspost) | **POST** /users | Create a new user


# **usersIdGet**
> User usersIdGet(id)

Retrieve a user by ID

Retrieve a user by their user ID.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getUserApi();
final String id = id_example; // String | The user ID.

try {
    final response = api.usersIdGet(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UserApi->usersIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The user ID. | 

### Return type

[**User**](User.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **usersIdPut**
> usersIdPut(id, usersIdPutRequest)

Update user status

Update the status of a user by their user ID.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getUserApi();
final String id = id_example; // String | The user ID.
final UsersIdPutRequest usersIdPutRequest = ; // UsersIdPutRequest | 

try {
    api.usersIdPut(id, usersIdPutRequest);
} catch on DioException (e) {
    print('Exception when calling UserApi->usersIdPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The user ID. | 
 **usersIdPutRequest** | [**UsersIdPutRequest**](UsersIdPutRequest.md)|  | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **usersPost**
> UsersPost201Response usersPost(usersPostRequest)

Create a new user

Create a new user with the provided information.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getUserApi();
final UsersPostRequest usersPostRequest = ; // UsersPostRequest | 

try {
    final response = api.usersPost(usersPostRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UserApi->usersPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **usersPostRequest** | [**UsersPostRequest**](UsersPostRequest.md)|  | 

### Return type

[**UsersPost201Response**](UsersPost201Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

