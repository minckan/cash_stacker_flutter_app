// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) =>
    TransactionModel(
      id: (json['transaction_id'] as num?)?.toInt(),
      date: DateTime.parse(json['transaction_date'] as String),
      amount: json['amount'] as String,
      transactionType:
          $enumDecode(_$TransactionTypeEnumMap, json['transaction_type']),
      categoryId: (json['category_id'] as num).toInt(),
      paymentMethod: json['payment_method'] == null
          ? null
          : PaymentMethod.fromJson(
              json['payment_method'] as Map<String, dynamic>),
      memo: json['description'] as String?,
    );

Map<String, dynamic> _$TransactionModelToJson(TransactionModel instance) =>
    <String, dynamic>{
      'transaction_id': instance.id,
      'transaction_date': instance.date.toIso8601String(),
      'amount': instance.amount,
      'transaction_type': _$TransactionTypeEnumMap[instance.transactionType]!,
      'category_id': instance.categoryId,
      'payment_method': instance.paymentMethod?.toJson(),
      'description': instance.memo,
    };

const _$TransactionTypeEnumMap = {
  TransactionType.income: 'income',
  TransactionType.expense: 'expense',
};
