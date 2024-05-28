import 'package:cash_stacker_flutter_app/common/model/currency_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'asset_transaction.g.dart';

enum AssetTransactionType {
  sell,
  buy,
}

@JsonSerializable(explicitToJson: true)
class AssetTransaction {
  final String id;
  final DateTime date;
  final AssetTransactionType type;

  /// 매수, 매도 원래 통화
  final double price;
  final double quantity;
  final double? exchangeRate;
  final Currency currency;

  AssetTransaction({
    required this.id,
    required this.date,
    required this.quantity,
    required this.price,
    required this.type,
    required this.currency,
    this.exchangeRate = 0,
  });

  double get krwPrice {
    if (currency.currencyCode == 'KRW') {
      return price;
    } else {
      return price * exchangeRate!;
    }
  }

  factory AssetTransaction.fromJson(Map<String, dynamic> json) =>
      _$AssetTransactionFromJson(json);

  Map<String, dynamic> toJson() => _$AssetTransactionToJson(this);
}
