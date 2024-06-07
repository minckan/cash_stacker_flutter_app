import 'package:cash_stacker_flutter_app/common/model/currency_model.dart';
import 'package:cash_stacker_flutter_app/setting/model/category_model.dart';

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
  final String id;

  /// 자산거래 카테고리 (default: 현금, 외환, 국내주식, 해외주식)
  final CategoryModel category;

  /// 자산 아이디(상위개념)
  final String assetId;

  /// 자산 이름 (상위개념)
  final String name;

  /// 자산 거래일자
  final DateTime date;

  /// 자산 거래 타입 (매도, 매수)
  final AssetTransactionType type;

  /// 구매 통화
  final Currency currency;

  AssetTransaction({
    required this.name,
    required this.id,
    required this.assetId,
    required this.date,
    required this.type,
    required this.category,
    required this.currency,
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
  final double pricePerShare;

  DomesticTransaction({
    required super.name,
    required super.id,
    required super.assetId,
    required super.date,
    required super.type,
    required super.category,
    required super.currency,
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
  final double pricePerShare;

  /// 환율
  final double inputExchangeRate;

  ForeignTransaction({
    required super.name,
    required super.id,
    required super.assetId,
    required super.date,
    required super.type,
    required super.category,
    required super.currency,
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
  final double transactionAmt;

  /// 환율
  final double inputExchangeRate;

  ForexTransaction({
    required super.name,
    required super.id,
    required super.assetId,
    required super.date,
    required super.type,
    required super.category,
    required super.currency,
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
