import 'package:built_collection/built_collection.dart';
import 'package:cash_stacker_flutter_app/common/dio/dio.dart';

import 'package:cash_stacker_flutter_app/swaggers/src/api.dart';
import 'package:cash_stacker_flutter_app/swaggers/src/api/financial_category_api.dart';
import 'package:cash_stacker_flutter_app/swaggers/src/model/transaction_category.dart';
import 'package:cash_stacker_flutter_app/swaggers/src/model/workspace_id_finance_category_id_put_request.dart';
import 'package:cash_stacker_flutter_app/swaggers/src/model/workspace_id_finance_category_post_request.dart';

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
    return await _financialCategoryApi.workspaceIdFinanceCategoryTypeGet(
      workspaceId: workspaceId,
      type: type,
    );
  }

  Future<Response<TransactionCategory>> createTransactionCategory({
    required String workspaceId,
    required WorkspaceIdFinanceCategoryPostRequest body,
  }) async {
    return await _financialCategoryApi.workspaceIdFinanceCategoryPost(
      workspaceId: workspaceId,
      workspaceIdFinanceCategoryPostRequest: body,
    );
  }

  Future<Response<TransactionCategory>> updateTransactionCategory({
    required String workspaceId,
    required int id,
    required WorkspaceIdFinanceCategoryIdPutRequest body,
  }) async {
    return await _financialCategoryApi.workspaceIdFinanceCategoryIdPut(
      workspaceId: workspaceId,
      id: id,
      workspaceIdFinanceCategoryIdPutRequest: body,
    );
  }

  Future<Response<void>> deleteTransactionCategory({
    required String workspaceId,
    required int id,
  }) async {
    return await _financialCategoryApi.workspaceIdFinanceCategoryIdDelete(
      workspaceId: workspaceId,
      id: id,
    );
  }
}
