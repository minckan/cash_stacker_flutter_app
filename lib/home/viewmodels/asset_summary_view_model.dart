import 'package:cash_stacker_flutter_app/home/model/asset_summary_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final assetSummaryProvider =
    StateNotifierProvider<AssetSummaryViewModel, List<AssetSummary>>((ref) {
  return AssetSummaryViewModel();
});

class AssetSummaryViewModel extends StateNotifier<List<AssetSummary>> {
  AssetSummaryViewModel() : super([]);

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
      print('Error loading asset summaries: $e');
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
      print('Error adding asset summary: $e');
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
      print('Error updating asset summary: $e');
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
      print('Error deleting asset summary: $e');
    }
  }

  AssetSummary? getAssetSummaryByMonth(String monthKey) {
    try {
      return state.firstWhere((s) => s.month == monthKey);
    } catch (e) {
      print('Error getting asset summary for month $monthKey: $e');
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
}
