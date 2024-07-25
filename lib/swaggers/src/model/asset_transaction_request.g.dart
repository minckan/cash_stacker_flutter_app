// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_transaction_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const AssetTransactionRequestTransactionTypeEnum
    _$assetTransactionRequestTransactionTypeEnum_sell =
    const AssetTransactionRequestTransactionTypeEnum._('sell');
const AssetTransactionRequestTransactionTypeEnum
    _$assetTransactionRequestTransactionTypeEnum_buy =
    const AssetTransactionRequestTransactionTypeEnum._('buy');

AssetTransactionRequestTransactionTypeEnum
    _$assetTransactionRequestTransactionTypeEnumValueOf(String name) {
  switch (name) {
    case 'sell':
      return _$assetTransactionRequestTransactionTypeEnum_sell;
    case 'buy':
      return _$assetTransactionRequestTransactionTypeEnum_buy;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<AssetTransactionRequestTransactionTypeEnum>
    _$assetTransactionRequestTransactionTypeEnumValues = new BuiltSet<
        AssetTransactionRequestTransactionTypeEnum>(const <AssetTransactionRequestTransactionTypeEnum>[
  _$assetTransactionRequestTransactionTypeEnum_sell,
  _$assetTransactionRequestTransactionTypeEnum_buy,
]);

Serializer<AssetTransactionRequestTransactionTypeEnum>
    _$assetTransactionRequestTransactionTypeEnumSerializer =
    new _$AssetTransactionRequestTransactionTypeEnumSerializer();

class _$AssetTransactionRequestTransactionTypeEnumSerializer
    implements PrimitiveSerializer<AssetTransactionRequestTransactionTypeEnum> {
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
    AssetTransactionRequestTransactionTypeEnum
  ];
  @override
  final String wireName = 'AssetTransactionRequestTransactionTypeEnum';

  @override
  Object serialize(Serializers serializers,
          AssetTransactionRequestTransactionTypeEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  AssetTransactionRequestTransactionTypeEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      AssetTransactionRequestTransactionTypeEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$AssetTransactionRequest extends AssetTransactionRequest {
  @override
  final int? assetId;
  @override
  final AssetTransactionRequestTransactionTypeEnum? transactionType;
  @override
  final String? description;
  @override
  final DateTime? transactionDate;
  @override
  final double? exchangeRate;
  @override
  final int? shares;
  @override
  final double? pricePerShare;
  @override
  final double? currentPricePerShare;
  @override
  final double? balance;

  factory _$AssetTransactionRequest(
          [void Function(AssetTransactionRequestBuilder)? updates]) =>
      (new AssetTransactionRequestBuilder()..update(updates))._build();

  _$AssetTransactionRequest._(
      {this.assetId,
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
  AssetTransactionRequest rebuild(
          void Function(AssetTransactionRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AssetTransactionRequestBuilder toBuilder() =>
      new AssetTransactionRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AssetTransactionRequest &&
        assetId == other.assetId &&
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
    _$hash = $jc(_$hash, assetId.hashCode);
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
    return (newBuiltValueToStringHelper(r'AssetTransactionRequest')
          ..add('assetId', assetId)
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

class AssetTransactionRequestBuilder
    implements
        Builder<AssetTransactionRequest, AssetTransactionRequestBuilder> {
  _$AssetTransactionRequest? _$v;

  int? _assetId;
  int? get assetId => _$this._assetId;
  set assetId(int? assetId) => _$this._assetId = assetId;

  AssetTransactionRequestTransactionTypeEnum? _transactionType;
  AssetTransactionRequestTransactionTypeEnum? get transactionType =>
      _$this._transactionType;
  set transactionType(
          AssetTransactionRequestTransactionTypeEnum? transactionType) =>
      _$this._transactionType = transactionType;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  DateTime? _transactionDate;
  DateTime? get transactionDate => _$this._transactionDate;
  set transactionDate(DateTime? transactionDate) =>
      _$this._transactionDate = transactionDate;

  double? _exchangeRate;
  double? get exchangeRate => _$this._exchangeRate;
  set exchangeRate(double? exchangeRate) => _$this._exchangeRate = exchangeRate;

  int? _shares;
  int? get shares => _$this._shares;
  set shares(int? shares) => _$this._shares = shares;

  double? _pricePerShare;
  double? get pricePerShare => _$this._pricePerShare;
  set pricePerShare(double? pricePerShare) =>
      _$this._pricePerShare = pricePerShare;

  double? _currentPricePerShare;
  double? get currentPricePerShare => _$this._currentPricePerShare;
  set currentPricePerShare(double? currentPricePerShare) =>
      _$this._currentPricePerShare = currentPricePerShare;

  double? _balance;
  double? get balance => _$this._balance;
  set balance(double? balance) => _$this._balance = balance;

  AssetTransactionRequestBuilder() {
    AssetTransactionRequest._defaults(this);
  }

  AssetTransactionRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _assetId = $v.assetId;
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
  void replace(AssetTransactionRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AssetTransactionRequest;
  }

  @override
  void update(void Function(AssetTransactionRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AssetTransactionRequest build() => _build();

  _$AssetTransactionRequest _build() {
    final _$result = _$v ??
        new _$AssetTransactionRequest._(
            assetId: assetId,
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
