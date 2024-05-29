import 'package:json_annotation/json_annotation.dart';

part 'asset_summary_model.g.dart';

@JsonSerializable()
class AssetSummary {
  final double totalAssets;
  final double monthlyBudget;
  // final double monthlyExpenditure;

  /// yyyy-MM
  final String month;

  AssetSummary({
    this.totalAssets = 0,
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
      totalAssets: totalAssets ?? this.totalAssets,
      monthlyBudget: monthlyBudget ?? this.monthlyBudget,
      // monthlyExpenditure: monthlyExpenditure ?? this.monthlyExpenditure,
    );
  }

  factory AssetSummary.empty() {
    return AssetSummary(
      month: '',
      totalAssets: 0.0,
      monthlyBudget: 0.0,
    );
  }

  String get formattedTotalAssets {
    if (totalAssets == 0.0) {
      return '';
    }
    if (totalAssets >= 1000000000) {
      return '${(totalAssets / 1000000000).toStringAsFixed(1)}억';
    } else if (totalAssets >= 100000000 && totalAssets <= 1000000000) {
      return '${(totalAssets / 100000000).toStringAsFixed(1)}억';
    } else if (totalAssets >= 10000000) {
      return '${(totalAssets / 10000000).toStringAsFixed(1)}천만';
    } else if (totalAssets >= 1000000) {
      return '${(totalAssets / 1000000).toStringAsFixed(1)}백만';
    } else if (totalAssets >= 10000) {
      return '${(totalAssets / 10000).toStringAsFixed(1)}만';
    } else {
      return '${(totalAssets / 10000).toStringAsFixed(1)}만';
    }
  }

  // totalAssets 값을 0에서 10 사이로 정규화하여 반환하는 getter
  double normalizeTotalAssets(double min, double max) {
    if (max == min) return 0.0; // 최대값과 최소값이 같으면 정규화할 수 없음
    return ((totalAssets - min) / (max - min)) * 10;
  }
}

class AssetSummaryDecile {
  final AssetSummary assetSummary;
  final double normalizedValue;

  AssetSummaryDecile({
    required this.assetSummary,
    required this.normalizedValue,
  });

  factory AssetSummaryDecile.empty() {
    return AssetSummaryDecile(
        assetSummary: AssetSummary.empty(), normalizedValue: 0);
  }
}

List<AssetSummaryDecile> normalizeAssetSummaries(
    List<AssetSummary> assetSummaries) {
  if (assetSummaries.isEmpty) return [];

  // totalAssets의 최대값과 최소값 구하기
  double minTotalAssets =
      assetSummaries.map((e) => e.totalAssets).reduce((a, b) => a < b ? a : b);
  double maxTotalAssets =
      assetSummaries.map((e) => e.totalAssets).reduce((a, b) => a > b ? a : b);

  // 최소값과 최대값이 동일한 경우를 처리
  if (minTotalAssets == maxTotalAssets) {
    return assetSummaries.map((asset) {
      return AssetSummaryDecile(
          assetSummary: asset, normalizedValue: 10.0); // 동일한 값이므로 10으로 설정
    }).toList();
  }

  // 각 AssetSummary의 totalAssets 값을 0에서 10 사이로 정규화
  return assetSummaries.map((asset) {
    double normalizedValue =
        asset.normalizeTotalAssets(minTotalAssets, maxTotalAssets);
    return AssetSummaryDecile(
        assetSummary: asset, normalizedValue: normalizedValue);
  }).toList();
}
