// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssetTransaction _$AssetTransactionFromJson(Map<String, dynamic> json) =>
    AssetTransaction(
      id: json['id'] as String,
      date: DateTime.parse(json['date'] as String),
      quantity: (json['quantity'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
      type: $enumDecode(_$AssetTransactionTypeEnumMap, json['type']),
      currency: Currency.fromJson(json['currency'] as Map<String, dynamic>),
      exchangeRate: (json['exchangeRate'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$AssetTransactionToJson(AssetTransaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'type': _$AssetTransactionTypeEnumMap[instance.type]!,
      'price': instance.price,
      'quantity': instance.quantity,
      'exchangeRate': instance.exchangeRate,
      'currency': instance.currency.toJson(),
    };

const _$AssetTransactionTypeEnumMap = {
  AssetTransactionType.sell: 'sell',
  AssetTransactionType.buy: 'buy',
};
