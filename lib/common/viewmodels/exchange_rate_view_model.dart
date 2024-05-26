import 'package:cash_stacker_flutter_app/common/model/exchange_rate_api_model.dart';
import 'package:cash_stacker_flutter_app/common/repository/exchange_rate_repository.dart';
import 'package:cash_stacker_flutter_app/common/utill/logger.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final exchangeRateProvider =
    StateNotifierProvider<ExchangeRateViewModel, List<ExchangeRateApiModel>>(
        (ref) {
  return ExchangeRateViewModel();
});

class ExchangeRateViewModel extends StateNotifier<List<ExchangeRateApiModel>> {
  ExchangeRateViewModel() : super([]);

  Future<void> loadExchangeRates() async {
    final dio = Dio();

    final repository =
        ExchangeRateRepository(dio, baseUrl: dotenv.get('API_BASE_URL'));

    try {
      final exchangeRates = await repository.getCurrentExchangeRates();

      state = exchangeRates;

      logger.d(state);
    } catch (e) {
      logger.e('Error fetching exchange rates: $e');
      state = [];
    }
  }
}
