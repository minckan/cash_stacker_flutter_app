import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for BudgetApi
void main() {
  final instance = Openapi().getBudgetApi();

  group(BudgetApi, () {
    // Get active budgets
    //
    // Retrieve all budgets for the specified workspace.
    //
    //Future<WorkspaceIdBudgetActiveGet200Response> workspaceIdBudgetActiveGet(String workspaceId) async
    test('test workspaceIdBudgetActiveGet', () async {
      // TODO
    });

    // Get all budgets
    //
    // Retrieve all active budgets for the specified workspace.
    //
    //Future<BuiltList<Budget>> workspaceIdBudgetGet(String workspaceId) async
    test('test workspaceIdBudgetGet', () async {
      // TODO
    });

    // Delete a budget
    //
    // Delete an existing budget by its ID.
    //
    //Future workspaceIdBudgetIdDelete(String workspaceId, int id) async
    test('test workspaceIdBudgetIdDelete', () async {
      // TODO
    });

    // Update a budget
    //
    // Update an existing budget by its ID.
    //
    //Future<Budget> workspaceIdBudgetIdPut(String workspaceId, int id, WorkspaceIdBudgetPostRequest workspaceIdBudgetPostRequest) async
    test('test workspaceIdBudgetIdPut', () async {
      // TODO
    });

    // Create a new budget
    //
    // Create a new budget for the specified workspace.
    //
    //Future<Budget> workspaceIdBudgetPost(String workspaceId, WorkspaceIdBudgetPostRequest workspaceIdBudgetPostRequest) async
    test('test workspaceIdBudgetPost', () async {
      // TODO
    });

  });
}
