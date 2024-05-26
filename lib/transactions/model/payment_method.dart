import 'package:json_annotation/json_annotation.dart';

part 'payment_method.g.dart';

enum PaymentType {
  cash,
  card,
}

@JsonSerializable()
class PaymentMethod {
  PaymentMethod({
    required this.name,
    required this.type,
  });
  final PaymentType type;
  final String name;

  factory PaymentMethod.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentMethodToJson(this);
}

List<PaymentMethod> allExpandPayments = [
  PaymentMethod(name: '카드', type: PaymentType.card),
  PaymentMethod(name: '현금', type: PaymentType.cash),
];
