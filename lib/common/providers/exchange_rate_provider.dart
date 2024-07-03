import 'package:cash_stacker_flutter_app/common/repository/exchange_rate_repository.dart';
import 'package:cash_stacker_flutter_app/common/utill/logger.dart';
import 'package:cash_stacker_flutter_app/swaggers/openapi.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final exchangeRateProvider =
    StateNotifierProvider<ExchangeRateNotifier, List<ExchangeRateResponse>>(
        (ref) {
  return ExchangeRateNotifier(ref);
});

class ExchangeRateNotifier extends StateNotifier<List<ExchangeRateResponse>> {
  final Ref _ref;

  ExchangeRateNotifier(this._ref) : super([]);

  Future<List<ExchangeRateResponse>> loadExchangeRates() async {
    try {
      final repo = await _ref
          .read(exchangeRateRepositoryProvider)
          .getCurrentExchangeRates();

      if (repo.data != null) {
        state = repo.data!.toList();

        return state;
      }

      return [];
    } catch (e) {
      logger.e('[Error: loadExchangeRates] => ${(e as DioException).response}');
      return [];
    }
  }
}
