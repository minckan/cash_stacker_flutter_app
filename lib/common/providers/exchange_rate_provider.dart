import 'package:cash_stacker_flutter_app/common/model/exchange_rate_api_model.dart';
import 'package:cash_stacker_flutter_app/common/repository/exchange_rate_repository.dart';
import 'package:cash_stacker_flutter_app/common/utill/logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final exchangeRateProvider =
    StateNotifierProvider<ExchangeRateNotifier, List<ExchangeRateApiModel>>(
        (ref) {
  final repository = ref.watch(exchangeRateRepositoryProvider);
  final notifier = ExchangeRateNotifier(repository: repository);

  return notifier;
});

class ExchangeRateNotifier extends StateNotifier<List<ExchangeRateApiModel>> {
  final ExchangeRateRepository repository;

  ExchangeRateNotifier({required this.repository}) : super([]);

  Future<void> loadExchangeRates() async {
    try {
      final repo = await repository.getCurrentExchangeRates();

      state = repo;
    } catch (e) {
      logger.e('Error: get asset trends => $e');
    }
  }
}
