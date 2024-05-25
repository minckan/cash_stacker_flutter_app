// currency_model.dart

class Currency {
  final String countryCode;
  final String countryName;
  final String currencyCode;
  final String currencyName;
  final String currencySymbol;
  // final bool? isCustomized;

  Currency({
    required this.countryCode,
    required this.countryName,
    required this.currencyCode,
    required this.currencyName,
    required this.currencySymbol,
    // this.isCustomized = false,
  });

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      countryCode: json['country_code'],
      countryName: json['country_name'],
      currencyCode: json['currency_code'],
      currencyName: json['currency_name'],
      currencySymbol: json['currency_symbol'],
      // isCustomized: json['is_customized'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'country_code': countryCode,
      'country_name': countryName,
      'currency_code': currencyCode,
      'currency_name': currencyName,
      'currency_symbol': currencySymbol,
      // 'is_customized': isCustomized ?? false,
    };
  }
}
