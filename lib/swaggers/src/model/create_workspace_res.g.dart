// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_workspace_res.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateWorkspaceRes extends CreateWorkspaceRes {
  @override
  final String? workspaceId;

  factory _$CreateWorkspaceRes(
          [void Function(CreateWorkspaceResBuilder)? updates]) =>
      (new CreateWorkspaceResBuilder()..update(updates))._build();

  _$CreateWorkspaceRes._({this.workspaceId}) : super._();

  @override
  CreateWorkspaceRes rebuild(
          void Function(CreateWorkspaceResBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateWorkspaceResBuilder toBuilder() =>
      new CreateWorkspaceResBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateWorkspaceRes && workspaceId == other.workspaceId;
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
    return (newBuiltValueToStringHelper(r'CreateWorkspaceRes')
          ..add('workspaceId', workspaceId))
        .toString();
  }
}

class CreateWorkspaceResBuilder
    implements Builder<CreateWorkspaceRes, CreateWorkspaceResBuilder> {
  _$CreateWorkspaceRes? _$v;

  String? _workspaceId;
  String? get workspaceId => _$this._workspaceId;
  set workspaceId(String? workspaceId) => _$this._workspaceId = workspaceId;

  CreateWorkspaceResBuilder() {
    CreateWorkspaceRes._defaults(this);
  }

  CreateWorkspaceResBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _workspaceId = $v.workspaceId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateWorkspaceRes other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateWorkspaceRes;
  }

  @override
  void update(void Function(CreateWorkspaceResBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateWorkspaceRes build() => _build();

  _$CreateWorkspaceRes _build() {
    final _$result =
        _$v ?? new _$CreateWorkspaceRes._(workspaceId: workspaceId);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
