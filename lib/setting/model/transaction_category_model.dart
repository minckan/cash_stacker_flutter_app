import 'package:json_annotation/json_annotation.dart';

part 'transaction_category_model.g.dart';

enum CategoryType {
  expense,
  income,
  asset,
}

@JsonSerializable()
class TransactionCategoryModel {
  TransactionCategoryModel({
    required this.id,
    required this.name,
    required this.type,
  });
  @JsonKey(name: 'category_id')
  final String id;
  @JsonKey(name: 'category_name')
  final String name;
  @JsonKey(name: 'category_type')
  final CategoryType type;

  factory TransactionCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionCategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionCategoryModelToJson(this);
}
