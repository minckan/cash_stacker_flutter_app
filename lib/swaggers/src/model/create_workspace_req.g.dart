// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_workspace_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateWorkspaceReq extends CreateWorkspaceReq {
  @override
  final String? workspaceName;
  @override
  final String? workspaceId;

  factory _$CreateWorkspaceReq(
          [void Function(CreateWorkspaceReqBuilder)? updates]) =>
      (new CreateWorkspaceReqBuilder()..update(updates))._build();

  _$CreateWorkspaceReq._({this.workspaceName, this.workspaceId}) : super._();

  @override
  CreateWorkspaceReq rebuild(
          void Function(CreateWorkspaceReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateWorkspaceReqBuilder toBuilder() =>
      new CreateWorkspaceReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateWorkspaceReq &&
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
    return (newBuiltValueToStringHelper(r'CreateWorkspaceReq')
          ..add('workspaceName', workspaceName)
          ..add('workspaceId', workspaceId))
        .toString();
  }
}

class CreateWorkspaceReqBuilder
    implements Builder<CreateWorkspaceReq, CreateWorkspaceReqBuilder> {
  _$CreateWorkspaceReq? _$v;

  String? _workspaceName;
  String? get workspaceName => _$this._workspaceName;
  set workspaceName(String? workspaceName) =>
      _$this._workspaceName = workspaceName;

  String? _workspaceId;
  String? get workspaceId => _$this._workspaceId;
  set workspaceId(String? workspaceId) => _$this._workspaceId = workspaceId;

  CreateWorkspaceReqBuilder() {
    CreateWorkspaceReq._defaults(this);
  }

  CreateWorkspaceReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _workspaceName = $v.workspaceName;
      _workspaceId = $v.workspaceId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateWorkspaceReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateWorkspaceReq;
  }

  @override
  void update(void Function(CreateWorkspaceReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateWorkspaceReq build() => _build();

  _$CreateWorkspaceReq _build() {
    final _$result = _$v ??
        new _$CreateWorkspaceReq._(
            workspaceName: workspaceName, workspaceId: workspaceId);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
