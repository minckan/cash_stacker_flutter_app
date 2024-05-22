enum CategoryType {
  expense,
  income,
  asset,
}

class CategoryModel {
  CategoryModel({
    required this.id,
    required this.name,
    required this.type,
  });

  final String id;
  final String name;
  final CategoryType type;

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      type: CategoryType.values[json['type']],
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
