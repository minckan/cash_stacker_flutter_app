import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for FinancialTrackerApi
void main() {
  final instance = Openapi().getFinancialTrackerApi();

  group(FinancialTrackerApi, () {
    // Get daily transactions
    //
    // Retrieve all financial transactions for the specified date.
    //
    //Future<WorkspaceIdFinanceMonthlyMonthKeyGet200Response> workspaceIdFinanceDailyDateKeyGet(String workspaceId, String dateKey) async
    test('test workspaceIdFinanceDailyDateKeyGet', () async {
      // TODO
    });

    // Delete a transaction
    //
    // Delete an existing financial transaction by its ID.
    //
    //Future workspaceIdFinanceIdDelete(String workspaceId, int id) async
    test('test workspaceIdFinanceIdDelete', () async {
      // TODO
    });

    // Update a transaction
    //
    // Update an existing financial transaction by its ID.
    //
    //Future<Transaction> workspaceIdFinanceIdPut(String workspaceId, int id, WorkspaceIdFinanceIdPutRequest workspaceIdFinanceIdPutRequest) async
    test('test workspaceIdFinanceIdPut', () async {
      // TODO
    });

    // Get monthly transactions
    //
    // Retrieve all financial transactions for the specified month.
    //
    //Future<WorkspaceIdFinanceMonthlyMonthKeyGet200Response> workspaceIdFinanceMonthlyMonthKeyGet(String workspaceId, String monthKey) async
    test('test workspaceIdFinanceMonthlyMonthKeyGet', () async {
      // TODO
    });

    // Create a new transaction
    //
    // Create a new financial transaction for the specified workspace.
    //
    //Future<Transaction> workspaceIdFinancePost(String workspaceId, WorkspaceIdFinancePostRequest workspaceIdFinancePostRequest) async
    test('test workspaceIdFinancePost', () async {
      // TODO
    });

  });
}
