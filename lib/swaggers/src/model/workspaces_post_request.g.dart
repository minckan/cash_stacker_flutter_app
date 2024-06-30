// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workspaces_post_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$WorkspacesPostRequest extends WorkspacesPostRequest {
  @override
  final String? workspaceName;
  @override
  final String? workspaceId;

  factory _$WorkspacesPostRequest(
          [void Function(WorkspacesPostRequestBuilder)? updates]) =>
      (new WorkspacesPostRequestBuilder()..update(updates))._build();

  _$WorkspacesPostRequest._({this.workspaceName, this.workspaceId}) : super._();

  @override
  WorkspacesPostRequest rebuild(
          void Function(WorkspacesPostRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WorkspacesPostRequestBuilder toBuilder() =>
      new WorkspacesPostRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WorkspacesPostRequest &&
        workspaceName == other.workspaceName &&
        workspaceId == other.workspaceId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, workspaceName.hashCode);
    _$hash = $jc(_$hash, workspaceId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WorkspacesPostRequest')
          ..add('workspaceName', workspaceName)
          ..add('workspaceId', workspaceId))
        .toString();
  }
}

class WorkspacesPostRequestBuilder
    implements Builder<WorkspacesPostRequest, WorkspacesPostRequestBuilder> {
  _$WorkspacesPostRequest? _$v;

  String? _workspaceName;
  String? get workspaceName => _$this._workspaceName;
  set workspaceName(String? workspaceName) =>
      _$this._workspaceName = workspaceName;

  String? _workspaceId;
  String? get workspaceId => _$this._workspaceId;
  set workspaceId(String? workspaceId) => _$this._workspaceId = workspaceId;

  WorkspacesPostRequestBuilder() {
    WorkspacesPostRequest._defaults(this);
  }

  WorkspacesPostRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _workspaceName = $v.workspaceName;
      _workspaceId = $v.workspaceId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WorkspacesPostRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WorkspacesPostRequest;
  }

  @override
  void update(void Function(WorkspacesPostRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WorkspacesPostRequest build() => _build();

  _$WorkspacesPostRequest _build() {
    final _$result = _$v ??
        new _$WorkspacesPostRequest._(
            workspaceName: workspaceName, workspaceId: workspaceId);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
