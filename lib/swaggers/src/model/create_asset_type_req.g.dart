// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_asset_type_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateAssetTypeReq extends CreateAssetTypeReq {
  @override
  final String? assetTypeName;
  @override
  final bool? isForeignAssetType;

  factory _$CreateAssetTypeReq(
          [void Function(CreateAssetTypeReqBuilder)? updates]) =>
      (new CreateAssetTypeReqBuilder()..update(updates))._build();

  _$CreateAssetTypeReq._({this.assetTypeName, this.isForeignAssetType})
      : super._();

  @override
  CreateAssetTypeReq rebuild(
          void Function(CreateAssetTypeReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateAssetTypeReqBuilder toBuilder() =>
      new CreateAssetTypeReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateAssetTypeReq &&
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
    return (newBuiltValueToStringHelper(r'CreateAssetTypeReq')
          ..add('assetTypeName', assetTypeName)
          ..add('isForeignAssetType', isForeignAssetType))
        .toString();
  }
}

class CreateAssetTypeReqBuilder
    implements Builder<CreateAssetTypeReq, CreateAssetTypeReqBuilder> {
  _$CreateAssetTypeReq? _$v;

  String? _assetTypeName;
  String? get assetTypeName => _$this._assetTypeName;
  set assetTypeName(String? assetTypeName) =>
      _$this._assetTypeName = assetTypeName;

  bool? _isForeignAssetType;
  bool? get isForeignAssetType => _$this._isForeignAssetType;
  set isForeignAssetType(bool? isForeignAssetType) =>
      _$this._isForeignAssetType = isForeignAssetType;

  CreateAssetTypeReqBuilder() {
    CreateAssetTypeReq._defaults(this);
  }

  CreateAssetTypeReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _assetTypeName = $v.assetTypeName;
      _isForeignAssetType = $v.isForeignAssetType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateAssetTypeReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateAssetTypeReq;
  }

  @override
  void update(void Function(CreateAssetTypeReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateAssetTypeReq build() => _build();

  _$CreateAssetTypeReq _build() {
    final _$result = _$v ??
        new _$CreateAssetTypeReq._(
            assetTypeName: assetTypeName,
            isForeignAssetType: isForeignAssetType);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
