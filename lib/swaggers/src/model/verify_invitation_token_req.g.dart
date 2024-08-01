// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_invitation_token_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$VerifyInvitationTokenReq extends VerifyInvitationTokenReq {
  @override
  final String? token;

  factory _$VerifyInvitationTokenReq(
          [void Function(VerifyInvitationTokenReqBuilder)? updates]) =>
      (new VerifyInvitationTokenReqBuilder()..update(updates))._build();

  _$VerifyInvitationTokenReq._({this.token}) : super._();

  @override
  VerifyInvitationTokenReq rebuild(
          void Function(VerifyInvitationTokenReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VerifyInvitationTokenReqBuilder toBuilder() =>
      new VerifyInvitationTokenReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VerifyInvitationTokenReq && token == other.token;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, token.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'VerifyInvitationTokenReq')
          ..add('token', token))
        .toString();
  }
}

class VerifyInvitationTokenReqBuilder
    implements
        Builder<VerifyInvitationTokenReq, VerifyInvitationTokenReqBuilder> {
  _$VerifyInvitationTokenReq? _$v;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  VerifyInvitationTokenReqBuilder() {
    VerifyInvitationTokenReq._defaults(this);
  }

  VerifyInvitationTokenReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _token = $v.token;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VerifyInvitationTokenReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$VerifyInvitationTokenReq;
  }

  @override
  void update(void Function(VerifyInvitationTokenReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VerifyInvitationTokenReq build() => _build();

  _$VerifyInvitationTokenReq _build() {
    final _$result = _$v ?? new _$VerifyInvitationTokenReq._(token: token);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
