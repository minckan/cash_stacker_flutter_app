import 'package:cash_stacker_flutter_app/common/model/currency_model.dart';
import 'package:cash_stacker_flutter_app/setting/model/category_model.dart';

class Asset {
  Asset({
    required this.id,
    required this.assetName,
    required this.assetCategory,
    required this.buyingAmount,
    required this.buyingDate,
    required this.krwBuyingPrice,
    required this.currentKrwPrice,
    this.exchangeRate,
    // this.buyingCurrencyUnit,
    this.buyingCurrency,
    this.originalCurrencyBuyingPrice,
    this.originalCurrencyCurrentPrice,
    this.isInitialBuying = false,
  });

  // asset id - 동일한 종목을 구매할때 아이디를 동일하게 저장(문서아이디는 다름)
  final String id;

  // ⭐️ 인풋 입력 값
  // 구매 통화
  final Currency? buyingCurrency;

  // 종목명
  final String assetName;
  // 종목 타입, 자산분류 :해외채권, 국내주식, 현금
  final CategoryModel assetCategory;
  // 수량:
  final int buyingAmount;
  // 기존 통화 매입가 (원이면 원화입력)
  final double? originalCurrencyBuyingPrice;
  // 원화환산 매입가
  final double krwBuyingPrice;
  // 기존통화 현재가 (원이면 원화입력)
  final double? originalCurrencyCurrentPrice;
  // 원화환산 현재가
  final double currentKrwPrice;
  // 해외 자산 구매 환율
  final double? exchangeRate;
  // 구매일
  final DateTime buyingDate;

  // 최초거래 여부
  bool? isInitialBuying;

  // 계산해서 자동입력 해야하는 값

  // 비중:
  // final double proportion;
  // 평가액(원화환산 평가액)
  // 수익률(원화환산 수익률)
  // final double rateOfReturn;

  // // 구매 통화 유닛
  // final String? buyingCurrencyUnit;

  factory Asset.fromJson(Map<String, dynamic> json) {
    return Asset(
      id: json['id'],
      assetName: json['assetName'],
      assetCategory: CategoryModel.fromJson(json['assetCategory']),
      buyingAmount: json['buyingAmount'],
      buyingDate: DateTime.parse(json['buyingDate']),
      krwBuyingPrice: json['krwBuyingPrice'],
      currentKrwPrice: json['currentKrwPrice'],
      exchangeRate: json['exchangeRate'],
      // buyingCurrencyUnit: json['buyingCurrencyUnit'],
      buyingCurrency: Currency.fromJson(json['buyingCurrency']),
      originalCurrencyBuyingPrice: json['originalCurrencyBuyingPrice'],
      originalCurrencyCurrentPrice: json['originalCurrencyCurrentPrice'],
      isInitialBuying: json['isInitialBuying'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'assetName': assetName,
      'assetCategory': assetCategory.toJson(),
      'buyingAmount': buyingAmount,
      'buyingDate': buyingDate.toIso8601String(),
      'krwBuyingPrice': krwBuyingPrice,
      'currentKrwPrice': currentKrwPrice,
      'exchangeRate': exchangeRate,
      // 'buyingCurrencyUnit': buyingCurrencyUnit,
      'buyingCurrency': buyingCurrency?.toJson(),
      'originalCurrencyBuyingPrice': originalCurrencyBuyingPrice,
      'originalCurrencyCurrentPrice': originalCurrencyCurrentPrice,
      'isInitialBuying': isInitialBuying,
    };
  }
}
