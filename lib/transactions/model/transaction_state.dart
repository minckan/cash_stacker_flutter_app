import 'package:cash_stacker_flutter_app/swaggers/src/model/workspace_id_finance_monthly_month_key_get200_response.dart';

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
  final WorkspaceIdFinanceMonthlyMonthKeyGet200Response? monthlyResponse;
  final WorkspaceIdFinanceMonthlyMonthKeyGet200Response? dailyResponse;

  final Map<String, WorkspaceIdFinanceMonthlyMonthKeyGet200Response>?
      monthlyCache;
  final Map<String, WorkspaceIdFinanceMonthlyMonthKeyGet200Response>?
      dailyCache;

  TransactionState({
    this.monthlyResponse,
    this.dailyResponse,
    this.monthlyCache,
    this.dailyCache,
  });
}
