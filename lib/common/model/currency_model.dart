// currency_model.dart

import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Currency {
  final String currencyCode;
  final String currencyName;
  final String currencySymbol;
  final String rate;

  Currency({
    required this.currencyCode,
    required this.currencyName,
    required this.currencySymbol,
    required this.rate,
  });
}
