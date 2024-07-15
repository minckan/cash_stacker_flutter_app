import 'package:cash_stacker_flutter_app/common/model/currency_model.dart';
import 'package:cash_stacker_flutter_app/common/repository/exchange_rate_repository.dart';
import 'package:cash_stacker_flutter_app/common/utill/logger.dart';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final exchangeRateProvider =
    StateNotifierProvider<ExchangeRateNotifier, List<Currency>>((ref) {
  return ExchangeRateNotifier(ref);
});

class ExchangeRateNotifier extends StateNotifier<List<Currency>> {
  final Ref _ref;

  ExchangeRateNotifier(this._ref) : super([]);

  Future<List<Currency>> loadExchangeRates() async {
    try {
      final repo = await _ref
          .read(exchangeRateRepositoryProvider)
          .getCurrentExchangeRates();

      if (repo.data != null) {
        state = repo.data!
            .map((rate) => Currency(
                rate: rate.dealBasR ?? '0.0',
                currencyCode: rate.curUnit ?? '',
                currencyName: rate.curNm ?? '',
                currencySymbol: ''))
            .toList();

        return state;
      }

      return [];
    } catch (e) {
      logger.e('[Error: loadExchangeRates] => ${(e as DioException).response}');
      return [];
    }
  }
}
