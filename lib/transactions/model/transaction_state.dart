import 'package:cash_stacker_flutter_app/swaggers/openapi.dart';

enum TransactionType {
  income,
  expense,
}

class TransactionStateBase {}

class TransactionStateError extends TransactionStateBase {
  final String errorMessage;

  TransactionStateError({required this.errorMessage});
}

class TransactionStateLoading extends TransactionStateBase {}

class TransactionState extends TransactionStateBase {
  final GetMonthlyAssetTransactionRes? monthlyResponse;
  final GetDailyTransactions200Response? dailyResponse;

  final Map<String, GetMonthlyAssetTransactionRes>? monthlyCache;
  final Map<String, GetDailyTransactions200Response>? dailyCache;

  TransactionState({
    this.monthlyResponse,
    this.dailyResponse,
    this.monthlyCache,
    this.dailyCache,
  });
}
