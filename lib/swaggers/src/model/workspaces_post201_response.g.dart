// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workspaces_post201_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$WorkspacesPost201Response extends WorkspacesPost201Response {
  @override
  final String? workspaceId;

  factory _$WorkspacesPost201Response(
          [void Function(WorkspacesPost201ResponseBuilder)? updates]) =>
      (new WorkspacesPost201ResponseBuilder()..update(updates))._build();

  _$WorkspacesPost201Response._({this.workspaceId}) : super._();

  @override
  WorkspacesPost201Response rebuild(
          void Function(WorkspacesPost201ResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WorkspacesPost201ResponseBuilder toBuilder() =>
      new WorkspacesPost201ResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WorkspacesPost201Response &&
        workspaceId == other.workspaceId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, workspaceId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WorkspacesPost201Response')
          ..add('workspaceId', workspaceId))
        .toString();
  }
}

class WorkspacesPost201ResponseBuilder
    implements
        Builder<WorkspacesPost201Response, WorkspacesPost201ResponseBuilder> {
  _$WorkspacesPost201Response? _$v;

  String? _workspaceId;
  String? get workspaceId => _$this._workspaceId;
  set workspaceId(String? workspaceId) => _$this._workspaceId = workspaceId;

  WorkspacesPost201ResponseBuilder() {
    WorkspacesPost201Response._defaults(this);
  }

  WorkspacesPost201ResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _workspaceId = $v.workspaceId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WorkspacesPost201Response other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WorkspacesPost201Response;
  }

  @override
  void update(void Function(WorkspacesPost201ResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WorkspacesPost201Response build() => _build();

  _$WorkspacesPost201Response _build() {
    final _$result =
        _$v ?? new _$WorkspacesPost201Response._(workspaceId: workspaceId);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
