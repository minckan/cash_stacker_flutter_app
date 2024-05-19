enum TransactionType {
  expense,
  income,
}

class TransactionModel {
  TransactionModel({
    required this.date,
    required this.amount,
    required this.transactionType,
    required this.category,
    this.memo,
  });

  final DateTime date;
  final int amount;
  final TransactionType transactionType;
  final String category;
  final String? memo;
}
