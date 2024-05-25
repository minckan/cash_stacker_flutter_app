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

  factory AssetSummary.fromJson(Map<String, dynamic> json) {
    print(json);
    return AssetSummary(
      totalAssets: json['totalAssets'],
      monthlyBudget: json['monthlyBudget'],
      monthlyExpenditure: json['monthlyExpenditure'],
      month: json['month'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'totalAssets': totalAssets,
      'monthlyBudget': monthlyBudget,
      'monthlyExpenditure': monthlyExpenditure,
      'month': month,
    };
  }
}
