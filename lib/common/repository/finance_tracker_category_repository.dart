import 'package:built_collection/built_collection.dart';
import 'package:cash_stacker_flutter_app/common/dio/dio.dart';
import 'package:cash_stacker_flutter_app/swaggers/openapi.dart';

import 'package:dio/dio.dart' hide Headers;

import 'package:flutter_riverpod/flutter_riverpod.dart';

final financialTrackerCategoryRepositoryProvider =
    Provider<FinanceTrackerCategoryRepository>((ref) {
  final dio = ref.watch(dioProvider);
  final openapi = Openapi(dio: dio);
  final repository =
      FinanceTrackerCategoryRepository(openapi.getFinancialCategoryApi());
  return repository;
});

class FinanceTrackerCategoryRepository {
  final FinancialCategoryApi _financialCategoryApi;

  FinanceTrackerCategoryRepository(this._financialCategoryApi);

  static const basePath = '/{workspaceId}/finance/category';

  Future<Response<BuiltList<TransactionCategory>>>
      getAllTransactionCategoryByType({
    required String workspaceId,
    required String type,
  }) async {
    return await _financialCategoryApi.getFinancialCategoryById(
      workspaceId: workspaceId,
      type: type,
    );
  }

  Future<Response<TransactionCategory>> createTransactionCategory({
    required String workspaceId,
    required CreateFinancialTrackerCategoryReq body,
  }) async {
    return await _financialCategoryApi.create(
      workspaceId: workspaceId,
      createFinancialTrackerCategoryReq: body,
    );
  }

  Future<Response<TransactionCategory>> updateTransactionCategory({
    required String workspaceId,
    required int id,
    required UpdateFinancialTrackerCategoryReq body,
  }) async {
    return await _financialCategoryApi.updateFinancialCategory(
      workspaceId: workspaceId,
      id: id,
      updateFinancialTrackerCategoryReq: body,
    );
  }

  Future<Response<void>> deleteTransactionCategory({
    required String workspaceId,
    required int id,
  }) async {
    return await _financialCategoryApi.deleteFinancialCategory(
      workspaceId: workspaceId,
      id: id,
    );
  }
}
