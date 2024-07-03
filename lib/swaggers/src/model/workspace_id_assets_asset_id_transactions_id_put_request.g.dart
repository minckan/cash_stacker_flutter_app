// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workspace_id_assets_asset_id_transactions_id_put_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$WorkspaceIdAssetsAssetIdTransactionsIdPutRequest
    extends WorkspaceIdAssetsAssetIdTransactionsIdPutRequest {
  @override
  final num? amount;
  @override
  final String? transactionType;
  @override
  final String? description;
  @override
  final DateTime? transactionDate;
  @override
  final num? exchangeRate;
  @override
  final num? shares;
  @override
  final num? pricePerShare;

  factory _$WorkspaceIdAssetsAssetIdTransactionsIdPutRequest(
          [void Function(
                  WorkspaceIdAssetsAssetIdTransactionsIdPutRequestBuilder)?
              updates]) =>
      (new WorkspaceIdAssetsAssetIdTransactionsIdPutRequestBuilder()
            ..update(updates))
          ._build();

  _$WorkspaceIdAssetsAssetIdTransactionsIdPutRequest._(
      {this.amount,
      this.transactionType,
      this.description,
      this.transactionDate,
      this.exchangeRate,
      this.shares,
      this.pricePerShare})
      : super._();

  @override
  WorkspaceIdAssetsAssetIdTransactionsIdPutRequest rebuild(
          void Function(WorkspaceIdAssetsAssetIdTransactionsIdPutRequestBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WorkspaceIdAssetsAssetIdTransactionsIdPutRequestBuilder toBuilder() =>
      new WorkspaceIdAssetsAssetIdTransactionsIdPutRequestBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WorkspaceIdAssetsAssetIdTransactionsIdPutRequest &&
        amount == other.amount &&
        transactionType == other.transactionType &&
        description == other.description &&
        transactionDate == other.transactionDate &&
        exchangeRate == other.exchangeRate &&
        shares == other.shares &&
        pricePerShare == other.pricePerShare;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jc(_$hash, transactionType.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, transactionDate.hashCode);
    _$hash = $jc(_$hash, exchangeRate.hashCode);
    _$hash = $jc(_$hash, shares.hashCode);
    _$hash = $jc(_$hash, pricePerShare.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'WorkspaceIdAssetsAssetIdTransactionsIdPutRequest')
          ..add('amount', amount)
          ..add('transactionType', transactionType)
          ..add('description', description)
          ..add('transactionDate', transactionDate)
          ..add('exchangeRate', exchangeRate)
          ..add('shares', shares)
          ..add('pricePerShare', pricePerShare))
        .toString();
  }
}

class WorkspaceIdAssetsAssetIdTransactionsIdPutRequestBuilder
    implements
        Builder<WorkspaceIdAssetsAssetIdTransactionsIdPutRequest,
            WorkspaceIdAssetsAssetIdTransactionsIdPutRequestBuilder> {
  _$WorkspaceIdAssetsAssetIdTransactionsIdPutRequest? _$v;

  num? _amount;
  num? get amount => _$this._amount;
  set amount(num? amount) => _$this._amount = amount;

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

  num? _exchangeRate;
  num? get exchangeRate => _$this._exchangeRate;
  set exchangeRate(num? exchangeRate) => _$this._exchangeRate = exchangeRate;

  num? _shares;
  num? get shares => _$this._shares;
  set shares(num? shares) => _$this._shares = shares;

  num? _pricePerShare;
  num? get pricePerShare => _$this._pricePerShare;
  set pricePerShare(num? pricePerShare) =>
      _$this._pricePerShare = pricePerShare;

  WorkspaceIdAssetsAssetIdTransactionsIdPutRequestBuilder() {
    WorkspaceIdAssetsAssetIdTransactionsIdPutRequest._defaults(this);
  }

  WorkspaceIdAssetsAssetIdTransactionsIdPutRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _amount = $v.amount;
      _transactionType = $v.transactionType;
      _description = $v.description;
      _transactionDate = $v.transactionDate;
      _exchangeRate = $v.exchangeRate;
      _shares = $v.shares;
      _pricePerShare = $v.pricePerShare;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WorkspaceIdAssetsAssetIdTransactionsIdPutRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WorkspaceIdAssetsAssetIdTransactionsIdPutRequest;
  }

  @override
  void update(
      void Function(WorkspaceIdAssetsAssetIdTransactionsIdPutRequestBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  WorkspaceIdAssetsAssetIdTransactionsIdPutRequest build() => _build();

  _$WorkspaceIdAssetsAssetIdTransactionsIdPutRequest _build() {
    final _$result = _$v ??
        new _$WorkspaceIdAssetsAssetIdTransactionsIdPutRequest._(
            amount: amount,
            transactionType: transactionType,
            description: description,
            transactionDate: transactionDate,
            exchangeRate: exchangeRate,
            shares: shares,
            pricePerShare: pricePerShare);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
