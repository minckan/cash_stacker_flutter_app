// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_asset_type_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateAssetTypeReq extends UpdateAssetTypeReq {
  @override
  final String? assetTypeName;
  @override
  final bool? isForeignAssetType;

  factory _$UpdateAssetTypeReq(
          [void Function(UpdateAssetTypeReqBuilder)? updates]) =>
      (new UpdateAssetTypeReqBuilder()..update(updates))._build();

  _$UpdateAssetTypeReq._({this.assetTypeName, this.isForeignAssetType})
      : super._();

  @override
  UpdateAssetTypeReq rebuild(
          void Function(UpdateAssetTypeReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateAssetTypeReqBuilder toBuilder() =>
      new UpdateAssetTypeReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateAssetTypeReq &&
        assetTypeName == other.assetTypeName &&
        isForeignAssetType == other.isForeignAssetType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, assetTypeName.hashCode);
    _$hash = $jc(_$hash, isForeignAssetType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpdateAssetTypeReq')
          ..add('assetTypeName', assetTypeName)
          ..add('isForeignAssetType', isForeignAssetType))
        .toString();
  }
}

class UpdateAssetTypeReqBuilder
    implements Builder<UpdateAssetTypeReq, UpdateAssetTypeReqBuilder> {
  _$UpdateAssetTypeReq? _$v;

  String? _assetTypeName;
  String? get assetTypeName => _$this._assetTypeName;
  set assetTypeName(String? assetTypeName) =>
      _$this._assetTypeName = assetTypeName;

  bool? _isForeignAssetType;
  bool? get isForeignAssetType => _$this._isForeignAssetType;
  set isForeignAssetType(bool? isForeignAssetType) =>
      _$this._isForeignAssetType = isForeignAssetType;

  UpdateAssetTypeReqBuilder() {
    UpdateAssetTypeReq._defaults(this);
  }

  UpdateAssetTypeReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _assetTypeName = $v.assetTypeName;
      _isForeignAssetType = $v.isForeignAssetType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateAssetTypeReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateAssetTypeReq;
  }

  @override
  void update(void Function(UpdateAssetTypeReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateAssetTypeReq build() => _build();

  _$UpdateAssetTypeReq _build() {
    final _$result = _$v ??
        new _$UpdateAssetTypeReq._(
            assetTypeName: assetTypeName,
            isForeignAssetType: isForeignAssetType);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
