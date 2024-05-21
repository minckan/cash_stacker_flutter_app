enum PaymentType {
  cash,
  card,
}

class PaymentMethod {
  PaymentMethod({
    required this.name,
    required this.type,
  });
  final PaymentType type;
  final String name;

  factory PaymentMethod.fromJson(Map<String, dynamic> json) {
    return PaymentMethod(
      name: json['name'],
      type: PaymentType.values[json['type']],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'type': type.index,
    };
  }
}

List<PaymentMethod> allExpandPayments = [
  PaymentMethod(name: '카드', type: PaymentType.card),
  PaymentMethod(name: '현금', type: PaymentType.cash),
];
