enum TransactionCategoryType {
  expense,
  income,
}

class TransactionCategoryModel {
  TransactionCategoryModel({
    required this.id,
    required this.name,
    required this.type,
  });

  final String id;
  final String name;
  final TransactionCategoryType type;

  factory TransactionCategoryModel.fromJson(Map<String, dynamic> json) {
    return TransactionCategoryModel(
      id: json['id'],
      name: json['name'],
      type: TransactionCategoryType.values[json['type']],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type.index,
    };
  }
}
