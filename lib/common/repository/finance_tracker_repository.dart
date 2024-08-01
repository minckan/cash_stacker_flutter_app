import 'package:cash_stacker_flutter_app/common/dio/dio.dart';
import 'package:cash_stacker_flutter_app/swaggers/openapi.dart';

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
    required CreateFinancialTrackerTransactionReq body,
  }) async {
    return await _financialTrackerApi.createTransaction(
      workspaceId: workspaceId,
      createFinancialTrackerTransactionReq: body,
    );
  }

  Future<Response<Transaction>> updateTransaction({
    required String workspaceId,
    required int id,
    required UpdateFinancialTrackerTransactionReq body,
  }) async {
    return await _financialTrackerApi.updateFinancialTrackerTransaction(
      workspaceId: workspaceId,
      id: id,
      updateFinancialTrackerTransactionReq: body,
    );
  }

  Future<Response<void>> deleteTransaction({
    required String workspaceId,
    required int id,
  }) async {
    return await _financialTrackerApi.deleteFinancialTrackerTransaction(
      workspaceId: workspaceId,
      id: id,
    );
  }

  Future<Response<GetMonthlyAssetTransactionRes>> getAllMonthlyTransactions({
    required String workspaceId,
    required String monthKey,
  }) async {
    final response = await _financialTrackerApi.getMonthlyTransactions(
      workspaceId: workspaceId,
      monthKey: monthKey,
    );
    return Response<GetMonthlyAssetTransactionRes>(
      data: response.data,
      requestOptions: response.requestOptions,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      headers: response.headers,
      extra: response.extra,
    );
  }

  Future<Response<GetDailyTransactions200Response>> getDailyTransactions({
    required String workspaceId,
    required String dateKey,
  }) async {
    final response = await _financialTrackerApi.getDailyTransactions(
      workspaceId: workspaceId,
      dateKey: dateKey,
    );
    return Response<GetDailyTransactions200Response>(
      data: response.data,
      requestOptions: response.requestOptions,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      headers: response.headers,
      extra: response.extra,
    );
  }
}
