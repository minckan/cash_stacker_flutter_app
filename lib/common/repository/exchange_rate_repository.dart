import 'package:cash_stacker_flutter_app/common/model/exchange_rate_api_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'exchange_rate_repository.g.dart';

@RestApi()
abstract class ExchangeRateRepository {
  factory ExchangeRateRepository(Dio dio, {String baseUrl}) =
      _ExchangeRateRepository;

  @GET('/exchange-rates')
  Future<List<ExchangeRateApiModel>> getCurrentExchangeRates();
}
