import 'package:cash_stacker_flutter_app/common/dio/dio.dart';
import 'package:cash_stacker_flutter_app/openapi.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final financialTrackerRepositoryProvider =
    Provider<FinanceTrackerRepository>((ref) {
  final dio = ref.watch(dioProvider);
  final openapi = Openapi(basePathOverride: dotenv.get('API_BASE_URL'));
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

  Future<Response<List<Transaction>>> getAllMonthlyTransactions({
    required String workspaceId,
    required String monthKey,
  }) async {
    final response =
        await _financialTrackerApi.workspaceIdFinanceMonthlyMonthKeyGet(
      workspaceId: workspaceId,
      monthKey: monthKey,
    );
    return Response<List<Transaction>>(
      data: response.data?.toList() ?? [],
      requestOptions: response.requestOptions,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      headers: response.headers,
      extra: response.extra,
    );
  }

  Future<Response<List<Transaction>>> getDailyTransactions({
    required String workspaceId,
    required String dateKey,
  }) async {
    final response =
        await _financialTrackerApi.workspaceIdFinanceDailyDateKeyGet(
      workspaceId: workspaceId,
      dateKey: dateKey,
    );
    return Response<List<Transaction>>(
      data: response.data?.toList() ?? [],
      requestOptions: response.requestOptions,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      headers: response.headers,
      extra: response.extra,
    );
  }

  // @POST(basePath)
  // @Headers({'accessToken': 'true'})
  // Future<TransactionModel> createTransaction({
  //   @Path() required String workspaceId,
  //   @Body() required TransactionModel body,
  // });
  // @PUT('$basePath/{id}')
  // @Headers({'accessToken': 'true'})
  // Future<TransactionModel> updateTransaction({
  //   @Path() required String workspaceId,
  //   @Path() required String id,
  //   @Body() required body,
  // });
  // @DELETE('$basePath/{id}')
  // @Headers({'accessToken': 'true'})
  // Future<void> deleteTransaction({
  //   @Path() required String workspaceId,
  //   @Path() required String id,
  // });
  // @GET('$basePath/monthly/{monthKey}')
  // @Headers({'accessToken': 'true'})
  // Future<List<TransactionModel>> getAllMonthlyTransactions({
  //   @Path() required String workspaceId,
  //   @Path() required String monthKey,
  // });
  // @GET('$basePath/daily/{dateKey}')
  // @Headers({'accessToken': 'true'})
  // Future<List<TransactionModel>> getDailyTransactions({
  //   @Path() required String workspaceId,
  //   @Path() required String dateKey,
  // });
}
