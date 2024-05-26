import 'package:cash_stacker_flutter_app/setting/model/category_model.dart';
import 'package:cash_stacker_flutter_app/transactions/model/payment_method.dart';
import 'package:json_annotation/json_annotation.dart';
part 'transaction_model.g.dart';

enum TransactionType {
  expense,
  income,
}

@JsonSerializable()
class TransactionModel {
  TransactionModel({
    required this.id,
    required this.date,
    required this.amount,
    required this.transactionType,
    required this.category,
    this.paymentMethod,
    this.memo,
  });

  final String id;
  final DateTime date;
  final String amount;
  final TransactionType transactionType;
  final CategoryModel category;
  final PaymentMethod? paymentMethod;
  final String? memo;

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionModelToJson(this);
}
