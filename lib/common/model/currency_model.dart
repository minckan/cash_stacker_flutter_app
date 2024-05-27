// currency_model.dart

import 'package:json_annotation/json_annotation.dart';

part 'currency_model.g.dart';

@JsonSerializable()
class Currency {
  @JsonKey(name: 'country_code')
  final String countryCode;
  @JsonKey(name: 'country_name')
  final String countryName;
  @JsonKey(name: 'currency_code')
  final String currencyCode;
  @JsonKey(name: 'currency_name')
  final String currencyName;
  @JsonKey(name: 'currency_symbol')
  final String currencySymbol;

  Currency({
    required this.countryCode,
    required this.countryName,
    required this.currencyCode,
    required this.currencyName,
    required this.currencySymbol,
  });

  factory Currency.fromJson(Map<String, dynamic> json) =>
      _$CurrencyFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyToJson(this);
}
