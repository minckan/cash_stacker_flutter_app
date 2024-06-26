import 'package:cash_stacker_flutter_app/common/repository/finance_tracker_repository.dart';
import 'package:cash_stacker_flutter_app/common/utill/date_format.dart';
import 'package:cash_stacker_flutter_app/openapi.dart' as openapi;
import 'package:cash_stacker_flutter_app/transactions/model/transaction_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final transactionViewModelProvider =
    StateNotifierProvider<TransactionViewModel, List<openapi.Transaction>>(
  (ref) => TransactionViewModel(ref),
);

class TransactionViewModel extends StateNotifier<List<openapi.Transaction>> {
  final Ref _ref;

  TransactionViewModel(this._ref) : super([]);

  Map<String, Map<String, double>> monthlyTotals = {};
  currentMonthTotal(DateTime current) {
    final String currentMonthKey = getMonth(current);
    return monthlyTotals[currentMonthKey];
  }

  Future<void> loadTransactions(String workspaceId) async {
    final financialTrackerRep = _ref.read(financialTrackerRepositoryProvider);
    final transactions = await financialTrackerRep.getAllMonthlyTransactions(
      workspaceId: workspaceId,
      monthKey: getMonth(DateTime.now()),
    );

    if (transactions.data != null) {
      state = transactions.data as List<openapi.Transaction>;
    }
  }

  Future<void> addTransaction({
    required openapi.WorkspaceIdFinancePostRequest transaction,
    required String workspaceId,
  }) async {
    final financialTrackerRep = _ref.read(financialTrackerRepositoryProvider);
    final response = await financialTrackerRep.createTransaction(
      workspaceId: workspaceId,
      body: transaction,
    );

    if (response.data != null) {
      state = [...state, (response.data as openapi.Transaction)];
    }
  }

  Future<void> updateTransaction({
    required int transactionId,
    required String workspaceId,
    required openapi.WorkspaceIdFinanceIdPutRequest modifiedData,
  }) async {
    final financialTrackerRep = _ref.read(financialTrackerRepositoryProvider);

    final response = await financialTrackerRep.updateTransaction(
      workspaceId: workspaceId,
      id: transactionId,
      body: modifiedData,
    );

    if (response.data != null) {
      final transaction = response.data as openapi.Transaction;
      state = state
          .map((t) => t.transactionId == transactionId ? transaction : t)
          .toList();
    }
  }

  Future<void> deleteTransaction({
    required int transactionId,
    required String workspaceId,
  }) async {
    final financialTrackerRep = _ref.read(financialTrackerRepositoryProvider);
    await financialTrackerRep.deleteTransaction(
        workspaceId: workspaceId, id: transactionId);
    state = state.where((t) => t.transactionId != transactionId).toList();
  }

  void clearTransactions() {
    state = [];
  }

  List<Map<String, dynamic>> getMonthTransactions(String yearMonth) {
    List<openapi.Transaction> monthlyTransactions = state.where((transaction) {
      String monthKey = getMonth(transaction.createdAt!);

      return monthKey == yearMonth;
    }).toList();

    monthlyTransactions.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));

    Map<String, List<openapi.Transaction>> groupedTransactions = {};

    for (var transaction in monthlyTransactions) {
      String dateKey = transaction.createdAt!.toIso8601String().split('T')[0];

      if (!groupedTransactions.containsKey(dateKey)) {
        groupedTransactions[dateKey] = [];
      }

      groupedTransactions[dateKey]!.add(transaction);
    }

    List<Map<String, dynamic>> result = [];
    groupedTransactions.forEach((dateStr, transactions) {
      double totalIncome = 0;
      double totalExpense = 0;

      for (var transaction in transactions) {
        double amount = transaction.amount!;

        if (transaction.transactionType == TransactionType.income.name) {
          totalIncome += amount;
        } else if (transaction.transactionType ==
            TransactionType.expense.name) {
          totalExpense += amount;
        }
      }

      double netIncome = totalIncome - totalExpense;

      DateTime date = transactions[0].createdAt!;

      result.add({
        'date': date,
        'totalIncome': totalIncome,
        'totalExpense': totalExpense,
        'netIncome': netIncome,
        'transactions': transactions
      });
    });
    return result;
  }
}
