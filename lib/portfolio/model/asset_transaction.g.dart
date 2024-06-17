// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DomesticTransaction _$DomesticTransactionFromJson(Map<String, dynamic> json) =>
    DomesticTransaction(
      id: json['transaction_id'] as String,
      assetId: json['asset_id'] as String,
      date: DateTime.parse(json['transaction_date'] as String),
      type:
          $enumDecode(_$AssetTransactionTypeEnumMap, json['transaction_type']),
      category:
          AssetTypeModel.fromJson(json['asset_type'] as Map<String, dynamic>),
      currencyCode: json['currency'] as String,
      shares: (json['shares'] as num).toInt(),
      pricePerShare: (json['price_per_share'] as num).toDouble(),
    );

Map<String, dynamic> _$DomesticTransactionToJson(
        DomesticTransaction instance) =>
    <String, dynamic>{
      'transaction_id': instance.id,
      'asset_type': instance.category.toJson(),
      'asset_id': instance.assetId,
      'transaction_date': instance.date.toIso8601String(),
      'transaction_type': _$AssetTransactionTypeEnumMap[instance.type]!,
      'currency': instance.currencyCode,
      'shares': instance.shares,
      'price_per_share': instance.pricePerShare,
    };

const _$AssetTransactionTypeEnumMap = {
  AssetTransactionType.sell: '매도',
  AssetTransactionType.buy: '매수',
};

ForeignTransaction _$ForeignTransactionFromJson(Map<String, dynamic> json) =>
    ForeignTransaction(
      id: json['transaction_id'] as String,
      assetId: json['asset_id'] as String,
      date: DateTime.parse(json['transaction_date'] as String),
      type:
          $enumDecode(_$AssetTransactionTypeEnumMap, json['transaction_type']),
      category:
          AssetTypeModel.fromJson(json['asset_type'] as Map<String, dynamic>),
      currencyCode: json['currency'] as String,
      shares: (json['shares'] as num).toInt(),
      pricePerShare: (json['price_per_share'] as num).toDouble(),
      inputExchangeRate: (json['exchange_rate'] as num).toDouble(),
    );

Map<String, dynamic> _$ForeignTransactionToJson(ForeignTransaction instance) =>
    <String, dynamic>{
      'transaction_id': instance.id,
      'asset_type': instance.category.toJson(),
      'asset_id': instance.assetId,
      'transaction_date': instance.date.toIso8601String(),
      'transaction_type': _$AssetTransactionTypeEnumMap[instance.type]!,
      'currency': instance.currencyCode,
      'shares': instance.shares,
      'price_per_share': instance.pricePerShare,
      'exchange_rate': instance.inputExchangeRate,
    };

ForexTransaction _$ForexTransactionFromJson(Map<String, dynamic> json) =>
    ForexTransaction(
      id: json['transaction_id'] as String,
      assetId: json['asset_id'] as String,
      date: DateTime.parse(json['transaction_date'] as String),
      type:
          $enumDecode(_$AssetTransactionTypeEnumMap, json['transaction_type']),
      category:
          AssetTypeModel.fromJson(json['asset_type'] as Map<String, dynamic>),
      currencyCode: json['currency'] as String,
      transactionAmt: (json['amount'] as num).toDouble(),
      inputExchangeRate: (json['exchange_rate'] as num).toDouble(),
    );

Map<String, dynamic> _$ForexTransactionToJson(ForexTransaction instance) =>
    <String, dynamic>{
      'transaction_id': instance.id,
      'asset_type': instance.category.toJson(),
      'asset_id': instance.assetId,
      'transaction_date': instance.date.toIso8601String(),
      'transaction_type': _$AssetTransactionTypeEnumMap[instance.type]!,
      'currency': instance.currencyCode,
      'amount': instance.transactionAmt,
      'exchange_rate': instance.inputExchangeRate,
    };
