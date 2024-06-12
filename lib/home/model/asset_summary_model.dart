import 'package:cash_stacker_flutter_app/common/model/monthly_asset_trend_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'asset_summary_model.g.dart';

@JsonSerializable()
class AssetSummary {
  final double monthlyBudget;
  final String month;

  AssetSummary({
    this.monthlyBudget = 0,
    // this.monthlyExpenditure = 0,
    required this.month,
  });

  factory AssetSummary.fromJson(Map<String, dynamic> json) =>
      _$AssetSummaryFromJson(json);

  Map<String, dynamic> toJson() => _$AssetSummaryToJson(this);

  AssetSummary copyWith({
    double? totalAssets,
    double? monthlyBudget,
    // double? monthlyExpenditure,
  }) {
    return AssetSummary(
      month: month,
      monthlyBudget: monthlyBudget ?? this.monthlyBudget,
      // monthlyExpenditure: monthlyExpenditure ?? this.monthlyExpenditure,
    );
  }

  factory AssetSummary.empty() {
    return AssetSummary(
      month: '',
      monthlyBudget: 0.0,
    );
  }
}

class AssetSummaryDecile {
  final MonthlyAssetTrendModel assetSummary;
  final double normalizedValue;

  AssetSummaryDecile({
    required this.assetSummary,
    required this.normalizedValue,
  });

  factory AssetSummaryDecile.empty() {
    return AssetSummaryDecile(
        assetSummary: MonthlyAssetTrendModel.empty(), normalizedValue: 0);
  }
}

List<AssetSummaryDecile> normalizeAssetSummaries(
    List<MonthlyAssetTrendModel> assetSummaries) {
  if (assetSummaries.isEmpty) return [];

  // totalAssets의 최대값과 최소값 구하기
  double minTotalAssets =
      assetSummaries.map((e) => e.totalValue).reduce((a, b) => a < b ? a : b);
  double maxTotalAssets =
      assetSummaries.map((e) => e.totalValue).reduce((a, b) => a > b ? a : b);

  // 최소값과 최대값이 동일한 경우를 처리
  if (minTotalAssets == maxTotalAssets && minTotalAssets != 0) {
    return assetSummaries.map((asset) {
      return AssetSummaryDecile(
          assetSummary: asset, normalizedValue: 10.0); // 동일한 값이므로 10으로 설정
    }).toList();
  }

  return assetSummaries.where((asset) => asset.totalValue > 0).map((asset) {
    double normalizedValue = asset.totalValue == 0
        ? 0.0
        : asset.normalizeTotalAssets(minTotalAssets, maxTotalAssets);

    return AssetSummaryDecile(
        assetSummary: asset, normalizedValue: normalizedValue);
  }).toList();
}
