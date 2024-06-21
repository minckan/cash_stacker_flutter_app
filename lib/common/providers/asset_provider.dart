import 'package:cash_stacker_flutter_app/common/model/monthly_asset_trend_model.dart';
import 'package:cash_stacker_flutter_app/common/repository/asset_repository.dart';
import 'package:cash_stacker_flutter_app/common/utill/calculation_helpers.dart';
import 'package:cash_stacker_flutter_app/common/utill/logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final assetTrendProvider =
    StateNotifierProvider<AssetStateNotifier, List<MonthlyAssetTrendModel>>(
        (ref) {
  final repository = ref.watch(assetRepositoryProvider);
  final notifier = AssetStateNotifier(repository: repository);

  return notifier;
});

final thisMonthMonthlyAssetAmountProvider =
    Provider.family<MonthlyAssetTrendModel?, String>((ref, monthKey) {
  final state = ref.watch(assetTrendProvider);

  if (state.isEmpty) {
    return null;
  }

  return state.firstWhere(
    (e) => e.yearMonth == monthKey,
    orElse: () => MonthlyAssetTrendModel(yearMonth: monthKey, totalValue: 0),
  );
});

class AssetStateNotifier extends StateNotifier<List<MonthlyAssetTrendModel>> {
  final AssetRepository repository;

  AssetStateNotifier({required this.repository}) : super([]);

  Future<List<MonthlyAssetTrendModel>?> getMonthlyAssetTrends(
      String workspaceId) async {
    try {
      final repo = await repository.getMonthlyTrends(
        workspaceId: workspaceId,
      );

      // state = repo;

      logger.d(state);
      return state;
    } catch (e) {
      logger.e('Error: get asset trends => $e');
    }
    return null;
  }

  String compareToLastMonthState(String monthKey) {
    if (state.isEmpty) {
      return '';
    }
    final thisMonthIndex = state.indexWhere((s) => s.yearMonth == monthKey);

    if (monthKey.length == 1 || thisMonthIndex == 0) {
      return '오늘의 자산이 어제보다 늘어있기를!';
    }

    state.sort((a, b) => a.yearMonth.compareTo(b.yearMonth));

    final thisMonthAssetSummary =
        state.firstWhere((s) => s.yearMonth == monthKey);
    final lastMonthAssetSummary = state[thisMonthIndex - 1];

    if (thisMonthAssetSummary.totalValue == lastMonthAssetSummary.totalValue) {
      return '이전달 대비 자산변동이 없습니다!';
    }

    final previousPrice = lastMonthAssetSummary.totalValue;
    final currentPrice = thisMonthAssetSummary.totalValue;

    if (previousPrice == 0) {
      return '자산이 열심히 증식되고 있어요!';
    }
    final percentage = calculatePercentageIncrease(previousPrice, currentPrice);

    if (percentage > 0) {
      return '자산이 이전달 대비 ${percentage.toInt()}% 올랐어요!';
    } else if (percentage < 0) {
      return '자산이 이전달 대비 ${percentage.toInt()}% 줄었네요..';
    } else {
      return '';
    }
  }
}
