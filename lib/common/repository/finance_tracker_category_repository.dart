import 'package:cash_stacker_flutter_app/common/dio/dio.dart';
import 'package:cash_stacker_flutter_app/setting/model/transaction_category_model.dart';

import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';

part 'finance_tracker_category_repository.g.dart';

final financialTrackerCategoryRepositoryProvider =
    Provider<FinanceTrackerCategoryRepository>((ref) {
  final dio = ref.watch(dioProvider);

  final repository = FinanceTrackerCategoryRepository(dio,
      baseUrl: dotenv.get('API_BASE_URL'));
  return repository;
});

@RestApi()
abstract class FinanceTrackerCategoryRepository {
  factory FinanceTrackerCategoryRepository(Dio dio, {String baseUrl}) =
      _FinanceTrackerCategoryRepository;

  static const basePath = '/{workspaceId}/finance/category';

  @GET('$basePath/{type}')
  @Headers({'accessToken': 'true'})
  Future<List<TransactionCategoryModel>> getAllTransactionCategoryByType({
    @Path() required String workspaceId,
    @Path() required String type,
  });

  @POST(basePath)
  @Headers({'accessToken': 'true'})
  Future<TransactionCategoryModel> createTransactionCategory({
    @Path() required String workspaceId,
    @Body() required TransactionCategoryModel body,
  });
  @PUT('$basePath/{id}')
  @Headers({'accessToken': 'true'})
  Future<TransactionCategoryModel> updateTransactionCategory({
    @Path() required String workspaceId,
    @Path() required int id,
    @Body() required body,
  });
  @DELETE('$basePath/{id}')
  @Headers({'accessToken': 'true'})
  Future<void> deleteTransactionCategory({
    @Path() required String workspaceId,
    @Path() required int id,
  });
}
