import 'package:cash_stacker_flutter_app/common/utill/date_format.dart';
import 'package:cash_stacker_flutter_app/common/utill/fire_store_collections.dart';
import 'package:cash_stacker_flutter_app/transactions/model/transaction_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

final transactionViewModelProvider =
    StateNotifierProvider<TransactionViewModel, List<TransactionModel>>(
  (ref) => TransactionViewModel(),
);

class TransactionViewModel extends StateNotifier<List<TransactionModel>> {
  TransactionViewModel() : super([]);

  Map<String, Map<String, double>> monthlyTotals = {};
  currentMonthTotal(DateTime current) {
    final String currentMonthKey = getMonth(current);
    return monthlyTotals[currentMonthKey];
  }

  Future<void> loadTransactions(String workspaceId) async {
    final QuerySnapshot transactionsQuery = await FirebaseFirestore.instance
        .collection(Collection.workspaces)
        .doc(workspaceId)
        .collection(Collection.transactions)
        .get();

    List<TransactionModel> transactions = transactionsQuery.docs
        .map((doc) =>
            TransactionModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
    state = transactions;
    _calculateMonthlyTotals(transactions);
  }

  Future<void> addTransaction(
      TransactionModel transaction, String workspaceId) async {
    await FirebaseFirestore.instance
        .collection(Collection.workspaces)
        .doc(workspaceId)
        .collection(Collection.transactions)
        .doc(transaction.id)
        .set(transaction.toJson());

    state = [...state, transaction];
    _calculateMonthlyTotals(state);
  }

  Future<void> updateTransaction(
      TransactionModel transaction, String workspaceId) async {
    await FirebaseFirestore.instance
        .collection(Collection.workspaces)
        .doc(workspaceId)
        .collection(Collection.transactions)
        .doc(transaction.id)
        .update(transaction.toJson());

    state = state.map((t) => t.id == transaction.id ? transaction : t).toList();
    _calculateMonthlyTotals(state);
  }

  Future<void> deleteTransaction(
      String transactionId, String workspaceId) async {
    await FirebaseFirestore.instance
        .collection(Collection.workspaces)
        .doc(workspaceId)
        .collection(Collection.transactions)
        .doc(transactionId)
        .delete();

    state = state.where((t) => t.id != transactionId).toList();
    _calculateMonthlyTotals(state);
  }

  void clearTransactions() {
    state = [];
  }

  List<Map<String, dynamic>> getMonthTransactions(String yearMonth) {
    List<TransactionModel> monthlyTransactions = state.where((transaction) {
      String monthKey = getMonth(transaction.date);
      return monthKey == yearMonth;
    }).toList();

    monthlyTransactions.sort((a, b) => b.date.compareTo(a.date));

    Map<String, List<TransactionModel>> groupedTransactions = {};

    for (var transaction in monthlyTransactions) {
      String dateKey = transaction.date.toIso8601String().split('T')[0];

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
        double amount = double.parse(transaction.amount);

        if (transaction.transactionType == TransactionType.income) {
          totalIncome += amount;
        } else if (transaction.transactionType == TransactionType.expense) {
          totalExpense += amount;
        }
      }

      double netIncome = totalIncome - totalExpense;

      DateTime date = transactions[0].date;

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

  void _calculateMonthlyTotals(List<TransactionModel> transactions) {
    Map<String, Map<String, double>> totals = {};

    for (var transaction in transactions) {
      String monthKey = getMonth(transaction.date);

      if (!totals.containsKey(monthKey)) {
        totals[monthKey] = {'income': 0, 'expanse': 0, 'netIncome': 0};
      }

      double amount = double.parse(transaction.amount);

      if (transaction.transactionType == TransactionType.income) {
        totals[monthKey]!['income'] = (totals[monthKey]!['income']! + amount);
      } else if (transaction.transactionType == TransactionType.expense) {
        totals[monthKey]!['expanse'] = (totals[monthKey]!['expanse']! + amount);
      }

      totals[monthKey]!['netIncome'] =
          totals[monthKey]!['income']! - totals[monthKey]!['expanse']!;
    }

    monthlyTotals = totals;
  }
}
