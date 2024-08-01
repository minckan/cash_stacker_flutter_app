// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_user_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateUserResponse extends CreateUserResponse {
  @override
  final String? userId;

  factory _$CreateUserResponse(
          [void Function(CreateUserResponseBuilder)? updates]) =>
      (new CreateUserResponseBuilder()..update(updates))._build();

  _$CreateUserResponse._({this.userId}) : super._();

  @override
  CreateUserResponse rebuild(
          void Function(CreateUserResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateUserResponseBuilder toBuilder() =>
      new CreateUserResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateUserResponse && userId == other.userId;
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
    return (newBuiltValueToStringHelper(r'CreateUserResponse')
          ..add('userId', userId))
        .toString();
  }
}

class CreateUserResponseBuilder
    implements Builder<CreateUserResponse, CreateUserResponseBuilder> {
  _$CreateUserResponse? _$v;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  CreateUserResponseBuilder() {
    CreateUserResponse._defaults(this);
  }

  CreateUserResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userId = $v.userId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateUserResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateUserResponse;
  }

  @override
  void update(void Function(CreateUserResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateUserResponse build() => _build();

  _$CreateUserResponse _build() {
    final _$result = _$v ?? new _$CreateUserResponse._(userId: userId);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
