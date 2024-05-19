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
    this.memo,
  });

  final String id;
  final DateTime date;
  final int amount;
  final TransactionType transactionType;
  final String category;
  final String? memo;

  factory TransactionModel.fromJson(Map<String, dynamic> data) {
    return TransactionModel(
      id: data['id'],
      date: DateTime.parse(data['date']),
      amount: data['amount'],
      transactionType: TransactionType.values[data['transactionType']],
      category: data['category'],
      memo: data['memo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date.toIso8601String(),
      'amount': amount,
      'transactionType': transactionType.index,
      'category': category,
      'memo': memo,
    };
  }
}
