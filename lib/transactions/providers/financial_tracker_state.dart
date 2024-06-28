import 'package:cash_stacker_flutter_app/src/model/workspace_id_finance_monthly_month_key_get200_response.dart';

class FinancialState {
  final WorkspaceIdFinanceMonthlyMonthKeyGet200Response monthlyResponse;
  final WorkspaceIdFinanceMonthlyMonthKeyGet200Response dailyResponse;

  final Map<String, WorkspaceIdFinanceMonthlyMonthKeyGet200Response>
      monthlyCache;
  final Map<String, WorkspaceIdFinanceMonthlyMonthKeyGet200Response> dailyCache;

  FinancialState({
    required this.monthlyResponse,
    required this.dailyResponse,
    required this.monthlyCache,
    required this.dailyCache,
  });

  FinancialState copyWith({
    WorkspaceIdFinanceMonthlyMonthKeyGet200Response? monthlyResponse,
    WorkspaceIdFinanceMonthlyMonthKeyGet200Response? dailyResponse,
    Map<String, WorkspaceIdFinanceMonthlyMonthKeyGet200Response>? monthlyCache,
    Map<String, WorkspaceIdFinanceMonthlyMonthKeyGet200Response>? dailyCache,
  }) {
    return FinancialState(
      monthlyResponse: monthlyResponse ?? this.monthlyResponse,
      dailyResponse: dailyResponse ?? this.dailyResponse,
      monthlyCache: monthlyCache ?? this.monthlyCache,
      dailyCache: dailyCache ?? this.dailyCache,
    );
  }
}
