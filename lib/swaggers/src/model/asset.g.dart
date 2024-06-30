// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Asset extends Asset {
  @override
  final int? assetId;
  @override
  final String? workspaceId;
  @override
  final int? assetTypeId;
  @override
  final String? assetName;
  @override
  final double? balance;
  @override
  final DateTime? createdAt;
  @override
  final String? currencyCode;

  factory _$Asset([void Function(AssetBuilder)? updates]) =>
      (new AssetBuilder()..update(updates))._build();

  _$Asset._(
      {this.assetId,
      this.workspaceId,
      this.assetTypeId,
      this.assetName,
      this.balance,
      this.createdAt,
      this.currencyCode})
      : super._();

  @override
  Asset rebuild(void Function(AssetBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AssetBuilder toBuilder() => new AssetBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Asset &&
        assetId == other.assetId &&
        workspaceId == other.workspaceId &&
        assetTypeId == other.assetTypeId &&
        assetName == other.assetName &&
        balance == other.balance &&
        createdAt == other.createdAt &&
        currencyCode == other.currencyCode;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, assetId.hashCode);
    _$hash = $jc(_$hash, workspaceId.hashCode);
    _$hash = $jc(_$hash, assetTypeId.hashCode);
    _$hash = $jc(_$hash, assetName.hashCode);
    _$hash = $jc(_$hash, balance.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, currencyCode.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Asset')
          ..add('assetId', assetId)
          ..add('workspaceId', workspaceId)
          ..add('assetTypeId', assetTypeId)
          ..add('assetName', assetName)
          ..add('balance', balance)
          ..add('createdAt', createdAt)
          ..add('currencyCode', currencyCode))
        .toString();
  }
}

class AssetBuilder implements Builder<Asset, AssetBuilder> {
  _$Asset? _$v;

  int? _assetId;
  int? get assetId => _$this._assetId;
  set assetId(int? assetId) => _$this._assetId = assetId;

  String? _workspaceId;
  String? get workspaceId => _$this._workspaceId;
  set workspaceId(String? workspaceId) => _$this._workspaceId = workspaceId;

  int? _assetTypeId;
  int? get assetTypeId => _$this._assetTypeId;
  set assetTypeId(int? assetTypeId) => _$this._assetTypeId = assetTypeId;

  String? _assetName;
  String? get assetName => _$this._assetName;
  set assetName(String? assetName) => _$this._assetName = assetName;

  double? _balance;
  double? get balance => _$this._balance;
  set balance(double? balance) => _$this._balance = balance;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  String? _currencyCode;
  String? get currencyCode => _$this._currencyCode;
  set currencyCode(String? currencyCode) => _$this._currencyCode = currencyCode;

  AssetBuilder() {
    Asset._defaults(this);
  }

  AssetBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _assetId = $v.assetId;
      _workspaceId = $v.workspaceId;
      _assetTypeId = $v.assetTypeId;
      _assetName = $v.assetName;
      _balance = $v.balance;
      _createdAt = $v.createdAt;
      _currencyCode = $v.currencyCode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Asset other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Asset;
  }

  @override
  void update(void Function(AssetBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Asset build() => _build();

  _$Asset _build() {
    final _$result = _$v ??
        new _$Asset._(
            assetId: assetId,
            workspaceId: workspaceId,
            assetTypeId: assetTypeId,
            assetName: assetName,
            balance: balance,
            createdAt: createdAt,
            currencyCode: currencyCode);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
