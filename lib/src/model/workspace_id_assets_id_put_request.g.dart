// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workspace_id_assets_id_put_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$WorkspaceIdAssetsIdPutRequest extends WorkspaceIdAssetsIdPutRequest {
  @override
  final String? assetName;

  factory _$WorkspaceIdAssetsIdPutRequest(
          [void Function(WorkspaceIdAssetsIdPutRequestBuilder)? updates]) =>
      (new WorkspaceIdAssetsIdPutRequestBuilder()..update(updates))._build();

  _$WorkspaceIdAssetsIdPutRequest._({this.assetName}) : super._();

  @override
  WorkspaceIdAssetsIdPutRequest rebuild(
          void Function(WorkspaceIdAssetsIdPutRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WorkspaceIdAssetsIdPutRequestBuilder toBuilder() =>
      new WorkspaceIdAssetsIdPutRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WorkspaceIdAssetsIdPutRequest &&
        assetName == other.assetName;
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
    return (newBuiltValueToStringHelper(r'WorkspaceIdAssetsIdPutRequest')
          ..add('assetName', assetName))
        .toString();
  }
}

class WorkspaceIdAssetsIdPutRequestBuilder
    implements
        Builder<WorkspaceIdAssetsIdPutRequest,
            WorkspaceIdAssetsIdPutRequestBuilder> {
  _$WorkspaceIdAssetsIdPutRequest? _$v;

  String? _assetName;
  String? get assetName => _$this._assetName;
  set assetName(String? assetName) => _$this._assetName = assetName;

  WorkspaceIdAssetsIdPutRequestBuilder() {
    WorkspaceIdAssetsIdPutRequest._defaults(this);
  }

  WorkspaceIdAssetsIdPutRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _assetName = $v.assetName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WorkspaceIdAssetsIdPutRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WorkspaceIdAssetsIdPutRequest;
  }

  @override
  void update(void Function(WorkspaceIdAssetsIdPutRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WorkspaceIdAssetsIdPutRequest build() => _build();

  _$WorkspaceIdAssetsIdPutRequest _build() {
    final _$result =
        _$v ?? new _$WorkspaceIdAssetsIdPutRequest._(assetName: assetName);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
