// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_asset_res.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateAssetRes extends UpdateAssetRes {
  @override
  final String? assetName;

  factory _$UpdateAssetRes([void Function(UpdateAssetResBuilder)? updates]) =>
      (new UpdateAssetResBuilder()..update(updates))._build();

  _$UpdateAssetRes._({this.assetName}) : super._();

  @override
  UpdateAssetRes rebuild(void Function(UpdateAssetResBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateAssetResBuilder toBuilder() =>
      new UpdateAssetResBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateAssetRes && assetName == other.assetName;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, assetName.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpdateAssetRes')
          ..add('assetName', assetName))
        .toString();
  }
}

class UpdateAssetResBuilder
    implements Builder<UpdateAssetRes, UpdateAssetResBuilder> {
  _$UpdateAssetRes? _$v;

  String? _assetName;
  String? get assetName => _$this._assetName;
  set assetName(String? assetName) => _$this._assetName = assetName;

  UpdateAssetResBuilder() {
    UpdateAssetRes._defaults(this);
  }

  UpdateAssetResBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _assetName = $v.assetName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateAssetRes other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateAssetRes;
  }

  @override
  void update(void Function(UpdateAssetResBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateAssetRes build() => _build();

  _$UpdateAssetRes _build() {
    final _$result = _$v ?? new _$UpdateAssetRes._(assetName: assetName);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
