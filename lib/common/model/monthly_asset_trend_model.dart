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
}
