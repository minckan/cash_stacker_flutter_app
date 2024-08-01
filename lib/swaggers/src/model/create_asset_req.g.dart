// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_asset_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateAssetReq extends CreateAssetReq {
  @override
  final int? assetTypeId;
  @override
  final String? assetName;
  @override
  final String? currencyCode;
  @override
  final AssetTransactionRequest? transactions;

  factory _$CreateAssetReq([void Function(CreateAssetReqBuilder)? updates]) =>
      (new CreateAssetReqBuilder()..update(updates))._build();

  _$CreateAssetReq._(
      {this.assetTypeId, this.assetName, this.currencyCode, this.transactions})
      : super._();

  @override
  CreateAssetReq rebuild(void Function(CreateAssetReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateAssetReqBuilder toBuilder() =>
      new CreateAssetReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateAssetReq &&
        assetTypeId == other.assetTypeId &&
        assetName == other.assetName &&
        currencyCode == other.currencyCode &&
        transactions == other.transactions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, assetTypeId.hashCode);
    _$hash = $jc(_$hash, assetName.hashCode);
    _$hash = $jc(_$hash, currencyCode.hashCode);
    _$hash = $jc(_$hash, transactions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateAssetReq')
          ..add('assetTypeId', assetTypeId)
          ..add('assetName', assetName)
          ..add('currencyCode', currencyCode)
          ..add('transactions', transactions))
        .toString();
  }
}

class CreateAssetReqBuilder
    implements Builder<CreateAssetReq, CreateAssetReqBuilder> {
  _$CreateAssetReq? _$v;

  int? _assetTypeId;
  int? get assetTypeId => _$this._assetTypeId;
  set assetTypeId(int? assetTypeId) => _$this._assetTypeId = assetTypeId;

  String? _assetName;
  String? get assetName => _$this._assetName;
  set assetName(String? assetName) => _$this._assetName = assetName;

  String? _currencyCode;
  String? get currencyCode => _$this._currencyCode;
  set currencyCode(String? currencyCode) => _$this._currencyCode = currencyCode;

  AssetTransactionRequestBuilder? _transactions;
  AssetTransactionRequestBuilder get transactions =>
      _$this._transactions ??= new AssetTransactionRequestBuilder();
  set transactions(AssetTransactionRequestBuilder? transactions) =>
      _$this._transactions = transactions;

  CreateAssetReqBuilder() {
    CreateAssetReq._defaults(this);
  }

  CreateAssetReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _assetTypeId = $v.assetTypeId;
      _assetName = $v.assetName;
      _currencyCode = $v.currencyCode;
      _transactions = $v.transactions?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateAssetReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateAssetReq;
  }

  @override
  void update(void Function(CreateAssetReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateAssetReq build() => _build();

  _$CreateAssetReq _build() {
    _$CreateAssetReq _$result;
    try {
      _$result = _$v ??
          new _$CreateAssetReq._(
              assetTypeId: assetTypeId,
              assetName: assetName,
              currencyCode: currencyCode,
              transactions: _transactions?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'transactions';
        _transactions?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CreateAssetReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
