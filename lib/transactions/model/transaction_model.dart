import 'package:cash_stacker_flutter_app/transactions/model/payment_method.dart';
import 'package:json_annotation/json_annotation.dart';
part 'transaction_model.g.dart';

enum TransactionType {
  income,
  expense,
}

@JsonSerializable(explicitToJson: true)
class TransactionModel {
  TransactionModel({
    required this.id,
    required this.date,
    required this.amount,
    required this.transactionType,
    required this.categoryId,
    this.paymentMethod,
    this.memo,
  });

  @JsonKey(name: 'transaction_id')
  final String id;
  @JsonKey(name: 'created_at')
  final DateTime date;
  final String amount;
  @JsonKey(name: 'transaction_type')
  final TransactionType transactionType;
  @JsonKey(name: 'category_id')
  final String categoryId;
  @JsonKey(name: 'payment_method')
  final PaymentMethod? paymentMethod;
  @JsonKey(name: 'description')
  final String? memo;

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionModelToJson(this);
}
