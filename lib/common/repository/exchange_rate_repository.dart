import 'package:cash_stacker_flutter_app/common/dio/dio.dart';
import 'package:cash_stacker_flutter_app/common/model/exchange_rate_api_model.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';

part 'exchange_rate_repository.g.dart';

final exchangeRateRepositoryProvider = Provider<ExchangeRateRepository>(
  (ref) {
    final dio = ref.watch(dioProvider);

    final repository =
        ExchangeRateRepository(dio, baseUrl: dotenv.get('API_BASE_URL'));

    return repository;
  },
);

@RestApi()
abstract class ExchangeRateRepository {
  factory ExchangeRateRepository(Dio dio, {String baseUrl}) =
      _ExchangeRateRepository;

  @GET('/api/exchange-rates')
  Future<List<ExchangeRateApiModel>> getCurrentExchangeRates();
}
