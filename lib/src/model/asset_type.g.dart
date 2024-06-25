// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AssetType extends AssetType {
  @override
  final int? assetTypeId;
  @override
  final String? workspaceId;
  @override
  final String? assetTypeName;
  @override
  final bool? isDefault;

  factory _$AssetType([void Function(AssetTypeBuilder)? updates]) =>
      (new AssetTypeBuilder()..update(updates))._build();

  _$AssetType._(
      {this.assetTypeId, this.workspaceId, this.assetTypeName, this.isDefault})
      : super._();

  @override
  AssetType rebuild(void Function(AssetTypeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AssetTypeBuilder toBuilder() => new AssetTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AssetType &&
        assetTypeId == other.assetTypeId &&
        workspaceId == other.workspaceId &&
        assetTypeName == other.assetTypeName &&
        isDefault == other.isDefault;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, assetTypeId.hashCode);
    _$hash = $jc(_$hash, workspaceId.hashCode);
    _$hash = $jc(_$hash, assetTypeName.hashCode);
    _$hash = $jc(_$hash, isDefault.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AssetType')
          ..add('assetTypeId', assetTypeId)
          ..add('workspaceId', workspaceId)
          ..add('assetTypeName', assetTypeName)
          ..add('isDefault', isDefault))
        .toString();
  }
}

class AssetTypeBuilder implements Builder<AssetType, AssetTypeBuilder> {
  _$AssetType? _$v;

  int? _assetTypeId;
  int? get assetTypeId => _$this._assetTypeId;
  set assetTypeId(int? assetTypeId) => _$this._assetTypeId = assetTypeId;

  String? _workspaceId;
  String? get workspaceId => _$this._workspaceId;
  set workspaceId(String? workspaceId) => _$this._workspaceId = workspaceId;

  String? _assetTypeName;
  String? get assetTypeName => _$this._assetTypeName;
  set assetTypeName(String? assetTypeName) =>
      _$this._assetTypeName = assetTypeName;

  bool? _isDefault;
  bool? get isDefault => _$this._isDefault;
  set isDefault(bool? isDefault) => _$this._isDefault = isDefault;

  AssetTypeBuilder() {
    AssetType._defaults(this);
  }

  AssetTypeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _assetTypeId = $v.assetTypeId;
      _workspaceId = $v.workspaceId;
      _assetTypeName = $v.assetTypeName;
      _isDefault = $v.isDefault;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AssetType other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AssetType;
  }

  @override
  void update(void Function(AssetTypeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AssetType build() => _build();

  _$AssetType _build() {
    final _$result = _$v ??
        new _$AssetType._(
            assetTypeId: assetTypeId,
            workspaceId: workspaceId,
            assetTypeName: assetTypeName,
            isDefault: isDefault);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
