class Asset {
  Asset({
    required this.id,
    required this.buyingCurrency,
    required this.assetName,
    required this.assetCategory,
    required this.buyingPrice,
    required this.buyingAmount,
    required this.proportion,
    required this.currentOriginalTotalValuation,
    required this.currentOriginalValuation,
    required this.initialBuyingDate,
    required this.buyingCurrencyUnit,
    required this.exchangeRate,
    required this.currentExchangedTotalValuation,
    required this.currentExchangedValuation,
    required this.rateOfReturn,
  });

  // asset id
  final String id;

  // 종목명
  final String assetName;
  // 종목 타입 : 미국채권, 엔화노출미국채권, 국내주식, 현금
  final String assetCategory;
  // 매입가:
  final double? buyingPrice;
  // 수량:
  final int? buyingAmount;
  // 비중:
  final double proportion;
  // 평가액(기존 통화)
  final double currentOriginalTotalValuation;
  // 현재가(기존 통화)
  final double? currentOriginalValuation;
  // 원화대비 구매 환율
  final double exchangeRate;
  // 구매 통화
  final String buyingCurrency;
  // 구매 통화 유닛
  final String buyingCurrencyUnit;
  // 평가액(원화환산 평가액)
  final double currentExchangedTotalValuation;
  // 현재가(현재환율)
  final double currentExchangedValuation;
  // 수익률(원화환산 수익률)
  final double rateOfReturn;
  // 최초 편입일
  final DateTime initialBuyingDate;

  factory Asset.fromJson(Map<String, dynamic> data) {
    return Asset(
      id: data['id'],
      buyingCurrency: data['buyingCurrency'],
      assetName: data['assetName'],
      assetCategory: data['assetCategory'],
      buyingPrice: data['buyingPrice'],
      buyingAmount: data['buyingAmount'],
      proportion: data['proportion'],
      currentOriginalTotalValuation: data['currentOriginalTotalValuation'],
      currentOriginalValuation: data['currentOriginalValuation'],
      exchangeRate: data['exchangeRate'],
      buyingCurrencyUnit: data['buyingCurrencyUnit'],
      initialBuyingDate: DateTime.parse(data['initialBuyingDate']),
      currentExchangedTotalValuation: data['currentExchangedTotalValuation'],
      currentExchangedValuation: data['currentExchangedValuation'],
      rateOfReturn: data['rateOfReturn'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'buyingCurrency': buyingCurrency,
      'assetName': assetName,
      'assetCategory': assetCategory,
      'buyingPrice': buyingPrice,
      'buyingAmount': buyingAmount,
      'proportion': proportion,
      'currentOriginalTotalValuation': currentOriginalTotalValuation,
      'currentOriginalValuation': currentOriginalValuation,
      'exchangeRate': exchangeRate,
      'buyingCurrencyUnit': buyingCurrencyUnit,
      'initialBuyingDate': initialBuyingDate.toIso8601String(),
      'currentExchangedTotalValuation': currentExchangedTotalValuation,
      'currentExchangedValuation': currentExchangedValuation,
      'rateOfReturn': rateOfReturn,
    };
  }
}
