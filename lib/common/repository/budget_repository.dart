import 'package:built_collection/built_collection.dart';
import 'package:cash_stacker_flutter_app/common/dio/dio.dart';
import 'package:cash_stacker_flutter_app/swaggers/openapi.dart';

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
    return await _budgetApi.getAllBudgets(
      workspaceId: workspaceId,
    );
  }

  Future<Response<GetActiveBudgetRes>> getActiveBudget({
    required String workspaceId,
  }) async {
    return await _budgetApi.getActiveBudget(workspaceId: workspaceId);
  }

  Future<Response<Budget>> createBudget({
    required String workspaceId,
    required CreateBudgetReq body,
  }) {
    return _budgetApi.createBudget(
      workspaceId: workspaceId,
      createBudgetReq: body,
    );
  }

  Future<Response<Budget>> updateBudget({
    required String workspaceId,
    required int id,
    required UpdateBudgetRequest body,
  }) async {
    return await _budgetApi.updateBudget(
      workspaceId: workspaceId,
      id: id,
      updateBudgetRequest: body,
    );
  }

  Future<Response<void>> deleteBudget({
    required String workspaceId,
    required int id,
  }) async {
    return await _budgetApi.deleteBudget(
      workspaceId: workspaceId,
      id: id,
    );
  }
}
