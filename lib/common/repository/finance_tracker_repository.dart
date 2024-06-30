import 'package:cash_stacker_flutter_app/common/dio/dio.dart';
import 'package:cash_stacker_flutter_app/swaggers/src/api.dart';
import 'package:cash_stacker_flutter_app/swaggers/src/api/financial_tracker_api.dart';
import 'package:cash_stacker_flutter_app/swaggers/src/model/transaction.dart';
import 'package:cash_stacker_flutter_app/swaggers/src/model/workspace_id_finance_id_put_request.dart';
import 'package:cash_stacker_flutter_app/swaggers/src/model/workspace_id_finance_monthly_month_key_get200_response.dart';
import 'package:cash_stacker_flutter_app/swaggers/src/model/workspace_id_finance_post_request.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_riverpod/flutter_riverpod.dart';

//데이터 계층에 대한 모든 작업을 처리
final financialTrackerRepositoryProvider =
    Provider<FinanceTrackerRepository>((ref) {
  final dio = ref.watch(dioProvider);
  final openapi = Openapi(dio: dio);
  final repository = FinanceTrackerRepository(openapi.getFinancialTrackerApi());
  return repository;
});

class FinanceTrackerRepository {
  final FinancialTrackerApi _financialTrackerApi;

  FinanceTrackerRepository(this._financialTrackerApi);

  static const basePath = '/{workspaceId}/finance';

  Future<Response<Transaction>> createTransaction({
    required String workspaceId,
    required WorkspaceIdFinancePostRequest body,
  }) async {
    return await _financialTrackerApi.workspaceIdFinancePost(
      workspaceId: workspaceId,
      workspaceIdFinancePostRequest: body,
    );
  }

  Future<Response<Transaction>> updateTransaction({
    required String workspaceId,
    required int id,
    required WorkspaceIdFinanceIdPutRequest body,
  }) async {
    return await _financialTrackerApi.workspaceIdFinanceIdPut(
      workspaceId: workspaceId,
      id: id,
      workspaceIdFinanceIdPutRequest: body,
    );
  }

  Future<Response<void>> deleteTransaction({
    required String workspaceId,
    required int id,
  }) async {
    return await _financialTrackerApi.workspaceIdFinanceIdDelete(
      workspaceId: workspaceId,
      id: id,
    );
  }

  Future<Response<WorkspaceIdFinanceMonthlyMonthKeyGet200Response>>
      getAllMonthlyTransactions({
    required String workspaceId,
    required String monthKey,
  }) async {
    final response =
        await _financialTrackerApi.workspaceIdFinanceMonthlyMonthKeyGet(
      workspaceId: workspaceId,
      monthKey: monthKey,
    );
    return Response<WorkspaceIdFinanceMonthlyMonthKeyGet200Response>(
      data: response.data,
      requestOptions: response.requestOptions,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      headers: response.headers,
      extra: response.extra,
    );
  }

  Future<Response<WorkspaceIdFinanceMonthlyMonthKeyGet200Response>>
      getDailyTransactions({
    required String workspaceId,
    required String dateKey,
  }) async {
    final response =
        await _financialTrackerApi.workspaceIdFinanceDailyDateKeyGet(
      workspaceId: workspaceId,
      dateKey: dateKey,
    );
    return Response<WorkspaceIdFinanceMonthlyMonthKeyGet200Response>(
      data: response.data,
      requestOptions: response.requestOptions,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      headers: response.headers,
      extra: response.extra,
    );
  }
}
