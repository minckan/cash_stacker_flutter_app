import 'package:json_annotation/json_annotation.dart';

part 'asset_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Asset {
  /// 자산 고유 아이디
  @JsonKey(name: 'asset_id')
  final String id;

  /// 자산 이름
  @JsonKey(name: 'asset_name')
  final String name;

  /// asset 카테고리
  @JsonKey(name: 'asset_type_id')
  final String categoryId;

  /// 매수 자산 통화
  @JsonKey(name: 'currency_code')
  final String? currencyCode;

  /// 최초 매수일
  @JsonKey(name: 'initial_purchase_date')
  final DateTime initialPurchaseDate;

  /// 자산 현재가, update 가능
  final double balance;

  Asset({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.currencyCode,
    required this.initialPurchaseDate,
    required this.balance,
  });

  /// 현재가 수정
  Asset copyWith({
    double? balance,
  }) {
    return Asset(
      id: id,
      name: name,
      categoryId: categoryId,
      currencyCode: currencyCode,
      initialPurchaseDate: initialPurchaseDate,
      balance: balance ?? this.balance,
    );
  }

  factory Asset.fromJson(Map<String, dynamic> json) => _$AssetFromJson(json);

  Map<String, dynamic> toJson() => _$AssetToJson(this);
}
