// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_transaction.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AssetTransaction extends AssetTransaction {
  @override
  final int? transactionId;
  @override
  final DateTime? createdAt;
  @override
  final int? assetId;
  @override
  final String? transactionType;
  @override
  final String? description;
  @override
  final DateTime? transactionDate;
  @override
  final String? currency;
  @override
  final double? amount;
  @override
  final double? exchangeRate;
  @override
  final int? shares;
  @override
  final double? pricePerShare;
  @override
  final double? balance;

  factory _$AssetTransaction(
          [void Function(AssetTransactionBuilder)? updates]) =>
      (new AssetTransactionBuilder()..update(updates))._build();

  _$AssetTransaction._(
      {this.transactionId,
      this.createdAt,
      this.assetId,
      this.transactionType,
      this.description,
      this.transactionDate,
      this.currency,
      this.amount,
      this.exchangeRate,
      this.shares,
      this.pricePerShare,
      this.balance})
      : super._();

  @override
  AssetTransaction rebuild(void Function(AssetTransactionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AssetTransactionBuilder toBuilder() =>
      new AssetTransactionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AssetTransaction &&
        transactionId == other.transactionId &&
        createdAt == other.createdAt &&
        assetId == other.assetId &&
        transactionType == other.transactionType &&
        description == other.description &&
        transactionDate == other.transactionDate &&
        currency == other.currency &&
        amount == other.amount &&
        exchangeRate == other.exchangeRate &&
        shares == other.shares &&
        pricePerShare == other.pricePerShare &&
        balance == other.balance;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, transactionId.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, assetId.hashCode);
    _$hash = $jc(_$hash, transactionType.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, transactionDate.hashCode);
    _$hash = $jc(_$hash, currency.hashCode);
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jc(_$hash, exchangeRate.hashCode);
    _$hash = $jc(_$hash, shares.hashCode);
    _$hash = $jc(_$hash, pricePerShare.hashCode);
    _$hash = $jc(_$hash, balance.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AssetTransaction')
          ..add('transactionId', transactionId)
          ..add('createdAt', createdAt)
          ..add('assetId', assetId)
          ..add('transactionType', transactionType)
          ..add('description', description)
          ..add('transactionDate', transactionDate)
          ..add('currency', currency)
          ..add('amount', amount)
          ..add('exchangeRate', exchangeRate)
          ..add('shares', shares)
          ..add('pricePerShare', pricePerShare)
          ..add('balance', balance))
        .toString();
  }
}

class AssetTransactionBuilder
    implements Builder<AssetTransaction, AssetTransactionBuilder> {
  _$AssetTransaction? _$v;

  int? _transactionId;
  int? get transactionId => _$this._transactionId;
  set transactionId(int? transactionId) =>
      _$this._transactionId = transactionId;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  int? _assetId;
  int? get assetId => _$this._assetId;
  set assetId(int? assetId) => _$this._assetId = assetId;

  String? _transactionType;
  String? get transactionType => _$this._transactionType;
  set transactionType(String? transactionType) =>
      _$this._transactionType = transactionType;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  DateTime? _transactionDate;
  DateTime? get transactionDate => _$this._transactionDate;
  set transactionDate(DateTime? transactionDate) =>
      _$this._transactionDate = transactionDate;

  String? _currency;
  String? get currency => _$this._currency;
  set currency(String? currency) => _$this._currency = currency;

  double? _amount;
  double? get amount => _$this._amount;
  set amount(double? amount) => _$this._amount = amount;

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

  double? _balance;
  double? get balance => _$this._balance;
  set balance(double? balance) => _$this._balance = balance;

  AssetTransactionBuilder() {
    AssetTransaction._defaults(this);
  }

  AssetTransactionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _transactionId = $v.transactionId;
      _createdAt = $v.createdAt;
      _assetId = $v.assetId;
      _transactionType = $v.transactionType;
      _description = $v.description;
      _transactionDate = $v.transactionDate;
      _currency = $v.currency;
      _amount = $v.amount;
      _exchangeRate = $v.exchangeRate;
      _shares = $v.shares;
      _pricePerShare = $v.pricePerShare;
      _balance = $v.balance;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AssetTransaction other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AssetTransaction;
  }

  @override
  void update(void Function(AssetTransactionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AssetTransaction build() => _build();

  _$AssetTransaction _build() {
    final _$result = _$v ??
        new _$AssetTransaction._(
            transactionId: transactionId,
            createdAt: createdAt,
            assetId: assetId,
            transactionType: transactionType,
            description: description,
            transactionDate: transactionDate,
            currency: currency,
            amount: amount,
            exchangeRate: exchangeRate,
            shares: shares,
            pricePerShare: pricePerShare,
            balance: balance);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
