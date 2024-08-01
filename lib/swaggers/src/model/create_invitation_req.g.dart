// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_invitation_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateInvitationReq extends CreateInvitationReq {
  @override
  final String? email;

  factory _$CreateInvitationReq(
          [void Function(CreateInvitationReqBuilder)? updates]) =>
      (new CreateInvitationReqBuilder()..update(updates))._build();

  _$CreateInvitationReq._({this.email}) : super._();

  @override
  CreateInvitationReq rebuild(
          void Function(CreateInvitationReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateInvitationReqBuilder toBuilder() =>
      new CreateInvitationReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateInvitationReq && email == other.email;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateInvitationReq')
          ..add('email', email))
        .toString();
  }
}

class CreateInvitationReqBuilder
    implements Builder<CreateInvitationReq, CreateInvitationReqBuilder> {
  _$CreateInvitationReq? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  CreateInvitationReqBuilder() {
    CreateInvitationReq._defaults(this);
  }

  CreateInvitationReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateInvitationReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateInvitationReq;
  }

  @override
  void update(void Function(CreateInvitationReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateInvitationReq build() => _build();

  _$CreateInvitationReq _build() {
    final _$result = _$v ?? new _$CreateInvitationReq._(email: email);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
