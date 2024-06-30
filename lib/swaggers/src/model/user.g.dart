// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$User extends User {
  @override
  final String? userId;
  @override
  final String? workspaceId;
  @override
  final String? username;
  @override
  final String? email;
  @override
  final DateTime? createdAt;
  @override
  final String? loginType;
  @override
  final String? role;
  @override
  final DateTime? joinedAt;
  @override
  final bool? pushEnable;
  @override
  final bool? darkModeEnable;
  @override
  final String? profileImage;
  @override
  final String? pushId;
  @override
  final String? platformType;

  factory _$User([void Function(UserBuilder)? updates]) =>
      (new UserBuilder()..update(updates))._build();

  _$User._(
      {this.userId,
      this.workspaceId,
      this.username,
      this.email,
      this.createdAt,
      this.loginType,
      this.role,
      this.joinedAt,
      this.pushEnable,
      this.darkModeEnable,
      this.profileImage,
      this.pushId,
      this.platformType})
      : super._();

  @override
  User rebuild(void Function(UserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserBuilder toBuilder() => new UserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User &&
        userId == other.userId &&
        workspaceId == other.workspaceId &&
        username == other.username &&
        email == other.email &&
        createdAt == other.createdAt &&
        loginType == other.loginType &&
        role == other.role &&
        joinedAt == other.joinedAt &&
        pushEnable == other.pushEnable &&
        darkModeEnable == other.darkModeEnable &&
        profileImage == other.profileImage &&
        pushId == other.pushId &&
        platformType == other.platformType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, workspaceId.hashCode);
    _$hash = $jc(_$hash, username.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, loginType.hashCode);
    _$hash = $jc(_$hash, role.hashCode);
    _$hash = $jc(_$hash, joinedAt.hashCode);
    _$hash = $jc(_$hash, pushEnable.hashCode);
    _$hash = $jc(_$hash, darkModeEnable.hashCode);
    _$hash = $jc(_$hash, profileImage.hashCode);
    _$hash = $jc(_$hash, pushId.hashCode);
    _$hash = $jc(_$hash, platformType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'User')
          ..add('userId', userId)
          ..add('workspaceId', workspaceId)
          ..add('username', username)
          ..add('email', email)
          ..add('createdAt', createdAt)
          ..add('loginType', loginType)
          ..add('role', role)
          ..add('joinedAt', joinedAt)
          ..add('pushEnable', pushEnable)
          ..add('darkModeEnable', darkModeEnable)
          ..add('profileImage', profileImage)
          ..add('pushId', pushId)
          ..add('platformType', platformType))
        .toString();
  }
}

class UserBuilder implements Builder<User, UserBuilder> {
  _$User? _$v;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  String? _workspaceId;
  String? get workspaceId => _$this._workspaceId;
  set workspaceId(String? workspaceId) => _$this._workspaceId = workspaceId;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  String? _loginType;
  String? get loginType => _$this._loginType;
  set loginType(String? loginType) => _$this._loginType = loginType;

  String? _role;
  String? get role => _$this._role;
  set role(String? role) => _$this._role = role;

  DateTime? _joinedAt;
  DateTime? get joinedAt => _$this._joinedAt;
  set joinedAt(DateTime? joinedAt) => _$this._joinedAt = joinedAt;

  bool? _pushEnable;
  bool? get pushEnable => _$this._pushEnable;
  set pushEnable(bool? pushEnable) => _$this._pushEnable = pushEnable;

  bool? _darkModeEnable;
  bool? get darkModeEnable => _$this._darkModeEnable;
  set darkModeEnable(bool? darkModeEnable) =>
      _$this._darkModeEnable = darkModeEnable;

  String? _profileImage;
  String? get profileImage => _$this._profileImage;
  set profileImage(String? profileImage) => _$this._profileImage = profileImage;

  String? _pushId;
  String? get pushId => _$this._pushId;
  set pushId(String? pushId) => _$this._pushId = pushId;

  String? _platformType;
  String? get platformType => _$this._platformType;
  set platformType(String? platformType) => _$this._platformType = platformType;

  UserBuilder() {
    User._defaults(this);
  }

  UserBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userId = $v.userId;
      _workspaceId = $v.workspaceId;
      _username = $v.username;
      _email = $v.email;
      _createdAt = $v.createdAt;
      _loginType = $v.loginType;
      _role = $v.role;
      _joinedAt = $v.joinedAt;
      _pushEnable = $v.pushEnable;
      _darkModeEnable = $v.darkModeEnable;
      _profileImage = $v.profileImage;
      _pushId = $v.pushId;
      _platformType = $v.platformType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(User other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$User;
  }

  @override
  void update(void Function(UserBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  User build() => _build();

  _$User _build() {
    final _$result = _$v ??
        new _$User._(
            userId: userId,
            workspaceId: workspaceId,
            username: username,
            email: email,
            createdAt: createdAt,
            loginType: loginType,
            role: role,
            joinedAt: joinedAt,
            pushEnable: pushEnable,
            darkModeEnable: darkModeEnable,
            profileImage: profileImage,
            pushId: pushId,
            platformType: platformType);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
