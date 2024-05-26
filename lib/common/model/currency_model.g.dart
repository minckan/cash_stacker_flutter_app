// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Currency _$CurrencyFromJson(Map<String, dynamic> json) => Currency(
      countryCode: json['countryCode'] as String,
      countryName: json['countryName'] as String,
      currencyCode: json['currencyCode'] as String,
      currencyName: json['currencyName'] as String,
      currencySymbol: json['currencySymbol'] as String,
    );

Map<String, dynamic> _$CurrencyToJson(Currency instance) => <String, dynamic>{
      'countryCode': instance.countryCode,
      'countryName': instance.countryName,
      'currencyCode': instance.currencyCode,
      'currencyName': instance.currencyName,
      'currencySymbol': instance.currencySymbol,
    };
