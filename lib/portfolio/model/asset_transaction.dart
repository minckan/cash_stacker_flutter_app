enum AssetTransactionType {
  sell,
  buy,
}

class AssetTransaction {
  final String id;
  final DateTime date;
  final AssetTransactionType type;
  final double price;
  final double quantity;
  final double exchangeRate;

  AssetTransaction({
    required this.id,
    required this.date,
    required this.quantity,
    required this.exchangeRate,
    required this.price,
    required this.type,
  });

  factory AssetTransaction.fromJson(Map<String, dynamic> json) {
    return AssetTransaction(
      id: json['id'],
      date: DateTime.parse(json['date']),
      price: json['price'],
      quantity: json['quantity'],
      exchangeRate: json['exchangeRate'],
      type: AssetTransactionType.values[json['type']],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date.toIso8601String(),
      'price': price,
      'quantity': quantity,
      'exchangeRate': exchangeRate,
      'type': type,
    };
  }
}
