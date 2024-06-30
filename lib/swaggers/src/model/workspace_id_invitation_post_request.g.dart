// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workspace_id_invitation_post_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$WorkspaceIdInvitationPostRequest
    extends WorkspaceIdInvitationPostRequest {
  @override
  final String? email;
  @override
  final String? status;
  @override
  final String? token;
  @override
  final DateTime? expiryDate;

  factory _$WorkspaceIdInvitationPostRequest(
          [void Function(WorkspaceIdInvitationPostRequestBuilder)? updates]) =>
      (new WorkspaceIdInvitationPostRequestBuilder()..update(updates))._build();

  _$WorkspaceIdInvitationPostRequest._(
      {this.email, this.status, this.token, this.expiryDate})
      : super._();

  @override
  WorkspaceIdInvitationPostRequest rebuild(
          void Function(WorkspaceIdInvitationPostRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WorkspaceIdInvitationPostRequestBuilder toBuilder() =>
      new WorkspaceIdInvitationPostRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WorkspaceIdInvitationPostRequest &&
        email == other.email &&
        status == other.status &&
        token == other.token &&
        expiryDate == other.expiryDate;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, token.hashCode);
    _$hash = $jc(_$hash, expiryDate.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WorkspaceIdInvitationPostRequest')
          ..add('email', email)
          ..add('status', status)
          ..add('token', token)
          ..add('expiryDate', expiryDate))
        .toString();
  }
}

class WorkspaceIdInvitationPostRequestBuilder
    implements
        Builder<WorkspaceIdInvitationPostRequest,
            WorkspaceIdInvitationPostRequestBuilder> {
  _$WorkspaceIdInvitationPostRequest? _$v;

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

  WorkspaceIdInvitationPostRequestBuilder() {
    WorkspaceIdInvitationPostRequest._defaults(this);
  }

  WorkspaceIdInvitationPostRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _status = $v.status;
      _token = $v.token;
      _expiryDate = $v.expiryDate;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WorkspaceIdInvitationPostRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WorkspaceIdInvitationPostRequest;
  }

  @override
  void update(void Function(WorkspaceIdInvitationPostRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WorkspaceIdInvitationPostRequest build() => _build();

  _$WorkspaceIdInvitationPostRequest _build() {
    final _$result = _$v ??
        new _$WorkspaceIdInvitationPostRequest._(
            email: email, status: status, token: token, expiryDate: expiryDate);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
