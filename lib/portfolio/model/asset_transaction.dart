import 'package:cash_stacker_flutter_app/common/model/currency_model.dart';

enum AssetTransactionType {
  sell,
  buy,
}

class AssetTransaction {
  final String id;
  final DateTime date;
  final AssetTransactionType type;

  /// 매수, 매도 원래 통화
  final double price;
  final double quantity;
  final double? exchangeRate;
  final Currency currency;

  AssetTransaction({
    required this.id,
    required this.date,
    required this.quantity,
    required this.price,
    required this.type,
    required this.currency,
    this.exchangeRate = 0,
  });

  double get krwPrice {
    if (currency.currencyCode == 'KRW') {
      return price;
    } else {
      return price * exchangeRate!;
    }
  }

  factory AssetTransaction.fromJson(Map<String, dynamic> json) {
    return AssetTransaction(
      id: json['id'],
      date: DateTime.parse(json['date']),
      price: json['price'],
      quantity: json['quantity'],
      exchangeRate: json['exchangeRate'] ?? 0,
      type: AssetTransactionType.values[json['type']],
      currency: json['currency'] ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date.toIso8601String(),
      'price': price,
      'quantity': quantity,
      'exchangeRate': exchangeRate ?? 0.0,
      'type': type.index,
      'currency': currency,
    };
  }
}
