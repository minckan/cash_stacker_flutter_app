// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Asset _$AssetFromJson(Map<String, dynamic> json) => Asset(
      id: json['id'] as String,
      name: json['name'] as String,
      category:
          CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
      currency: json['currency'] == null
          ? null
          : Currency.fromJson(json['currency'] as Map<String, dynamic>),
      initialPurchaseDate:
          DateTime.parse(json['initialPurchaseDate'] as String),
      inputCurrentPrice: (json['inputCurrentPrice'] as num).toDouble(),
    );

Map<String, dynamic> _$AssetToJson(Asset instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': instance.category.toJson(),
      'currency': instance.currency?.toJson(),
      'initialPurchaseDate': instance.initialPurchaseDate.toIso8601String(),
      'inputCurrentPrice': instance.inputCurrentPrice,
    };
