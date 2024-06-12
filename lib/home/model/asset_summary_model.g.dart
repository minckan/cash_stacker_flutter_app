// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssetSummary _$AssetSummaryFromJson(Map<String, dynamic> json) => AssetSummary(
      monthlyBudget: (json['monthlyBudget'] as num?)?.toDouble() ?? 0,
      month: json['month'] as String,
    );

Map<String, dynamic> _$AssetSummaryToJson(AssetSummary instance) =>
    <String, dynamic>{
      'monthlyBudget': instance.monthlyBudget,
      'month': instance.month,
    };
