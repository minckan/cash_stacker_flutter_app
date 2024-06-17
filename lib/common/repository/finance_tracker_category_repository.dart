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

  static const basePath = '/:workspaceId/finance/category';

  @GET('$basePath/:type')
  @Headers({'accessToken': 'true'})
  Future<List<TransactionCategoryModel>> getAllTransactionCategoryByType(
    @Path() path,
  );

  @POST(basePath)
  @Headers({'accessToken': 'true'})
  Future<void> createTransactionCategory(
    @Path() path,
    @Body() body,
  );
  @PUT('$basePath/:id')
  @Headers({'accessToken': 'true'})
  Future<void> updateTransactionCategory(
    @Path() path,
  );
  @DELETE('$basePath/:id')
  @Headers({'accessToken': 'true'})
  Future<void> deleteTransactionCategory(
    @Path() path,
  );
}
