import 'package:cash_stacker_flutter_app/common/dio/dio.dart';
import 'package:cash_stacker_flutter_app/transactions/model/transaction_model.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';

part 'finance_tracker_repository.g.dart';

final financialTrackerRepositoryProvider =
    Provider<FinanceTrackerRepository>((ref) {
  final dio = ref.watch(dioProvider);

  final repository =
      FinanceTrackerRepository(dio, baseUrl: dotenv.get('API_BASE_URL'));
  return repository;
});

@RestApi()
abstract class FinanceTrackerRepository {
  factory FinanceTrackerRepository(Dio dio, {String baseUrl}) =
      _FinanceTrackerRepository;

  static const basePath = '/{workspaceId}/finance';

  @POST(basePath)
  @Headers({'accessToken': 'true'})
  Future<TransactionModel> createTransaction({
    @Path() required String workspaceId,
    @Body() required TransactionModel body,
  });
  @PUT('$basePath/{id}')
  @Headers({'accessToken': 'true'})
  Future<TransactionModel> updateTransaction({
    @Path() required String workspaceId,
    @Path() required String id,
    @Body() required body,
  });
  @DELETE('$basePath/{id}')
  @Headers({'accessToken': 'true'})
  Future<void> deleteTransaction({
    @Path() required String workspaceId,
    @Path() required String id,
  });
  @GET('$basePath/monthly/{monthKey}')
  @Headers({'accessToken': 'true'})
  Future<List<TransactionModel>> getAllMonthlyTransactions({
    @Path() required String workspaceId,
    @Path() required String monthKey,
  });
  @GET('$basePath/daily/{dateKey}')
  @Headers({'accessToken': 'true'})
  Future<List<TransactionModel>> getDailyTransactions({
    @Path() required String workspaceId,
    @Path() required String dateKey,
  });
}
