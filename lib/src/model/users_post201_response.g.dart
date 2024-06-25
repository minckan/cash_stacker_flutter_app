// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_post201_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UsersPost201Response extends UsersPost201Response {
  @override
  final String? userId;

  factory _$UsersPost201Response(
          [void Function(UsersPost201ResponseBuilder)? updates]) =>
      (new UsersPost201ResponseBuilder()..update(updates))._build();

  _$UsersPost201Response._({this.userId}) : super._();

  @override
  UsersPost201Response rebuild(
          void Function(UsersPost201ResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UsersPost201ResponseBuilder toBuilder() =>
      new UsersPost201ResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UsersPost201Response && userId == other.userId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UsersPost201Response')
          ..add('userId', userId))
        .toString();
  }
}

class UsersPost201ResponseBuilder
    implements Builder<UsersPost201Response, UsersPost201ResponseBuilder> {
  _$UsersPost201Response? _$v;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  UsersPost201ResponseBuilder() {
    UsersPost201Response._defaults(this);
  }

  UsersPost201ResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userId = $v.userId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UsersPost201Response other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UsersPost201Response;
  }

  @override
  void update(void Function(UsersPost201ResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UsersPost201Response build() => _build();

  _$UsersPost201Response _build() {
    final _$result = _$v ?? new _$UsersPost201Response._(userId: userId);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
