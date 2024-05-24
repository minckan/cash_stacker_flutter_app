// 기능 : 예산관리를 세부적으로 처리할 수 있다
// 기본적으로 월별로 관리되나 해당 월 안에서 기간별로 관리가능하다.
// 해당 월을 넘어서 설정은 불가능 하게 되어있음
//

class Budget {
  final String id;
  // 해당 기간 사용가능한 총 예산 금액
  final double availableBudget;
  // 해당 기간 실제로 사용한 금액
  final double usedAmount;
  // 예산이 적용되는 월 'yyyy-MM'
  final String month;

// 예산설정 기간
// final DateTime budgetPeriod;
// 예산 성정 타입 : monthly, weekly

  Budget({
    required this.id,
    required this.availableBudget,
    required this.usedAmount,
    required this.month,
  });

  Map<String, dynamic> toMap() {
    return {
      'availableBudget': availableBudget,
      'usedAmount': usedAmount,
      'month': month,
    };
  }

  factory Budget.fromMap(Map<String, dynamic> map, String id) {
    return Budget(
      id: id,
      availableBudget: map['availableBudget'],
      usedAmount: map['usedAmount'],
      month: map['month'],
    );
  }
}
