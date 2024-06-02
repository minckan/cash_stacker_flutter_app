import 'package:cash_stacker_flutter_app/common/model/currency_model.dart';
import 'package:cash_stacker_flutter_app/setting/model/category_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'asset_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Asset {
  /// 자산 고유 아이디
  final String id;

  /// 자산 이름
  final String name;

  /// asset 카테고리
  final CategoryModel category;

  /// 매수 자산 통화
  final Currency? currency;

  /// 최초 매수일
  final DateTime initialPurchaseDate;

  /// 자산 현재가, update 가능
  final double inputCurrentPrice;

  Asset({
    required this.id,
    required this.name,
    required this.category,
    required this.currency,
    required this.initialPurchaseDate,
    required this.inputCurrentPrice,
  });

  /// 현재가 수정
  Asset copyWith({
    double? inputCurrentPrice,
  }) {
    return Asset(
      id: id,
      name: name,
      category: category,
      currency: currency,
      initialPurchaseDate: initialPurchaseDate,
      inputCurrentPrice: inputCurrentPrice ?? this.inputCurrentPrice,
    );
  }

  factory Asset.fromJson(Map<String, dynamic> json) => _$AssetFromJson(json);

  Map<String, dynamic> toJson() => _$AssetToJson(this);
}
