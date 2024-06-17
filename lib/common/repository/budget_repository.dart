import 'package:cash_stacker_flutter_app/common/dio/dio.dart';
import 'package:cash_stacker_flutter_app/home/model/budget_model.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';

part 'budget_repository.g.dart';

final budgetRepositoryProvider = Provider<BudgetRepository>(
  (ref) {
    final dio = ref.watch(dioProvider);

    final repository =
        BudgetRepository(dio, baseUrl: dotenv.get('API_BASE_URL'));

    return repository;
  },
);

@RestApi()
abstract class BudgetRepository {
  factory BudgetRepository(Dio dio, {String baseUrl}) = _BudgetRepository;

  static const basePath = '/:workspaceId/budget';

  @GET(basePath)
  @Headers({'accessToken': 'true'})
  Future<List<Budget>> getActiveBudget(
    @Path() path,
  );

  @POST(basePath)
  @Headers({'accessToken': 'true'})
  Future<void> createBudget(
    @Path() path,
    @Body() body,
  );

  @PUT('$basePath/:id')
  @Headers({'accessToken': 'true'})
  Future<void> updateBudget(
    @Path() path,
    @Body() body,
  );

  @DELETE('$basePath/:id')
  @Headers({'accessToken': 'true'})
  Future<void> deleteBudget(
    @Path() path,
  );
}
