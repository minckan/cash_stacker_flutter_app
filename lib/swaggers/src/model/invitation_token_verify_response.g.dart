// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invitation_token_verify_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$InvitationTokenVerifyResponse extends InvitationTokenVerifyResponse {
  @override
  final String? workspaceId;
  @override
  final String? email;
  @override
  final bool? tokenMatched;

  factory _$InvitationTokenVerifyResponse(
          [void Function(InvitationTokenVerifyResponseBuilder)? updates]) =>
      (new InvitationTokenVerifyResponseBuilder()..update(updates))._build();

  _$InvitationTokenVerifyResponse._(
      {this.workspaceId, this.email, this.tokenMatched})
      : super._();

  @override
  InvitationTokenVerifyResponse rebuild(
          void Function(InvitationTokenVerifyResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InvitationTokenVerifyResponseBuilder toBuilder() =>
      new InvitationTokenVerifyResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InvitationTokenVerifyResponse &&
        workspaceId == other.workspaceId &&
        email == other.email &&
        tokenMatched == other.tokenMatched;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, workspaceId.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, tokenMatched.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'InvitationTokenVerifyResponse')
          ..add('workspaceId', workspaceId)
          ..add('email', email)
          ..add('tokenMatched', tokenMatched))
        .toString();
  }
}

class InvitationTokenVerifyResponseBuilder
    implements
        Builder<InvitationTokenVerifyResponse,
            InvitationTokenVerifyResponseBuilder> {
  _$InvitationTokenVerifyResponse? _$v;

  String? _workspaceId;
  String? get workspaceId => _$this._workspaceId;
  set workspaceId(String? workspaceId) => _$this._workspaceId = workspaceId;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  bool? _tokenMatched;
  bool? get tokenMatched => _$this._tokenMatched;
  set tokenMatched(bool? tokenMatched) => _$this._tokenMatched = tokenMatched;

  InvitationTokenVerifyResponseBuilder() {
    InvitationTokenVerifyResponse._defaults(this);
  }

  InvitationTokenVerifyResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _workspaceId = $v.workspaceId;
      _email = $v.email;
      _tokenMatched = $v.tokenMatched;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InvitationTokenVerifyResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$InvitationTokenVerifyResponse;
  }

  @override
  void update(void Function(InvitationTokenVerifyResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  InvitationTokenVerifyResponse build() => _build();

  _$InvitationTokenVerifyResponse _build() {
    final _$result = _$v ??
        new _$InvitationTokenVerifyResponse._(
            workspaceId: workspaceId, email: email, tokenMatched: tokenMatched);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
