import 'package:cash_stacker_flutter_app/common/repository/asset_repository.dart';
import 'package:cash_stacker_flutter_app/home/viewmodels/workspace_viewmodel.dart';
import 'package:cash_stacker_flutter_app/swaggers/openapi.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final assetTransactionViewModelProvider =
    StateNotifierProvider<AssetTransactionViewModel, List<AssetTransaction>>(
        (ref) => AssetTransactionViewModel(ref));

class AssetTransactionViewModel extends StateNotifier<List<AssetTransaction>> {
  final Ref _ref;
  AssetTransactionViewModel(this._ref) : super([]);

  String? get workspaceId {
    return _ref.read(workspaceViewModelProvider)?.workspaceId;
  }

  Future<void> loadAssetTransactions() async {
    if (workspaceId != null) {
      //  final assetTransactions = await _ref.read(assetRepositoryProvider)

      //   state = assetTransactions;
    }
  }

  Future<void> addAssetTransaction(AssetTransactionRequest reqBody) async {
    if (workspaceId != null) {
      final resp =
          await _ref.read(assetRepositoryProvider).createAssetTransaction(
                workspaceId: workspaceId!,
                assetId: reqBody.assetId!,
                body: reqBody,
              );

      if (resp.data != null) {
        state = [...state, resp.data!];
      }
    }
  }

  Future<void> updateAssetTransaction(AssetTransaction assetTransaction) async {
    if (workspaceId != null) {
      // state = state
      //     .map((e) => e.id == assetTransaction.id ? assetTransaction : e)
      //     .toList();
    }
  }

  Future<void> removeAssetTransaction(AssetTransaction assetTransaction) async {
    if (workspaceId != null) {
      // state =
      //     state.where((element) => element.id != assetTransaction.id).toList();
    }
  }

  void clearAssetTransactions() {
    state = [];
  }

  double getAllTransactionKrwAmt(List<AssetTransaction> assetTransactions) {
    return 0;
    // return assetTransactions.fold(0,
    //     (total, transaction) => total + transaction.totalKrwTransactionPrice);
  }

  List<AssetTransaction> getParticularAssetTransactions(int assetId) {
    // final list = state.where((item) => item.assetId == assetId).toList();
    // list.sort((a, b) => b.date.compareTo(a.date));
    // return list;
    return [];
  }
}
