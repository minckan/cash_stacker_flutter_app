import 'package:cash_stacker_flutter_app/setting/model/asset_type_model.dart';

import 'package:json_annotation/json_annotation.dart';

part 'asset_transaction.g.dart';

enum AssetTransactionType {
  @JsonValue('매도')
  sell,
  @JsonValue('매수')
  buy,
}

/// 건당 자산 거래 내용
/// [❗️] 현금은 저장되지 않음
abstract class AssetTransaction {
  /// 자산거래 건당 고유 아이디
  @JsonKey(name: 'transaction_id')
  final String id;

  /// 자산거래 카테고리 (default: 현금, 외환, 국내주식, 해외주식)
  @JsonKey(name: 'asset_type')
  final AssetTypeModel category;

  /// 자산 아이디(상위개념)
  @JsonKey(name: 'asset_id')
  final String assetId;

  /// 자산 거래일자
  @JsonKey(name: 'transaction_date')
  final DateTime date;

  /// 자산 거래 타입 (매도, 매수)
  @JsonKey(name: 'transaction_type')
  final AssetTransactionType type;

  /// 구매 통화
  @JsonKey(name: 'currency')
  final String currencyCode;

  AssetTransaction({
    required this.id,
    required this.assetId,
    required this.date,
    required this.type,
    required this.category,
    required this.currencyCode,
  });

  String? typeToString() => _$AssetTransactionTypeEnumMap[type];

  double get singlePrice;
  double get totalTransactionPrice;
  double get krwSinglePrice;
  double get totalKrwTransactionPrice;
  int get quantity;
  double get exchangeRate;

  Map<String, dynamic> toJson();
}

/// DomesticTransaction (국내 거래)
@JsonSerializable(explicitToJson: true)
class DomesticTransaction extends AssetTransaction {
  /// 거래한 주식 수량
  final int shares;

  /// 주당 가격 (원화)
  @JsonKey(name: 'price_per_share')
  final double pricePerShare;

  DomesticTransaction({
    required super.id,
    required super.assetId,
    required super.date,
    required super.type,
    required super.category,
    required super.currencyCode,
    required this.shares,
    required this.pricePerShare,
  });

  factory DomesticTransaction.fromJson(Map<String, dynamic> json) =>
      _$DomesticTransactionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DomesticTransactionToJson(this);

  @override
  double get singlePrice => pricePerShare;

  @override
  double get totalTransactionPrice => shares * pricePerShare;

  @override
  double get krwSinglePrice => pricePerShare;

  @override
  double get totalKrwTransactionPrice => totalTransactionPrice;

  @override
  int get quantity => shares;

  @override
  double get exchangeRate => 0;
}

/// ForeignTransaction (해외자산거래)
@JsonSerializable(explicitToJson: true)
class ForeignTransaction extends AssetTransaction {
  /// 거래한 주식 수량
  final int shares;

  /// 주당 가격 (외화)
  @JsonKey(name: 'price_per_share')
  final double pricePerShare;

  /// 환율
  @JsonKey(name: 'exchange_rate')
  final double inputExchangeRate;

  ForeignTransaction({
    required super.id,
    required super.assetId,
    required super.date,
    required super.type,
    required super.category,
    required super.currencyCode,
    required this.shares,
    required this.pricePerShare,
    required this.inputExchangeRate,
  });

  factory ForeignTransaction.fromJson(Map<String, dynamic> json) =>
      _$ForeignTransactionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ForeignTransactionToJson(this);

  @override
  double get singlePrice => pricePerShare;

  @override
  double get totalTransactionPrice => shares * pricePerShare;

  @override
  double get krwSinglePrice => pricePerShare * exchangeRate;

  @override
  double get totalKrwTransactionPrice => krwSinglePrice * shares;

  @override
  int get quantity => shares;

  @override
  double get exchangeRate => inputExchangeRate;
}

/// ForexTransaction (외환 거래)
@JsonSerializable(explicitToJson: true)
class ForexTransaction extends AssetTransaction {
  /// 외환 거래액
  @JsonKey(name: 'amount')
  final double transactionAmt;

  /// 환율
  @JsonKey(name: 'exchange_rate')
  final double inputExchangeRate;

  ForexTransaction({
    required super.id,
    required super.assetId,
    required super.date,
    required super.type,
    required super.category,
    required super.currencyCode,
    required this.transactionAmt,
    required this.inputExchangeRate,
  });

  factory ForexTransaction.fromJson(Map<String, dynamic> json) =>
      _$ForexTransactionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ForexTransactionToJson(this);

  @override
  double get singlePrice => 0;

  @override
  double get totalTransactionPrice => transactionAmt;

  @override
  double get krwSinglePrice => exchangeRate;

  @override
  double get totalKrwTransactionPrice => transactionAmt * exchangeRate;

  @override
  int get quantity => 0;

  @override
  double get exchangeRate => inputExchangeRate;
}
