import 'package:cash_stacker_flutter_app/swaggers/src/model/workspace_id_finance_monthly_month_key_get200_response.dart';

enum TransactionType {
  income,
  expense,
}

class TransactionState {
  final WorkspaceIdFinanceMonthlyMonthKeyGet200Response monthlyResponse;
  final WorkspaceIdFinanceMonthlyMonthKeyGet200Response dailyResponse;

  final Map<String, WorkspaceIdFinanceMonthlyMonthKeyGet200Response>
      monthlyCache;
  final Map<String, WorkspaceIdFinanceMonthlyMonthKeyGet200Response> dailyCache;

  TransactionState({
    required this.monthlyResponse,
    required this.dailyResponse,
    required this.monthlyCache,
    required this.dailyCache,
  });

  TransactionState copyWith({
    WorkspaceIdFinanceMonthlyMonthKeyGet200Response? monthlyResponse,
    WorkspaceIdFinanceMonthlyMonthKeyGet200Response? dailyResponse,
    Map<String, WorkspaceIdFinanceMonthlyMonthKeyGet200Response>? monthlyCache,
    Map<String, WorkspaceIdFinanceMonthlyMonthKeyGet200Response>? dailyCache,
  }) {
    return TransactionState(
      monthlyResponse: monthlyResponse ?? this.monthlyResponse,
      dailyResponse: dailyResponse ?? this.dailyResponse,
      monthlyCache: monthlyCache ?? this.monthlyCache,
      dailyCache: dailyCache ?? this.dailyCache,
    );
  }
}
