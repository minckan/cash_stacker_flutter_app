import 'package:cash_stacker_flutter_app/common/utill/date_format.dart';
import 'package:cash_stacker_flutter_app/common/utill/logger.dart';
import 'package:cash_stacker_flutter_app/home/model/asset_summary_model.dart';
import 'package:cash_stacker_flutter_app/transactions/viewmodels/transactions_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final assetSummaryProvider =
    StateNotifierProvider<AssetSummaryViewModel, List<AssetSummary>>((ref) {
  return AssetSummaryViewModel(ref);
});

class AssetSummaryViewModel extends StateNotifier<List<AssetSummary>> {
  final Ref _ref;

  AssetSummaryViewModel(this._ref) : super([]);

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> loadAssetSummaries(String workspaceId) async {
    try {
      final querySnapshot = await _firestore
          .collection('workspaces')
          .doc(workspaceId)
          .collection('assetSummaries')
          .get();

      final assetSummaries = querySnapshot.docs.map((doc) {
        return AssetSummary.fromJson(doc.data());
      }).toList();

      state = assetSummaries;
    } catch (e) {
      logger.e('Error loading asset summaries for workspace $workspaceId: $e');
    }
  }

  Future<void> addAssetSummary(
      String workspaceId, AssetSummary assetSummary) async {
    try {
      await _firestore
          .collection('workspaces')
          .doc(workspaceId)
          .collection('assetSummaries')
          .doc(assetSummary.month)
          .set(assetSummary.toJson());

      state = [...state, assetSummary];
    } catch (e) {
      logger.e('Error adding asset summary for workspace $workspaceId: $e');
    }
  }

  Future<void> updateAssetSummary(
      String workspaceId, AssetSummary assetSummary) async {
    try {
      await _firestore
          .collection('workspaces')
          .doc(workspaceId)
          .collection('assetSummaries')
          .doc(assetSummary.month)
          .update(assetSummary.toJson());

      state = state
          .map((summary) =>
              summary.month == assetSummary.month ? assetSummary : summary)
          .toList();
    } catch (e) {
      logger.e('Error updating asset summary for workspace $workspaceId: $e');
    }
  }

  Future<void> deleteAssetSummary(String workspaceId, String month) async {
    try {
      await _firestore
          .collection('workspaces')
          .doc(workspaceId)
          .collection('assetSummaries')
          .doc(month)
          .delete();

      state = state.where((summary) => summary.month != month).toList();
    } catch (e) {
      logger.e('Error deleting asset summary for workspace $workspaceId: $e');
    }
  }

  AssetSummary get assetSummaryThisMonth {
    return state.firstWhere((s) => s.month == getMonth(DateTime.now()));
  }

  AssetSummary? getAssetSummaryByMonth(String monthKey) {
    try {
      return state.firstWhere((s) => s.month == monthKey);
    } catch (e) {
      logger.e('Error getting asset summary for month $monthKey: $e');
      return null;
    }
  }

  String compareToLastMonthState(String monthKey) {
    final thisMonthIndex = state.indexWhere((s) => s.month == monthKey);
    if (monthKey.length == 1 || thisMonthIndex == 0) {
      return '오늘의 자산이 어제보다 늘어있기를!';
    }

    state.sort((a, b) => a.month.compareTo(b.month));

    final thisMonthAssetSummary = state.firstWhere((s) => s.month == monthKey);
    final lastMonthAssetSummary = state[thisMonthIndex - 1];

    if (thisMonthAssetSummary.totalAssets ==
        lastMonthAssetSummary.totalAssets) {
      return '이전달 대비 자산변동이 없습니다!';
    } else if (thisMonthAssetSummary.totalAssets >
        lastMonthAssetSummary.totalAssets) {
      final increaseAmt =
          thisMonthAssetSummary.totalAssets - lastMonthAssetSummary.totalAssets;
      return '자산이 이전달 대비 $increaseAmt 올랐어요!';
    } else if (thisMonthAssetSummary.totalAssets <
        lastMonthAssetSummary.totalAssets) {
      final decreaseAmt =
          lastMonthAssetSummary.totalAssets - thisMonthAssetSummary.totalAssets;
      return '자산이 이전달 대비 $decreaseAmt 줄었네요..!';
    } else {
      return '';
    }
  }

  double get monthlyExpenditure {
    final thisMonthTransactions = _ref
        .read(transactionViewModelProvider.notifier)
        .getMonthTransactions(getMonth(DateTime.now()));

    return thisMonthTransactions.fold(
        0.0, (total, transaction) => total + transaction['totalExpense']);
  }

  double get currentExpendableBudget {
    final currentAssetSummary =
        getAssetSummaryByMonth(getMonth(DateTime.now()));
    if (monthlyExpenditure > (currentAssetSummary?.monthlyBudget ?? 0)) {
      return 0;
    }
    return (currentAssetSummary?.monthlyBudget ?? 0) - monthlyExpenditure;
  }

  double get budgetExpenditurePercentage {
    final currentAssetSummary =
        getAssetSummaryByMonth(getMonth(DateTime.now()));
    final monthlyBudget = currentAssetSummary?.monthlyBudget ?? 0;

    if (monthlyBudget == 0) {
      return 0.0; // 예산이 0일 경우, 0%로 처리
    }

    final percentage = (monthlyExpenditure / monthlyBudget).clamp(0.0, 1.0);
    return percentage;
  }

  String get warningText {
    if (budgetExpenditurePercentage == 0) {
      return '아직 예산을 사용하지 않으셨군요! 대단합니다!';
    } else if (budgetExpenditurePercentage < 0.4) {
      return '예산이 충분히 남아있어요!';
    } else if (budgetExpenditurePercentage > 0.4 &&
        budgetExpenditurePercentage < 0.7) {
      return '예산을 절반정도 소진했어요!';
    } else if (budgetExpenditurePercentage < 1) {
      return '예산을 대부분 사용했어요!\n예산을 초과하지 않도록 주의해주세요!';
    } else {
      // 100% ~ 그이상
      return '예산을 전부 사용했어요!';
    }
  }
}
