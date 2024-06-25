// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_to_transaction.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AssetToTransaction extends AssetToTransaction {
  @override
  final int? assetId;
  @override
  final int? transactionId;

  factory _$AssetToTransaction(
          [void Function(AssetToTransactionBuilder)? updates]) =>
      (new AssetToTransactionBuilder()..update(updates))._build();

  _$AssetToTransaction._({this.assetId, this.transactionId}) : super._();

  @override
  AssetToTransaction rebuild(
          void Function(AssetToTransactionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AssetToTransactionBuilder toBuilder() =>
      new AssetToTransactionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AssetToTransaction &&
        assetId == other.assetId &&
        transactionId == other.transactionId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, assetId.hashCode);
    _$hash = $jc(_$hash, transactionId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AssetToTransaction')
          ..add('assetId', assetId)
          ..add('transactionId', transactionId))
        .toString();
  }
}

class AssetToTransactionBuilder
    implements Builder<AssetToTransaction, AssetToTransactionBuilder> {
  _$AssetToTransaction? _$v;

  int? _assetId;
  int? get assetId => _$this._assetId;
  set assetId(int? assetId) => _$this._assetId = assetId;

  int? _transactionId;
  int? get transactionId => _$this._transactionId;
  set transactionId(int? transactionId) =>
      _$this._transactionId = transactionId;

  AssetToTransactionBuilder() {
    AssetToTransaction._defaults(this);
  }

  AssetToTransactionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _assetId = $v.assetId;
      _transactionId = $v.transactionId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AssetToTransaction other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AssetToTransaction;
  }

  @override
  void update(void Function(AssetToTransactionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AssetToTransaction build() => _build();

  _$AssetToTransaction _build() {
    final _$result = _$v ??
        new _$AssetToTransaction._(
            assetId: assetId, transactionId: transactionId);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
