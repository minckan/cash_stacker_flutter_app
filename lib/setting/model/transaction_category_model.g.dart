// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionCategoryModel _$TransactionCategoryModelFromJson(
        Map<String, dynamic> json) =>
    TransactionCategoryModel(
      id: json['category_id'] as String,
      name: json['category_name'] as String,
      type: $enumDecode(_$CategoryTypeEnumMap, json['category_type']),
    );

Map<String, dynamic> _$TransactionCategoryModelToJson(
        TransactionCategoryModel instance) =>
    <String, dynamic>{
      'category_id': instance.id,
      'category_name': instance.name,
      'category_type': _$CategoryTypeEnumMap[instance.type]!,
    };

const _$CategoryTypeEnumMap = {
  CategoryType.expense: 'expense',
  CategoryType.income: 'income',
  CategoryType.asset: 'asset',
};
