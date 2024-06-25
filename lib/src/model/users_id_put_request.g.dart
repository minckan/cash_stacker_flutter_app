// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_id_put_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UsersIdPutRequest extends UsersIdPutRequest {
  @override
  final bool? pushEnable;
  @override
  final bool? darkModeEnable;
  @override
  final String? role;

  factory _$UsersIdPutRequest(
          [void Function(UsersIdPutRequestBuilder)? updates]) =>
      (new UsersIdPutRequestBuilder()..update(updates))._build();

  _$UsersIdPutRequest._({this.pushEnable, this.darkModeEnable, this.role})
      : super._();

  @override
  UsersIdPutRequest rebuild(void Function(UsersIdPutRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UsersIdPutRequestBuilder toBuilder() =>
      new UsersIdPutRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UsersIdPutRequest &&
        pushEnable == other.pushEnable &&
        darkModeEnable == other.darkModeEnable &&
        role == other.role;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, pushEnable.hashCode);
    _$hash = $jc(_$hash, darkModeEnable.hashCode);
    _$hash = $jc(_$hash, role.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UsersIdPutRequest')
          ..add('pushEnable', pushEnable)
          ..add('darkModeEnable', darkModeEnable)
          ..add('role', role))
        .toString();
  }
}

class UsersIdPutRequestBuilder
    implements Builder<UsersIdPutRequest, UsersIdPutRequestBuilder> {
  _$UsersIdPutRequest? _$v;

  bool? _pushEnable;
  bool? get pushEnable => _$this._pushEnable;
  set pushEnable(bool? pushEnable) => _$this._pushEnable = pushEnable;

  bool? _darkModeEnable;
  bool? get darkModeEnable => _$this._darkModeEnable;
  set darkModeEnable(bool? darkModeEnable) =>
      _$this._darkModeEnable = darkModeEnable;

  String? _role;
  String? get role => _$this._role;
  set role(String? role) => _$this._role = role;

  UsersIdPutRequestBuilder() {
    UsersIdPutRequest._defaults(this);
  }

  UsersIdPutRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _pushEnable = $v.pushEnable;
      _darkModeEnable = $v.darkModeEnable;
      _role = $v.role;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UsersIdPutRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UsersIdPutRequest;
  }

  @override
  void update(void Function(UsersIdPutRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UsersIdPutRequest build() => _build();

  _$UsersIdPutRequest _build() {
    final _$result = _$v ??
        new _$UsersIdPutRequest._(
            pushEnable: pushEnable, darkModeEnable: darkModeEnable, role: role);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
