// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workspace.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Workspace extends Workspace {
  @override
  final String? workspaceId;
  @override
  final String? workspaceName;
  @override
  final DateTime? createdAt;

  factory _$Workspace([void Function(WorkspaceBuilder)? updates]) =>
      (new WorkspaceBuilder()..update(updates))._build();

  _$Workspace._({this.workspaceId, this.workspaceName, this.createdAt})
      : super._();

  @override
  Workspace rebuild(void Function(WorkspaceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WorkspaceBuilder toBuilder() => new WorkspaceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Workspace &&
        workspaceId == other.workspaceId &&
        workspaceName == other.workspaceName &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, workspaceId.hashCode);
    _$hash = $jc(_$hash, workspaceName.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Workspace')
          ..add('workspaceId', workspaceId)
          ..add('workspaceName', workspaceName)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class WorkspaceBuilder implements Builder<Workspace, WorkspaceBuilder> {
  _$Workspace? _$v;

  String? _workspaceId;
  String? get workspaceId => _$this._workspaceId;
  set workspaceId(String? workspaceId) => _$this._workspaceId = workspaceId;

  String? _workspaceName;
  String? get workspaceName => _$this._workspaceName;
  set workspaceName(String? workspaceName) =>
      _$this._workspaceName = workspaceName;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  WorkspaceBuilder() {
    Workspace._defaults(this);
  }

  WorkspaceBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _workspaceId = $v.workspaceId;
      _workspaceName = $v.workspaceName;
      _createdAt = $v.createdAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Workspace other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Workspace;
  }

  @override
  void update(void Function(WorkspaceBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Workspace build() => _build();

  _$Workspace _build() {
    final _$result = _$v ??
        new _$Workspace._(
            workspaceId: workspaceId,
            workspaceName: workspaceName,
            createdAt: createdAt);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
