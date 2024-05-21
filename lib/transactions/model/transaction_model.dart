import 'package:cash_stacker_flutter_app/setting/model/category_model.dart';
import 'package:cash_stacker_flutter_app/transactions/model/payment_method.dart';

enum TransactionType {
  expense,
  income,
}

class TransactionModel {
  TransactionModel({
    required this.id,
    required this.date,
    required this.amount,
    required this.transactionType,
    required this.category,
    required this.paymentMethod,
    this.memo,
  });

  final String id;
  final DateTime date;
  final String amount;
  final TransactionType transactionType;
  final CategoryModel category;
  final PaymentMethod paymentMethod;
  final String? memo;

  factory TransactionModel.fromJson(Map<String, dynamic> data) {
    return TransactionModel(
      id: data['id'],
      date: DateTime.parse(data['date']),
      amount: data['amount'],
      transactionType: TransactionType.values[data['transactionType']],
      category: CategoryModel.fromJson(data['category']),
      memo: data['memo'],
      paymentMethod: PaymentMethod.fromJson(data['paymentMethod']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date.toIso8601String(),
      'amount': amount,
      'transactionType': transactionType.index,
      'category': category.toJson(),
      'memo': memo,
      'paymentMethod': paymentMethod.toJson(),
    };
  }
}
