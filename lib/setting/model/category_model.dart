import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

enum CategoryType {
  expense,
  income,
  asset,
}

@JsonSerializable()
class CategoryModel {
  CategoryModel({
    required this.id,
    required this.name,
    required this.type,
    this.isForeignAsset = false,
    this.isCustomCategory = false,
  });

  final String id;
  final String name;
  final CategoryType type;
  final bool isForeignAsset;
  final bool isCustomCategory;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
