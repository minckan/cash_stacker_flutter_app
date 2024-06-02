// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DomesticTransaction _$DomesticTransactionFromJson(Map<String, dynamic> json) =>
    DomesticTransaction(
      name: json['name'] as String,
      id: json['id'] as String,
      assetId: json['assetId'] as String,
      date: DateTime.parse(json['date'] as String),
      type: $enumDecode(_$AssetTransactionTypeEnumMap, json['type']),
      category:
          CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
      currency: Currency.fromJson(json['currency'] as Map<String, dynamic>),
      shares: (json['shares'] as num).toInt(),
      pricePerShare: (json['pricePerShare'] as num).toDouble(),
    );

Map<String, dynamic> _$DomesticTransactionToJson(
        DomesticTransaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category.toJson(),
      'assetId': instance.assetId,
      'name': instance.name,
      'date': instance.date.toIso8601String(),
      'type': _$AssetTransactionTypeEnumMap[instance.type]!,
      'currency': instance.currency.toJson(),
      'shares': instance.shares,
      'pricePerShare': instance.pricePerShare,
    };

const _$AssetTransactionTypeEnumMap = {
  AssetTransactionType.sell: '매도',
  AssetTransactionType.buy: '매수',
};

ForeignTransaction _$ForeignTransactionFromJson(Map<String, dynamic> json) =>
    ForeignTransaction(
      name: json['name'] as String,
      id: json['id'] as String,
      assetId: json['assetId'] as String,
      date: DateTime.parse(json['date'] as String),
      type: $enumDecode(_$AssetTransactionTypeEnumMap, json['type']),
      category:
          CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
      currency: Currency.fromJson(json['currency'] as Map<String, dynamic>),
      shares: (json['shares'] as num).toInt(),
      pricePerShare: (json['pricePerShare'] as num).toDouble(),
      inputExchangeRate: (json['inputExchangeRate'] as num).toDouble(),
    );

Map<String, dynamic> _$ForeignTransactionToJson(ForeignTransaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category.toJson(),
      'assetId': instance.assetId,
      'name': instance.name,
      'date': instance.date.toIso8601String(),
      'type': _$AssetTransactionTypeEnumMap[instance.type]!,
      'currency': instance.currency.toJson(),
      'shares': instance.shares,
      'pricePerShare': instance.pricePerShare,
      'inputExchangeRate': instance.inputExchangeRate,
    };

ForexTransaction _$ForexTransactionFromJson(Map<String, dynamic> json) =>
    ForexTransaction(
      name: json['name'] as String,
      id: json['id'] as String,
      assetId: json['assetId'] as String,
      date: DateTime.parse(json['date'] as String),
      type: $enumDecode(_$AssetTransactionTypeEnumMap, json['type']),
      category:
          CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
      currency: Currency.fromJson(json['currency'] as Map<String, dynamic>),
      purchasePrice: (json['purchasePrice'] as num).toDouble(),
      inputExchangeRate: (json['inputExchangeRate'] as num).toDouble(),
    );

Map<String, dynamic> _$ForexTransactionToJson(ForexTransaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category.toJson(),
      'assetId': instance.assetId,
      'name': instance.name,
      'date': instance.date.toIso8601String(),
      'type': _$AssetTransactionTypeEnumMap[instance.type]!,
      'currency': instance.currency.toJson(),
      'purchasePrice': instance.purchasePrice,
      'inputExchangeRate': instance.inputExchangeRate,
    };
