import 'package:cash_stacker_flutter_app/common/model/monthly_asset_trend_model.dart';
import 'package:cash_stacker_flutter_app/common/repository/asset_repository.dart';
import 'package:cash_stacker_flutter_app/common/utill/logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final assetTrendProvider =
    StateNotifierProvider<AssetStateNotifier, List<MonthlyAssetTrendModel>>(
        (ref) {
  final repository = ref.watch(assetRepositoryProvider);
  final notifier = AssetStateNotifier(repository: repository);

  return notifier;
});

class AssetStateNotifier extends StateNotifier<List<MonthlyAssetTrendModel>> {
  final AssetRepository repository;

  AssetStateNotifier({required this.repository}) : super([]);

  Future<List<MonthlyAssetTrendModel>?> getMonthlyAssetTrends(
      String workspaceId) async {
    try {
      final repo =
          await repository.getMonthlyTrends({"workspaceId": workspaceId});

      state = repo;

      return state;
    } catch (e) {
      logger.e('Error: get asset trends => $e');
    }
    return null;
  }
}
