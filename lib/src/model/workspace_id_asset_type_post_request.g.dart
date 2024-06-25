// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workspace_id_asset_type_post_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$WorkspaceIdAssetTypePostRequest
    extends WorkspaceIdAssetTypePostRequest {
  @override
  final String? assetTypeName;

  factory _$WorkspaceIdAssetTypePostRequest(
          [void Function(WorkspaceIdAssetTypePostRequestBuilder)? updates]) =>
      (new WorkspaceIdAssetTypePostRequestBuilder()..update(updates))._build();

  _$WorkspaceIdAssetTypePostRequest._({this.assetTypeName}) : super._();

  @override
  WorkspaceIdAssetTypePostRequest rebuild(
          void Function(WorkspaceIdAssetTypePostRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WorkspaceIdAssetTypePostRequestBuilder toBuilder() =>
      new WorkspaceIdAssetTypePostRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WorkspaceIdAssetTypePostRequest &&
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
    return (newBuiltValueToStringHelper(r'WorkspaceIdAssetTypePostRequest')
          ..add('assetTypeName', assetTypeName))
        .toString();
  }
}

class WorkspaceIdAssetTypePostRequestBuilder
    implements
        Builder<WorkspaceIdAssetTypePostRequest,
            WorkspaceIdAssetTypePostRequestBuilder> {
  _$WorkspaceIdAssetTypePostRequest? _$v;

  String? _assetTypeName;
  String? get assetTypeName => _$this._assetTypeName;
  set assetTypeName(String? assetTypeName) =>
      _$this._assetTypeName = assetTypeName;

  WorkspaceIdAssetTypePostRequestBuilder() {
    WorkspaceIdAssetTypePostRequest._defaults(this);
  }

  WorkspaceIdAssetTypePostRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _assetTypeName = $v.assetTypeName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WorkspaceIdAssetTypePostRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WorkspaceIdAssetTypePostRequest;
  }

  @override
  void update(void Function(WorkspaceIdAssetTypePostRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WorkspaceIdAssetTypePostRequest build() => _build();

  _$WorkspaceIdAssetTypePostRequest _build() {
    final _$result = _$v ??
        new _$WorkspaceIdAssetTypePostRequest._(assetTypeName: assetTypeName);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
