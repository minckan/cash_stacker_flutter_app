import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for FinancialCategoryApi
void main() {
  final instance = Openapi().getFinancialCategoryApi();

  group(FinancialCategoryApi, () {
    // Delete a financial category
    //
    // Delete an existing financial category by its ID.
    //
    //Future workspaceIdFinanceCategoryIdDelete(String workspaceId, int id) async
    test('test workspaceIdFinanceCategoryIdDelete', () async {
      // TODO
    });

    // Update a financial category
    //
    // Update an existing financial category by its ID.
    //
    //Future<TransactionCategory> workspaceIdFinanceCategoryIdPut(String workspaceId, int id, WorkspaceIdFinanceCategoryIdPutRequest workspaceIdFinanceCategoryIdPutRequest) async
    test('test workspaceIdFinanceCategoryIdPut', () async {
      // TODO
    });

    // Create a new financial category
    //
    // Create a new financial category for the specified workspace.
    //
    //Future<TransactionCategory> workspaceIdFinanceCategoryPost(String workspaceId, WorkspaceIdFinanceCategoryPostRequest workspaceIdFinanceCategoryPostRequest) async
    test('test workspaceIdFinanceCategoryPost', () async {
      // TODO
    });

    // Get financial categories by type
    //
    // Retrieve all financial categories of a specified type for the specified workspace.
    //
    //Future<BuiltList<TransactionCategory>> workspaceIdFinanceCategoryTypeGet(String workspaceId, String type) async
    test('test workspaceIdFinanceCategoryTypeGet', () async {
      // TODO
    });

  });
}
