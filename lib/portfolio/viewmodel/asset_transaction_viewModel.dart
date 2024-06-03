import 'package:cash_stacker_flutter_app/common/utill/fire_store_collections.dart';
import 'package:cash_stacker_flutter_app/portfolio/model/asset_transaction.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final assetTransactionViewModelProvider =
    StateNotifierProvider<AssetTransactionViewModel, List<AssetTransaction>>(
        (ref) => AssetTransactionViewModel(ref));

class AssetTransactionViewModel extends StateNotifier<List<AssetTransaction>> {
  final Ref _ref;
  AssetTransactionViewModel(this._ref) : super([]);

  Future<void> loadAssetTransactions(String workspaceId) async {
    final QuerySnapshot assetTransactionsQuery = await FirebaseFirestore
        .instance
        .collection('workspaces')
        .doc(workspaceId)
        .collection(Collection.assetTransactions)
        .get();

    List<AssetTransaction> assetTransactions =
        assetTransactionsQuery.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;

      final type = data['transactionType'];
      switch (type) {
        case 'DomesticTransaction':
          return DomesticTransaction.fromJson(data);
        case 'ForeignTransaction':
          return ForeignTransaction.fromJson(data);
        case 'ForexTransaction':
          return ForexTransaction.fromJson(data);
        default:
          throw Exception('Unknown transaction type');
      }
    }).toList();

    state = assetTransactions;
  }

  Future<void> addAssetTransaction(
      AssetTransaction assetTransaction, String workspaceId) async {
    await FirebaseFirestore.instance
        .collection('workspaces')
        .doc(workspaceId)
        .collection(Collection.assetTransactions)
        .doc(assetTransaction.id)
        .set(
          assetTransaction.toJson()
            ..['transactionType'] = assetTransaction.runtimeType.toString(),
        );

    state = [...state, assetTransaction];
  }

  Future<void> updateAssetTransaction(
      AssetTransaction assetTransaction, String workspaceId) async {
    await FirebaseFirestore.instance
        .collection('workspaces')
        .doc(workspaceId)
        .collection(Collection.assetTransactions)
        .doc(assetTransaction.id)
        .set(
          assetTransaction.toJson()
            ..['transactionType'] = assetTransaction.runtimeType.toString(),
        );

    state = state
        .map((e) => e.id == assetTransaction.id ? assetTransaction : e)
        .toList();
  }

  Future<void> removeAssetTransaction(
      AssetTransaction assetTransaction, String workspaceId) async {
    await FirebaseFirestore.instance
        .collection('workspaces')
        .doc(workspaceId)
        .collection(Collection.assetTransactions)
        .doc(assetTransaction.id)
        .delete();

    state =
        state.where((element) => element.id != assetTransaction.id).toList();
  }

  void clearAssetTransactions() {
    state = [];
  }

  double getAllTransactionKrwAmt(List<AssetTransaction> assetTransactions) {
    return assetTransactions.fold(0,
        (total, transaction) => total + transaction.totalKrwTransactionPrice);
  }

  List<AssetTransaction> getParticularAssetTransactions(String assetId) {
    return state.where((item) => item.assetId == assetId).toList();
  }
}
