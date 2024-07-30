// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_detail_response_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AssetDetailResponseType extends AssetDetailResponseType {
  @override
  final int? assetId;
  @override
  final bool? isKrwCashAsset;
  @override
  final String? currencyCode;
  @override
  final num? total;
  @override
  final int? assetTypeId;
  @override
  final BuiltList<AssetTransactionResponseType>? transaction;

  factory _$AssetDetailResponseType(
          [void Function(AssetDetailResponseTypeBuilder)? updates]) =>
      (new AssetDetailResponseTypeBuilder()..update(updates))._build();

  _$AssetDetailResponseType._(
      {this.assetId,
      this.isKrwCashAsset,
      this.currencyCode,
      this.total,
      this.assetTypeId,
      this.transaction})
      : super._();

  @override
  AssetDetailResponseType rebuild(
          void Function(AssetDetailResponseTypeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AssetDetailResponseTypeBuilder toBuilder() =>
      new AssetDetailResponseTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AssetDetailResponseType &&
        assetId == other.assetId &&
        isKrwCashAsset == other.isKrwCashAsset &&
        currencyCode == other.currencyCode &&
        total == other.total &&
        assetTypeId == other.assetTypeId &&
        transaction == other.transaction;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, assetId.hashCode);
    _$hash = $jc(_$hash, isKrwCashAsset.hashCode);
    _$hash = $jc(_$hash, currencyCode.hashCode);
    _$hash = $jc(_$hash, total.hashCode);
    _$hash = $jc(_$hash, assetTypeId.hashCode);
    _$hash = $jc(_$hash, transaction.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AssetDetailResponseType')
          ..add('assetId', assetId)
          ..add('isKrwCashAsset', isKrwCashAsset)
          ..add('currencyCode', currencyCode)
          ..add('total', total)
          ..add('assetTypeId', assetTypeId)
          ..add('transaction', transaction))
        .toString();
  }
}

class AssetDetailResponseTypeBuilder
    implements
        Builder<AssetDetailResponseType, AssetDetailResponseTypeBuilder> {
  _$AssetDetailResponseType? _$v;

  int? _assetId;
  int? get assetId => _$this._assetId;
  set assetId(int? assetId) => _$this._assetId = assetId;

  bool? _isKrwCashAsset;
  bool? get isKrwCashAsset => _$this._isKrwCashAsset;
  set isKrwCashAsset(bool? isKrwCashAsset) =>
      _$this._isKrwCashAsset = isKrwCashAsset;

  String? _currencyCode;
  String? get currencyCode => _$this._currencyCode;
  set currencyCode(String? currencyCode) => _$this._currencyCode = currencyCode;

  num? _total;
  num? get total => _$this._total;
  set total(num? total) => _$this._total = total;

  int? _assetTypeId;
  int? get assetTypeId => _$this._assetTypeId;
  set assetTypeId(int? assetTypeId) => _$this._assetTypeId = assetTypeId;

  ListBuilder<AssetTransactionResponseType>? _transaction;
  ListBuilder<AssetTransactionResponseType> get transaction =>
      _$this._transaction ??= new ListBuilder<AssetTransactionResponseType>();
  set transaction(ListBuilder<AssetTransactionResponseType>? transaction) =>
      _$this._transaction = transaction;

  AssetDetailResponseTypeBuilder() {
    AssetDetailResponseType._defaults(this);
  }

  AssetDetailResponseTypeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _assetId = $v.assetId;
      _isKrwCashAsset = $v.isKrwCashAsset;
      _currencyCode = $v.currencyCode;
      _total = $v.total;
      _assetTypeId = $v.assetTypeId;
      _transaction = $v.transaction?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AssetDetailResponseType other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AssetDetailResponseType;
  }

  @override
  void update(void Function(AssetDetailResponseTypeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AssetDetailResponseType build() => _build();

  _$AssetDetailResponseType _build() {
    _$AssetDetailResponseType _$result;
    try {
      _$result = _$v ??
          new _$AssetDetailResponseType._(
              assetId: assetId,
              isKrwCashAsset: isKrwCashAsset,
              currencyCode: currencyCode,
              total: total,
              assetTypeId: assetTypeId,
              transaction: _transaction?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'transaction';
        _transaction?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AssetDetailResponseType', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
