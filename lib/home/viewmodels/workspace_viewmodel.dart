import 'package:cash_stacker_flutter_app/common/repository/workspace_repository.dart';
import 'package:cash_stacker_flutter_app/common/utill/logger.dart';

import 'package:cash_stacker_flutter_app/portfolio/viewmodel/assets_view_model.dart';
import 'package:cash_stacker_flutter_app/swaggers/openapi.dart';
import 'package:cash_stacker_flutter_app/transactions/viewmodels/transactions_view_model.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final workspaceViewModelProvider =
    StateNotifierProvider<WorkspaceViewModel, Workspace?>(
        (ref) => WorkspaceViewModel(ref));

class WorkspaceViewModel extends StateNotifier<Workspace?> {
  final Ref _ref;

  WorkspaceViewModel(this._ref) : super(null);

  Future<void> loadWorkspace(String userId) async {
    try {
      final workspace = await _ref
          .read(workspaceRepositoryProvider)
          .getOneWorkspace(id: 'workspace_$userId');

      if (workspace.data != null) {
        state = workspace.data;

        // try {
        //   await _ref
        //       .read(assetSummaryProvider.notifier)
        //       .loadAssetSummaries(state!.id);
        // } catch (e) {
        //   logger.e('ERROR : 자산 요약 조회  $userId: $e');
        // }
      }
    } catch (e) {
      logger.e('Error loading workspace for user $userId: $e');
      throw Exception(['[Error] loading workspace for user']);
    }
  }

  void setWorkspace(Workspace workspace) {
    state = workspace;
    try {
      // _ref.read(assetViewModelProvider.notifier).loadAssets(workspace.id);
      // _ref
      //     .read(transactionViewModelProvider.notifier)
      //     .loadTransactions(workspace.id);
    } catch (e) {
      logger.e('Error setting workspace: $e');
    }
  }

  void clearWorkspace() {
    state = null;
    try {
      _ref.read(assetViewModelProvider.notifier).clearAssets();
      _ref.read(transactionStateProvider.notifier).clear();
    } catch (e) {
      logger.e('Error clearing workspace: $e');
    }
  }
}
