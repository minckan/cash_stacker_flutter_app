// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Currency _$CurrencyFromJson(Map<String, dynamic> json) => Currency(
      countryCode: json['country_code'] as String,
      countryName: json['country_name'] as String,
      currencyCode: json['currency_code'] as String,
      currencyName: json['currency_name'] as String,
      currencySymbol: json['currency_symbol'] as String,
    );

Map<String, dynamic> _$CurrencyToJson(Currency instance) => <String, dynamic>{
      'country_code': instance.countryCode,
      'country_name': instance.countryName,
      'currency_code': instance.currencyCode,
      'currency_name': instance.currencyName,
      'currency_symbol': instance.currencySymbol,
    };
