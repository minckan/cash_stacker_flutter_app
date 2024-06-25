// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invitation.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Invitation extends Invitation {
  @override
  final String? id;
  @override
  final String? workspaceId;
  @override
  final String? email;
  @override
  final String? status;
  @override
  final String? token;
  @override
  final DateTime? expiryDate;

  factory _$Invitation([void Function(InvitationBuilder)? updates]) =>
      (new InvitationBuilder()..update(updates))._build();

  _$Invitation._(
      {this.id,
      this.workspaceId,
      this.email,
      this.status,
      this.token,
      this.expiryDate})
      : super._();

  @override
  Invitation rebuild(void Function(InvitationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InvitationBuilder toBuilder() => new InvitationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Invitation &&
        id == other.id &&
        workspaceId == other.workspaceId &&
        email == other.email &&
        status == other.status &&
        token == other.token &&
        expiryDate == other.expiryDate;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, workspaceId.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, token.hashCode);
    _$hash = $jc(_$hash, expiryDate.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Invitation')
          ..add('id', id)
          ..add('workspaceId', workspaceId)
          ..add('email', email)
          ..add('status', status)
          ..add('token', token)
          ..add('expiryDate', expiryDate))
        .toString();
  }
}

class InvitationBuilder implements Builder<Invitation, InvitationBuilder> {
  _$Invitation? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _workspaceId;
  String? get workspaceId => _$this._workspaceId;
  set workspaceId(String? workspaceId) => _$this._workspaceId = workspaceId;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  DateTime? _expiryDate;
  DateTime? get expiryDate => _$this._expiryDate;
  set expiryDate(DateTime? expiryDate) => _$this._expiryDate = expiryDate;

  InvitationBuilder() {
    Invitation._defaults(this);
  }

  InvitationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _workspaceId = $v.workspaceId;
      _email = $v.email;
      _status = $v.status;
      _token = $v.token;
      _expiryDate = $v.expiryDate;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Invitation other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Invitation;
  }

  @override
  void update(void Function(InvitationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Invitation build() => _build();

  _$Invitation _build() {
    final _$result = _$v ??
        new _$Invitation._(
            id: id,
            workspaceId: workspaceId,
            email: email,
            status: status,
            token: token,
            expiryDate: expiryDate);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
