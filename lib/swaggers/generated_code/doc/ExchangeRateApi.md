# openapi.api.ExchangeRateApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiExchangeRatesGet**](ExchangeRateApi.md#apiexchangeratesget) | **GET** /api/exchange-rates | Fetch exchange rates


# **apiExchangeRatesGet**
> BuiltList<ExchangeRateResponse> apiExchangeRatesGet()

Fetch exchange rates

Retrieve the latest exchange rates.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getExchangeRateApi();

try {
    final response = api.apiExchangeRatesGet();
    print(response);
} catch on DioException (e) {
    print('Exception when calling ExchangeRateApi->apiExchangeRatesGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;ExchangeRateResponse&gt;**](ExchangeRateResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

