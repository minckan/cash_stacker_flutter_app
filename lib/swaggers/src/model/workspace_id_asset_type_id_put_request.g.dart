// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workspace_id_asset_type_id_put_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$WorkspaceIdAssetTypeIdPutRequest
    extends WorkspaceIdAssetTypeIdPutRequest {
  @override
  final String? assetTypeName;

  factory _$WorkspaceIdAssetTypeIdPutRequest(
          [void Function(WorkspaceIdAssetTypeIdPutRequestBuilder)? updates]) =>
      (new WorkspaceIdAssetTypeIdPutRequestBuilder()..update(updates))._build();

  _$WorkspaceIdAssetTypeIdPutRequest._({this.assetTypeName}) : super._();

  @override
  WorkspaceIdAssetTypeIdPutRequest rebuild(
          void Function(WorkspaceIdAssetTypeIdPutRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WorkspaceIdAssetTypeIdPutRequestBuilder toBuilder() =>
      new WorkspaceIdAssetTypeIdPutRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WorkspaceIdAssetTypeIdPutRequest &&
        assetTypeName == other.assetTypeName;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, assetTypeName.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WorkspaceIdAssetTypeIdPutRequest')
          ..add('assetTypeName', assetTypeName))
        .toString();
  }
}

class WorkspaceIdAssetTypeIdPutRequestBuilder
    implements
        Builder<WorkspaceIdAssetTypeIdPutRequest,
            WorkspaceIdAssetTypeIdPutRequestBuilder> {
  _$WorkspaceIdAssetTypeIdPutRequest? _$v;

  String? _assetTypeName;
  String? get assetTypeName => _$this._assetTypeName;
  set assetTypeName(String? assetTypeName) =>
      _$this._assetTypeName = assetTypeName;

  WorkspaceIdAssetTypeIdPutRequestBuilder() {
    WorkspaceIdAssetTypeIdPutRequest._defaults(this);
  }

  WorkspaceIdAssetTypeIdPutRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _assetTypeName = $v.assetTypeName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WorkspaceIdAssetTypeIdPutRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WorkspaceIdAssetTypeIdPutRequest;
  }

  @override
  void update(void Function(WorkspaceIdAssetTypeIdPutRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WorkspaceIdAssetTypeIdPutRequest build() => _build();

  _$WorkspaceIdAssetTypeIdPutRequest _build() {
    final _$result = _$v ??
        new _$WorkspaceIdAssetTypeIdPutRequest._(assetTypeName: assetTypeName);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
