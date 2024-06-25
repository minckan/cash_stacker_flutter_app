// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Budget _$BudgetFromJson(Map<String, dynamic> json) => Budget(
      id: (json['budget_id'] as num).toInt(),
      amount: (json['amount'] as num).toDouble(),
      startDate: DateTime.parse(json['start_date'] as String),
      endDate: DateTime.parse(json['end_date'] as String),
      createDate: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$BudgetToJson(Budget instance) => <String, dynamic>{
      'budget_id': instance.id,
      'amount': instance.amount,
      'start_date': instance.startDate.toIso8601String(),
      'end_date': instance.endDate.toIso8601String(),
      'created_at': instance.createDate.toIso8601String(),
    };
