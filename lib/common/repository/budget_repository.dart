import 'package:built_collection/built_collection.dart';
import 'package:cash_stacker_flutter_app/common/dio/dio.dart';
import 'package:cash_stacker_flutter_app/swaggers/src/api.dart';
import 'package:cash_stacker_flutter_app/swaggers/src/api/budget_api.dart';
import 'package:cash_stacker_flutter_app/swaggers/src/model/budget.dart';
import 'package:cash_stacker_flutter_app/swaggers/src/model/workspace_id_budget_active_get200_response.dart';
import 'package:cash_stacker_flutter_app/swaggers/src/model/workspace_id_budget_post_request.dart';
import 'package:dio/dio.dart' hide Headers;

import 'package:flutter_riverpod/flutter_riverpod.dart';

final budgetRepositoryProvider = Provider<BudgetRepository>(
  (ref) {
    final dio = ref.watch(dioProvider);
    final openapi = Openapi(dio: dio);
    final repository = BudgetRepository(openapi.getBudgetApi());
    return repository;
  },
);

class BudgetRepository {
  final BudgetApi _budgetApi;

  BudgetRepository(this._budgetApi);

  static const basePath = '/{workspaceId}/budget';

  Future<Response<BuiltList<Budget>>> getAllBudget({
    required String workspaceId,
  }) async {
    return await _budgetApi.workspaceIdBudgetGet(
      workspaceId: workspaceId,
    );
  }

  Future<Response<WorkspaceIdBudgetActiveGet200Response>> getActiveBudget({
    required String workspaceId,
  }) async {
    return await _budgetApi.workspaceIdBudgetActiveGet(
        workspaceId: workspaceId);
  }

  Future<Response<Budget>> createBudget({
    required String workspaceId,
    required WorkspaceIdBudgetPostRequest body,
  }) {
    return _budgetApi.workspaceIdBudgetPost(
      workspaceId: workspaceId,
      workspaceIdBudgetPostRequest: body,
    );
  }

  Future<Response<void>> updateBudget({
    required String workspaceId,
    required int id,
    required WorkspaceIdBudgetPostRequest body,
  }) async {
    return await _budgetApi.workspaceIdBudgetIdPut(
      workspaceId: workspaceId,
      id: id,
      workspaceIdBudgetPostRequest: body,
    );
  }

  Future<Response<void>> deleteBudget({
    required String workspaceId,
    required int id,
  }) async {
    return await _budgetApi.workspaceIdBudgetIdDelete(
      workspaceId: workspaceId,
      id: id,
    );
  }
}
