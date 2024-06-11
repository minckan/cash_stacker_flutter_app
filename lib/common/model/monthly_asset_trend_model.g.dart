// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monthly_asset_trend_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MonthlyAssetTrendModel _$MonthlyAssetTrendModelFromJson(
        Map<String, dynamic> json) =>
    MonthlyAssetTrendModel(
      yearMonth: json['year_month'] as String,
      totalValue: (json['total_value'] as num).toDouble(),
    );

Map<String, dynamic> _$MonthlyAssetTrendModelToJson(
        MonthlyAssetTrendModel instance) =>
    <String, dynamic>{
      'year_month': instance.yearMonth,
      'total_value': instance.totalValue,
    };
