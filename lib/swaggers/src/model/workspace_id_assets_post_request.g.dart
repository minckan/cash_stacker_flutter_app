// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workspace_id_assets_post_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$WorkspaceIdAssetsPostRequest extends WorkspaceIdAssetsPostRequest {
  @override
  final int? assetTypeId;
  @override
  final String? assetName;
  @override
  final double? balance;
  @override
  final String? currencyCode;
  @override
  final AssetTransactionRequest? transactions;

  factory _$WorkspaceIdAssetsPostRequest(
          [void Function(WorkspaceIdAssetsPostRequestBuilder)? updates]) =>
      (new WorkspaceIdAssetsPostRequestBuilder()..update(updates))._build();

  _$WorkspaceIdAssetsPostRequest._(
      {this.assetTypeId,
      this.assetName,
      this.balance,
      this.currencyCode,
      this.transactions})
      : super._();

  @override
  WorkspaceIdAssetsPostRequest rebuild(
          void Function(WorkspaceIdAssetsPostRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WorkspaceIdAssetsPostRequestBuilder toBuilder() =>
      new WorkspaceIdAssetsPostRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WorkspaceIdAssetsPostRequest &&
        assetTypeId == other.assetTypeId &&
        assetName == other.assetName &&
        balance == other.balance &&
        currencyCode == other.currencyCode &&
        transactions == other.transactions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, assetTypeId.hashCode);
    _$hash = $jc(_$hash, assetName.hashCode);
    _$hash = $jc(_$hash, balance.hashCode);
    _$hash = $jc(_$hash, currencyCode.hashCode);
    _$hash = $jc(_$hash, transactions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WorkspaceIdAssetsPostRequest')
          ..add('assetTypeId', assetTypeId)
          ..add('assetName', assetName)
          ..add('balance', balance)
          ..add('currencyCode', currencyCode)
          ..add('transactions', transactions))
        .toString();
  }
}

class WorkspaceIdAssetsPostRequestBuilder
    implements
        Builder<WorkspaceIdAssetsPostRequest,
            WorkspaceIdAssetsPostRequestBuilder> {
  _$WorkspaceIdAssetsPostRequest? _$v;

  int? _assetTypeId;
  int? get assetTypeId => _$this._assetTypeId;
  set assetTypeId(int? assetTypeId) => _$this._assetTypeId = assetTypeId;

  String? _assetName;
  String? get assetName => _$this._assetName;
  set assetName(String? assetName) => _$this._assetName = assetName;

  double? _balance;
  double? get balance => _$this._balance;
  set balance(double? balance) => _$this._balance = balance;

  String? _currencyCode;
  String? get currencyCode => _$this._currencyCode;
  set currencyCode(String? currencyCode) => _$this._currencyCode = currencyCode;

  AssetTransactionRequestBuilder? _transactions;
  AssetTransactionRequestBuilder get transactions =>
      _$this._transactions ??= new AssetTransactionRequestBuilder();
  set transactions(AssetTransactionRequestBuilder? transactions) =>
      _$this._transactions = transactions;

  WorkspaceIdAssetsPostRequestBuilder() {
    WorkspaceIdAssetsPostRequest._defaults(this);
  }

  WorkspaceIdAssetsPostRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _assetTypeId = $v.assetTypeId;
      _assetName = $v.assetName;
      _balance = $v.balance;
      _currencyCode = $v.currencyCode;
      _transactions = $v.transactions?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WorkspaceIdAssetsPostRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WorkspaceIdAssetsPostRequest;
  }

  @override
  void update(void Function(WorkspaceIdAssetsPostRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WorkspaceIdAssetsPostRequest build() => _build();

  _$WorkspaceIdAssetsPostRequest _build() {
    _$WorkspaceIdAssetsPostRequest _$result;
    try {
      _$result = _$v ??
          new _$WorkspaceIdAssetsPostRequest._(
              assetTypeId: assetTypeId,
              assetName: assetName,
              balance: balance,
              currencyCode: currencyCode,
              transactions: _transactions?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'transactions';
        _transactions?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'WorkspaceIdAssetsPostRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
