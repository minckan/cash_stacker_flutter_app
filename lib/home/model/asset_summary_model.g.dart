// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssetSummary _$AssetSummaryFromJson(Map<String, dynamic> json) => AssetSummary(
      totalAssets: (json['totalAssets'] as num?)?.toDouble() ?? 0,
      monthlyBudget: (json['monthlyBudget'] as num?)?.toDouble() ?? 0,
      monthlyExpenditure: (json['monthlyExpenditure'] as num?)?.toDouble() ?? 0,
      month: json['month'] as String,
    );

Map<String, dynamic> _$AssetSummaryToJson(AssetSummary instance) =>
    <String, dynamic>{
      'totalAssets': instance.totalAssets,
      'monthlyBudget': instance.monthlyBudget,
      'monthlyExpenditure': instance.monthlyExpenditure,
      'month': instance.month,
    };
