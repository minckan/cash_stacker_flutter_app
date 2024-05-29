import 'package:json_annotation/json_annotation.dart';

part 'asset_summary_model.g.dart';

@JsonSerializable()
class AssetSummary {
  final double totalAssets;
  final double monthlyBudget;
  final double monthlyExpenditure;

  /// yyyy-MM
  final String month;

  AssetSummary({
    this.totalAssets = 0,
    this.monthlyBudget = 0,
    this.monthlyExpenditure = 0,
    required this.month,
  });

  double get currentExpendableBudget {
    return monthlyBudget - monthlyExpenditure;
  }

  double get budgetExpenditurePercentage {
    return monthlyExpenditure * 100 / monthlyBudget;
  }

  String get warningText {
    if (budgetExpenditurePercentage == 0) {
      return '아직 예산을 사용하지 않으셨군요! 대단합니다!';
    } else if (budgetExpenditurePercentage < 40) {
      return '예산이 충분히 남아있어요!';
    } else if (budgetExpenditurePercentage > 40 &&
        budgetExpenditurePercentage < 70) {
      return '예산을 절반정도 소진했어요!';
    } else if (budgetExpenditurePercentage < 100) {
      return '예산을 대부분 사용했어요!\n예산을 초과하지 않도록 주의해주세요!';
    } else {
      // 100% ~ 그이상
      return '예산을 전부 사용했어요!';
    }
  }

  factory AssetSummary.fromJson(Map<String, dynamic> json) =>
      _$AssetSummaryFromJson(json);

  Map<String, dynamic> toJson() => _$AssetSummaryToJson(this);

  AssetSummary copyWith({
    double? totalAssets,
    double? monthlyBudget,
    double? monthlyExpenditure,
  }) {
    return AssetSummary(
      month: month,
      totalAssets: totalAssets ?? this.totalAssets,
      monthlyBudget: monthlyBudget ?? this.monthlyBudget,
      monthlyExpenditure: monthlyExpenditure ?? this.monthlyExpenditure,
    );
  }
}
