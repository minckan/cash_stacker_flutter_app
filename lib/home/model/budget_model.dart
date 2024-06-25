// 기능 : 예산관리를 세부적으로 처리할 수 있다
// 기본적으로 월별로 관리되나 해당 월 안에서 기간별로 관리가능하다.
// 해당 월을 넘어서 설정은 불가능 하게 되어있음
//

import 'package:json_annotation/json_annotation.dart';

part 'budget_model.g.dart';

@JsonSerializable()
class Budget {
  @JsonKey(name: 'budget_id')
  final int id;
  final double amount;
  @JsonKey(name: 'start_date')
  final DateTime startDate;
  @JsonKey(name: 'end_date')
  final DateTime endDate;
  @JsonKey(name: 'created_at')
  final DateTime createDate;

// 예산설정 기간
// final DateTime budgetPeriod;
// 예산 성정 타입 : monthly, weekly

  Budget({
    required this.id,
    required this.amount,
    required this.startDate,
    required this.endDate,
    required this.createDate,
  });

  factory Budget.fromJson(Map<String, dynamic> json) => _$BudgetFromJson(json);

  Map<String, dynamic> toJson() => _$BudgetToJson(this);
}
