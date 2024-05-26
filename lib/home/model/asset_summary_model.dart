import 'package:json_annotation/json_annotation.dart';

part 'asset_summary_model.g.dart';

@JsonSerializable()
class AssetSummary {
  final double totalAssets;
  final double monthlyBudget;
  final double monthlyExpenditure;

  /// yyyy-MM
  final String month;

  AssetSummary({
    this.totalAssets = 0,
    this.monthlyBudget = 0,
    this.monthlyExpenditure = 0,
    required this.month,
  });

  factory AssetSummary.fromJson(Map<String, dynamic> json) =>
      _$AssetSummaryFromJson(json);
  Map<String, dynamic> toJson() => _$AssetSummaryToJson(this);
}
