// currency_model.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class Currency {
  final String countryCode;
  final String countryName;
  final String currencyCode;
  final String currencyName;
  final String currencySymbol;

  final bool? isCustomized;

  Currency({
    required this.countryCode,
    required this.countryName,
    required this.currencyCode,
    required this.currencyName,
    required this.currencySymbol,
    this.isCustomized = false,
  });

  factory Currency.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    return Currency(
      countryCode: doc.id,
      countryName: data['country_name'],
      currencyCode: data['currency_code'],
      currencyName: data['currency_name'],
      currencySymbol: data['currency_symbol'],
      isCustomized: data['is_customized'] ?? false,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'country_name': countryName,
      'currency_code': currencyCode,
      'currency_name': currencyName,
      'currency_symbol': currencySymbol,
      'is_customized': isCustomized ?? false,
    };
  }
}
