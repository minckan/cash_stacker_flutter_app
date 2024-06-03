import 'package:cash_stacker_flutter_app/common/utill/logger.dart';
import 'package:cash_stacker_flutter_app/common/viewmodels/currency_view_model.dart';
import 'package:cash_stacker_flutter_app/home/model/workspace_model.dart';
import 'package:cash_stacker_flutter_app/home/viewmodels/asset_summary_view_model.dart';
import 'package:cash_stacker_flutter_app/portfolio/viewmodel/asset_transaction_viewModel.dart';
import 'package:cash_stacker_flutter_app/portfolio/viewmodel/assets_view_model.dart';
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
    try {
      final QuerySnapshot workspacesQuery = await FirebaseFirestore.instance
          .collection('workspaces')
          .where('members', arrayContains: userId)
          .get();

      if (workspacesQuery.docs.isNotEmpty) {
        state = Workspace.fromJson(
            workspacesQuery.docs.first.data() as Map<String, dynamic>);

        await _ref
            .read(categoryViewModelProvider.notifier)
            .loadCategory(workspaceId: state!.id);
        await _ref
            .read(transactionViewModelProvider.notifier)
            .loadTransactions(state!.id);
        await _ref
            .read(assetSummaryProvider.notifier)
            .loadAssetSummaries(state!.id);
        await _ref.read(assetViewModelProvider.notifier).loadAssets(state!.id);
        await _ref
            .read(assetTransactionViewModelProvider.notifier)
            .loadAssetTransactions(state!.id);
        await _ref.read(currencyViewModelProvider.notifier).loadCurrencies();
      }
    } catch (e) {
      logger.e('Error loading workspace for user $userId: $e');
    }
  }

  void setWorkspace(Workspace workspace) {
    state = workspace;
    try {
      _ref.read(assetViewModelProvider.notifier).loadAssets(workspace.id);
      _ref
          .read(transactionViewModelProvider.notifier)
          .loadTransactions(workspace.id);
    } catch (e) {
      logger.e('Error setting workspace: $e');
    }
  }

  void clearWorkspace() {
    state = null;
    try {
      _ref.read(assetViewModelProvider.notifier).clearAssets();
      _ref.read(transactionViewModelProvider.notifier).clearTransactions();
    } catch (e) {
      logger.e('Error clearing workspace: $e');
    }
  }
}
