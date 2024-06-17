// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Asset _$AssetFromJson(Map<String, dynamic> json) => Asset(
      id: json['asset_id'] as String,
      name: json['asset_name'] as String,
      categoryId: json['asset_type_id'] as String,
      currencyCode: json['currency_code'] as String?,
      initialPurchaseDate:
          DateTime.parse(json['initial_purchase_date'] as String),
      balance: (json['balance'] as num).toDouble(),
    );

Map<String, dynamic> _$AssetToJson(Asset instance) => <String, dynamic>{
      'asset_id': instance.id,
      'asset_name': instance.name,
      'asset_type_id': instance.categoryId,
      'currency_code': instance.currencyCode,
      'initial_purchase_date': instance.initialPurchaseDate.toIso8601String(),
      'balance': instance.balance,
    };
