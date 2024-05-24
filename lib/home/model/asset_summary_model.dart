class AssetSummary {
  final String id;
  final double totalAssets;
  final double monthlyBudget;
  final double monthlyExpenditure;
  final String month;

  AssetSummary({
    required this.id,
    required this.totalAssets,
    required this.monthlyBudget,
    required this.monthlyExpenditure,
    required this.month,
  });

  Map<String, dynamic> toMap() {
    return {
      'totalAssets': totalAssets,
      'monthlyBudget': monthlyBudget,
      'monthlyExpenditure': monthlyExpenditure,
      'month': month,
    };
  }

  factory AssetSummary.fromMap(Map<String, dynamic> map, String id) {
    return AssetSummary(
      id: id,
      totalAssets: map['totalAssets'],
      monthlyBudget: map['monthlyBudget'],
      monthlyExpenditure: map['monthlyExpenditure'],
      month: map['month'],
    );
  }
}
