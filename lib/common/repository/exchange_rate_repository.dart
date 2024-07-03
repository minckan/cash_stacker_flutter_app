import 'package:cash_stacker_flutter_app/common/dio/dio.dart';

import 'package:cash_stacker_flutter_app/swaggers/openapi.dart';
import 'package:dio/dio.dart' hide Headers;

import 'package:flutter_riverpod/flutter_riverpod.dart';

final exchangeRateRepositoryProvider = Provider<ExchangeRateRepository>(
  (ref) {
    final dio = ref.watch(dioProvider);
    final openapi = Openapi(dio: dio);
    final repository = ExchangeRateRepository(openapi.getExchangeRateApi());
    return repository;
  },
);

class ExchangeRateRepository {
  final ExchangeRateApi _exchangeRateApi;
  ExchangeRateRepository(this._exchangeRateApi);

  Future<Response<ExchangeRateResponse>> getCurrentExchangeRates() {
    return _exchangeRateApi.apiExchangeRatesGet();
  }
}
