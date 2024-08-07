// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateUserRequest extends UpdateUserRequest {
  @override
  final bool? pushEnable;
  @override
  final bool? darkModeEnable;
  @override
  final String? role;

  factory _$UpdateUserRequest(
          [void Function(UpdateUserRequestBuilder)? updates]) =>
      (new UpdateUserRequestBuilder()..update(updates))._build();

  _$UpdateUserRequest._({this.pushEnable, this.darkModeEnable, this.role})
      : super._();

  @override
  UpdateUserRequest rebuild(void Function(UpdateUserRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateUserRequestBuilder toBuilder() =>
      new UpdateUserRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateUserRequest &&
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
    return (newBuiltValueToStringHelper(r'UpdateUserRequest')
          ..add('pushEnable', pushEnable)
          ..add('darkModeEnable', darkModeEnable)
          ..add('role', role))
        .toString();
  }
}

class UpdateUserRequestBuilder
    implements Builder<UpdateUserRequest, UpdateUserRequestBuilder> {
  _$UpdateUserRequest? _$v;

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

  UpdateUserRequestBuilder() {
    UpdateUserRequest._defaults(this);
  }

  UpdateUserRequestBuilder get _$this {
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
  void replace(UpdateUserRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateUserRequest;
  }

  @override
  void update(void Function(UpdateUserRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateUserRequest build() => _build();

  _$UpdateUserRequest _build() {
    final _$result = _$v ??
        new _$UpdateUserRequest._(
            pushEnable: pushEnable, darkModeEnable: darkModeEnable, role: role);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
