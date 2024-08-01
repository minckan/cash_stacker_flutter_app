// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_user_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateUserRequest extends CreateUserRequest {
  @override
  final String? workspaceId;
  @override
  final String? username;
  @override
  final String? email;
  @override
  final String? loginType;
  @override
  final String? role;
  @override
  final bool? pushEnable;
  @override
  final bool? darkModeEnable;
  @override
  final String? profileImage;
  @override
  final String? pushId;
  @override
  final DateTime? joinedAt;
  @override
  final DateTime? createdAt;
  @override
  final String? userId;
  @override
  final String? platformType;

  factory _$CreateUserRequest(
          [void Function(CreateUserRequestBuilder)? updates]) =>
      (new CreateUserRequestBuilder()..update(updates))._build();

  _$CreateUserRequest._(
      {this.workspaceId,
      this.username,
      this.email,
      this.loginType,
      this.role,
      this.pushEnable,
      this.darkModeEnable,
      this.profileImage,
      this.pushId,
      this.joinedAt,
      this.createdAt,
      this.userId,
      this.platformType})
      : super._();

  @override
  CreateUserRequest rebuild(void Function(CreateUserRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateUserRequestBuilder toBuilder() =>
      new CreateUserRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateUserRequest &&
        workspaceId == other.workspaceId &&
        username == other.username &&
        email == other.email &&
        loginType == other.loginType &&
        role == other.role &&
        pushEnable == other.pushEnable &&
        darkModeEnable == other.darkModeEnable &&
        profileImage == other.profileImage &&
        pushId == other.pushId &&
        joinedAt == other.joinedAt &&
        createdAt == other.createdAt &&
        userId == other.userId &&
        platformType == other.platformType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, workspaceId.hashCode);
    _$hash = $jc(_$hash, username.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, loginType.hashCode);
    _$hash = $jc(_$hash, role.hashCode);
    _$hash = $jc(_$hash, pushEnable.hashCode);
    _$hash = $jc(_$hash, darkModeEnable.hashCode);
    _$hash = $jc(_$hash, profileImage.hashCode);
    _$hash = $jc(_$hash, pushId.hashCode);
    _$hash = $jc(_$hash, joinedAt.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, platformType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateUserRequest')
          ..add('workspaceId', workspaceId)
          ..add('username', username)
          ..add('email', email)
          ..add('loginType', loginType)
          ..add('role', role)
          ..add('pushEnable', pushEnable)
          ..add('darkModeEnable', darkModeEnable)
          ..add('profileImage', profileImage)
          ..add('pushId', pushId)
          ..add('joinedAt', joinedAt)
          ..add('createdAt', createdAt)
          ..add('userId', userId)
          ..add('platformType', platformType))
        .toString();
  }
}

class CreateUserRequestBuilder
    implements Builder<CreateUserRequest, CreateUserRequestBuilder> {
  _$CreateUserRequest? _$v;

  String? _workspaceId;
  String? get workspaceId => _$this._workspaceId;
  set workspaceId(String? workspaceId) => _$this._workspaceId = workspaceId;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _loginType;
  String? get loginType => _$this._loginType;
  set loginType(String? loginType) => _$this._loginType = loginType;

  String? _role;
  String? get role => _$this._role;
  set role(String? role) => _$this._role = role;

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

  DateTime? _joinedAt;
  DateTime? get joinedAt => _$this._joinedAt;
  set joinedAt(DateTime? joinedAt) => _$this._joinedAt = joinedAt;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  String? _platformType;
  String? get platformType => _$this._platformType;
  set platformType(String? platformType) => _$this._platformType = platformType;

  CreateUserRequestBuilder() {
    CreateUserRequest._defaults(this);
  }

  CreateUserRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _workspaceId = $v.workspaceId;
      _username = $v.username;
      _email = $v.email;
      _loginType = $v.loginType;
      _role = $v.role;
      _pushEnable = $v.pushEnable;
      _darkModeEnable = $v.darkModeEnable;
      _profileImage = $v.profileImage;
      _pushId = $v.pushId;
      _joinedAt = $v.joinedAt;
      _createdAt = $v.createdAt;
      _userId = $v.userId;
      _platformType = $v.platformType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateUserRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateUserRequest;
  }

  @override
  void update(void Function(CreateUserRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateUserRequest build() => _build();

  _$CreateUserRequest _build() {
    final _$result = _$v ??
        new _$CreateUserRequest._(
            workspaceId: workspaceId,
            username: username,
            email: email,
            loginType: loginType,
            role: role,
            pushEnable: pushEnable,
            darkModeEnable: darkModeEnable,
            profileImage: profileImage,
            pushId: pushId,
            joinedAt: joinedAt,
            createdAt: createdAt,
            userId: userId,
            platformType: platformType);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
