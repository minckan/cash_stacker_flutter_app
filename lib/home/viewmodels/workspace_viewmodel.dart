import 'package:cash_stacker_flutter_app/common/viewmodels/currency_view_model.dart';
import 'package:cash_stacker_flutter_app/home/model/workspace_model.dart';
import 'package:cash_stacker_flutter_app/portfolio/viewmodel/asset_view_model.dart';
import 'package:cash_stacker_flutter_app/setting/viewmodel/category_view_model.dart';
import 'package:cash_stacker_flutter_app/transactions/viewmodels/transactions_view_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final workspaceViewModelProvider =
    StateNotifierProvider<WorkspaceViewModel, Workspace?>(
        (ref) => WorkspaceViewModel(ref));

class WorkspaceViewModel extends StateNotifier<Workspace?> {
  final Ref _ref;

  WorkspaceViewModel(this._ref) : super(null);

  Future<void> loadWorkspace(String userId) async {
    final QuerySnapshot workspacesQuery = await FirebaseFirestore.instance
        .collection('workspaces')
        .where('user', arrayContains: userId)
        .get();

    if (workspacesQuery.docs.isNotEmpty) {
      state = Workspace.fromJson(
          workspacesQuery.docs.first.data() as Map<String, dynamic>);
      await _ref.read(assetViewModelProvider.notifier).loadAssets(state!.id);
      await _ref
          .read(transactionViewModelProvider.notifier)
          .loadTransactions(state!.id);
      await _ref
          .read(categoryViewModelProvider.notifier)
          .loadCategory(workspaceId: state!.id);

      await _ref.read(currencyViewModelProvider.notifier).loadCurrencies();
    }
  }

  void setWorkspace(Workspace workspace) {
    state = workspace;
    _ref.read(assetViewModelProvider.notifier).loadAssets(workspace.id);
    _ref
        .read(transactionViewModelProvider.notifier)
        .loadTransactions(workspace.id);
  }

  void clearWorkspace() {
    state = null;
    _ref.read(assetViewModelProvider.notifier).clearAssets();
    _ref.read(transactionViewModelProvider.notifier).clearTransactions();
  }
}
