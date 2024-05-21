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

  Future<void> loadTransactions(String workspaceId) async {
    final QuerySnapshot transactionsQuery = await FirebaseFirestore.instance
        .collection(Collection.workspaces)
        .doc(workspaceId)
        .collection(Collection.transactions)
        .get();

    state = transactionsQuery.docs
        .map((doc) =>
            TransactionModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }

  Future<void> addTransaction(
      TransactionModel transaction, String workspaceId) async {
    print(transaction);
    await FirebaseFirestore.instance
        .collection(Collection.workspaces)
        .doc(workspaceId)
        .collection(Collection.transactions)
        .doc(transaction.id)
        .set(transaction.toJson());

    state = [...state, transaction];
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
  }

  void clearTransactions() {
    state = [];
  }

  List<TransactionModel> getMonthTransactions(String yearMonth) {
    List<TransactionModel> monthlyTransactions = state.where((transaction) {
      String monthKey = DateFormat('yyyy-MM').format(transaction.date);
      return monthKey == yearMonth;
    }).toList();

    monthlyTransactions.sort((a, b) => a.date.compareTo(b.date));
    return monthlyTransactions;
  }
}
