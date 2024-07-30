// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_transaction_response_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const AssetTransactionResponseTypeTransactionTypeEnum
    _$assetTransactionResponseTypeTransactionTypeEnum_sell =
    const AssetTransactionResponseTypeTransactionTypeEnum._('sell');
const AssetTransactionResponseTypeTransactionTypeEnum
    _$assetTransactionResponseTypeTransactionTypeEnum_buy =
    const AssetTransactionResponseTypeTransactionTypeEnum._('buy');

AssetTransactionResponseTypeTransactionTypeEnum
    _$assetTransactionResponseTypeTransactionTypeEnumValueOf(String name) {
  switch (name) {
    case 'sell':
      return _$assetTransactionResponseTypeTransactionTypeEnum_sell;
    case 'buy':
      return _$assetTransactionResponseTypeTransactionTypeEnum_buy;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<AssetTransactionResponseTypeTransactionTypeEnum>
    _$assetTransactionResponseTypeTransactionTypeEnumValues = new BuiltSet<
        AssetTransactionResponseTypeTransactionTypeEnum>(const <AssetTransactionResponseTypeTransactionTypeEnum>[
  _$assetTransactionResponseTypeTransactionTypeEnum_sell,
  _$assetTransactionResponseTypeTransactionTypeEnum_buy,
]);

Serializer<AssetTransactionResponseTypeTransactionTypeEnum>
    _$assetTransactionResponseTypeTransactionTypeEnumSerializer =
    new _$AssetTransactionResponseTypeTransactionTypeEnumSerializer();

class _$AssetTransactionResponseTypeTransactionTypeEnumSerializer
    implements
        PrimitiveSerializer<AssetTransactionResponseTypeTransactionTypeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'sell': 'sell',
    'buy': 'buy',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'sell': 'sell',
    'buy': 'buy',
  };

  @override
  final Iterable<Type> types = const <Type>[
    AssetTransactionResponseTypeTransactionTypeEnum
  ];
  @override
  final String wireName = 'AssetTransactionResponseTypeTransactionTypeEnum';

  @override
  Object serialize(Serializers serializers,
          AssetTransactionResponseTypeTransactionTypeEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  AssetTransactionResponseTypeTransactionTypeEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      AssetTransactionResponseTypeTransactionTypeEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$AssetTransactionResponseType extends AssetTransactionResponseType {
  @override
  final int? transactionId;
  @override
  final AssetTransactionResponseTypeTransactionTypeEnum? transactionType;
  @override
  final String? description;
  @override
  final DateTime? transactionDate;
  @override
  final num? exchangeRate;
  @override
  final int? shares;
  @override
  final num? pricePerShare;
  @override
  final num? currentPricePerShare;
  @override
  final num? balance;

  factory _$AssetTransactionResponseType(
          [void Function(AssetTransactionResponseTypeBuilder)? updates]) =>
      (new AssetTransactionResponseTypeBuilder()..update(updates))._build();

  _$AssetTransactionResponseType._(
      {this.transactionId,
      this.transactionType,
      this.description,
      this.transactionDate,
      this.exchangeRate,
      this.shares,
      this.pricePerShare,
      this.currentPricePerShare,
      this.balance})
      : super._();

  @override
  AssetTransactionResponseType rebuild(
          void Function(AssetTransactionResponseTypeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AssetTransactionResponseTypeBuilder toBuilder() =>
      new AssetTransactionResponseTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AssetTransactionResponseType &&
        transactionId == other.transactionId &&
        transactionType == other.transactionType &&
        description == other.description &&
        transactionDate == other.transactionDate &&
        exchangeRate == other.exchangeRate &&
        shares == other.shares &&
        pricePerShare == other.pricePerShare &&
        currentPricePerShare == other.currentPricePerShare &&
        balance == other.balance;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, transactionId.hashCode);
    _$hash = $jc(_$hash, transactionType.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, transactionDate.hashCode);
    _$hash = $jc(_$hash, exchangeRate.hashCode);
    _$hash = $jc(_$hash, shares.hashCode);
    _$hash = $jc(_$hash, pricePerShare.hashCode);
    _$hash = $jc(_$hash, currentPricePerShare.hashCode);
    _$hash = $jc(_$hash, balance.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AssetTransactionResponseType')
          ..add('transactionId', transactionId)
          ..add('transactionType', transactionType)
          ..add('description', description)
          ..add('transactionDate', transactionDate)
          ..add('exchangeRate', exchangeRate)
          ..add('shares', shares)
          ..add('pricePerShare', pricePerShare)
          ..add('currentPricePerShare', currentPricePerShare)
          ..add('balance', balance))
        .toString();
  }
}

class AssetTransactionResponseTypeBuilder
    implements
        Builder<AssetTransactionResponseType,
            AssetTransactionResponseTypeBuilder> {
  _$AssetTransactionResponseType? _$v;

  int? _transactionId;
  int? get transactionId => _$this._transactionId;
  set transactionId(int? transactionId) =>
      _$this._transactionId = transactionId;

  AssetTransactionResponseTypeTransactionTypeEnum? _transactionType;
  AssetTransactionResponseTypeTransactionTypeEnum? get transactionType =>
      _$this._transactionType;
  set transactionType(
          AssetTransactionResponseTypeTransactionTypeEnum? transactionType) =>
      _$this._transactionType = transactionType;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  DateTime? _transactionDate;
  DateTime? get transactionDate => _$this._transactionDate;
  set transactionDate(DateTime? transactionDate) =>
      _$this._transactionDate = transactionDate;

  num? _exchangeRate;
  num? get exchangeRate => _$this._exchangeRate;
  set exchangeRate(num? exchangeRate) => _$this._exchangeRate = exchangeRate;

  int? _shares;
  int? get shares => _$this._shares;
  set shares(int? shares) => _$this._shares = shares;

  num? _pricePerShare;
  num? get pricePerShare => _$this._pricePerShare;
  set pricePerShare(num? pricePerShare) =>
      _$this._pricePerShare = pricePerShare;

  num? _currentPricePerShare;
  num? get currentPricePerShare => _$this._currentPricePerShare;
  set currentPricePerShare(num? currentPricePerShare) =>
      _$this._currentPricePerShare = currentPricePerShare;

  num? _balance;
  num? get balance => _$this._balance;
  set balance(num? balance) => _$this._balance = balance;

  AssetTransactionResponseTypeBuilder() {
    AssetTransactionResponseType._defaults(this);
  }

  AssetTransactionResponseTypeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _transactionId = $v.transactionId;
      _transactionType = $v.transactionType;
      _description = $v.description;
      _transactionDate = $v.transactionDate;
      _exchangeRate = $v.exchangeRate;
      _shares = $v.shares;
      _pricePerShare = $v.pricePerShare;
      _currentPricePerShare = $v.currentPricePerShare;
      _balance = $v.balance;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AssetTransactionResponseType other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AssetTransactionResponseType;
  }

  @override
  void update(void Function(AssetTransactionResponseTypeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AssetTransactionResponseType build() => _build();

  _$AssetTransactionResponseType _build() {
    final _$result = _$v ??
        new _$AssetTransactionResponseType._(
            transactionId: transactionId,
            transactionType: transactionType,
            description: description,
            transactionDate: transactionDate,
            exchangeRate: exchangeRate,
            shares: shares,
            pricePerShare: pricePerShare,
            currentPricePerShare: currentPricePerShare,
            balance: balance);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
