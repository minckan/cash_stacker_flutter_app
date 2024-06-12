import 'package:json_annotation/json_annotation.dart';

part 'monthly_asset_trend_model.g.dart';

@JsonSerializable()
class MonthlyAssetTrendModel {
  @JsonKey(name: 'year_month')
  final String yearMonth;

  @JsonKey(name: 'total_value')
  final double totalValue;

  MonthlyAssetTrendModel({
    required this.yearMonth,
    required this.totalValue,
  });

  // JSON -> 객체
  factory MonthlyAssetTrendModel.fromJson(Map<String, dynamic> json) =>
      _$MonthlyAssetTrendModelFromJson(json);

  // 객체 -> JSON
  Map<String, dynamic> toJson() => _$MonthlyAssetTrendModelToJson(this);

  factory MonthlyAssetTrendModel.empty() {
    return MonthlyAssetTrendModel(
      yearMonth: '',
      totalValue: 0.0,
    );
  }

  double normalizeTotalAssets(double min, double max) {
    if (max == min) return 0.0; // 최대값과 최소값이 같으면 정규화할 수 없음
    return ((totalValue - min) / (max - min)) * 10;
  }

  String get formattedTotalAssets {
    if (totalValue == 0.0) {
      return '';
    }
    if (totalValue >= 1000000000) {
      return '${(totalValue / 1000000000).toStringAsFixed(1)}억';
    } else if (totalValue >= 100000000 && totalValue <= 1000000000) {
      return '${(totalValue / 100000000).toStringAsFixed(1)}억';
    } else if (totalValue >= 10000000) {
      return '${(totalValue / 10000000).toStringAsFixed(1)}천';
    } else if (totalValue >= 1000000) {
      return '${(totalValue / 1000000).toStringAsFixed(1)}백';
    } else if (totalValue >= 10000) {
      return '${(totalValue / 10000).toStringAsFixed(1)}만';
    } else {
      return '${(totalValue / 10000).toStringAsFixed(1)}만';
    }
  }
}
