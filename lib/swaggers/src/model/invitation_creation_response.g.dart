// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invitation_creation_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const InvitationCreationResponseStatusEnum
    _$invitationCreationResponseStatusEnum_WAITING =
    const InvitationCreationResponseStatusEnum._('WAITING');
const InvitationCreationResponseStatusEnum
    _$invitationCreationResponseStatusEnum_COMPLETED =
    const InvitationCreationResponseStatusEnum._('COMPLETED');
const InvitationCreationResponseStatusEnum
    _$invitationCreationResponseStatusEnum_FAILED =
    const InvitationCreationResponseStatusEnum._('FAILED');

InvitationCreationResponseStatusEnum
    _$invitationCreationResponseStatusEnumValueOf(String name) {
  switch (name) {
    case 'WAITING':
      return _$invitationCreationResponseStatusEnum_WAITING;
    case 'COMPLETED':
      return _$invitationCreationResponseStatusEnum_COMPLETED;
    case 'FAILED':
      return _$invitationCreationResponseStatusEnum_FAILED;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<InvitationCreationResponseStatusEnum>
    _$invitationCreationResponseStatusEnumValues = new BuiltSet<
        InvitationCreationResponseStatusEnum>(const <InvitationCreationResponseStatusEnum>[
  _$invitationCreationResponseStatusEnum_WAITING,
  _$invitationCreationResponseStatusEnum_COMPLETED,
  _$invitationCreationResponseStatusEnum_FAILED,
]);

Serializer<InvitationCreationResponseStatusEnum>
    _$invitationCreationResponseStatusEnumSerializer =
    new _$InvitationCreationResponseStatusEnumSerializer();

class _$InvitationCreationResponseStatusEnumSerializer
    implements PrimitiveSerializer<InvitationCreationResponseStatusEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'WAITING': 'WAITING',
    'COMPLETED': 'COMPLETED',
    'FAILED': 'FAILED',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'WAITING': 'WAITING',
    'COMPLETED': 'COMPLETED',
    'FAILED': 'FAILED',
  };

  @override
  final Iterable<Type> types = const <Type>[
    InvitationCreationResponseStatusEnum
  ];
  @override
  final String wireName = 'InvitationCreationResponseStatusEnum';

  @override
  Object serialize(
          Serializers serializers, InvitationCreationResponseStatusEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  InvitationCreationResponseStatusEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      InvitationCreationResponseStatusEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$InvitationCreationResponse extends InvitationCreationResponse {
  @override
  final String? email;
  @override
  final InvitationCreationResponseStatusEnum? status;
  @override
  final DateTime? expiryAt;

  factory _$InvitationCreationResponse(
          [void Function(InvitationCreationResponseBuilder)? updates]) =>
      (new InvitationCreationResponseBuilder()..update(updates))._build();

  _$InvitationCreationResponse._({this.email, this.status, this.expiryAt})
      : super._();

  @override
  InvitationCreationResponse rebuild(
          void Function(InvitationCreationResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InvitationCreationResponseBuilder toBuilder() =>
      new InvitationCreationResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InvitationCreationResponse &&
        email == other.email &&
        status == other.status &&
        expiryAt == other.expiryAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, expiryAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'InvitationCreationResponse')
          ..add('email', email)
          ..add('status', status)
          ..add('expiryAt', expiryAt))
        .toString();
  }
}

class InvitationCreationResponseBuilder
    implements
        Builder<InvitationCreationResponse, InvitationCreationResponseBuilder> {
  _$InvitationCreationResponse? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  InvitationCreationResponseStatusEnum? _status;
  InvitationCreationResponseStatusEnum? get status => _$this._status;
  set status(InvitationCreationResponseStatusEnum? status) =>
      _$this._status = status;

  DateTime? _expiryAt;
  DateTime? get expiryAt => _$this._expiryAt;
  set expiryAt(DateTime? expiryAt) => _$this._expiryAt = expiryAt;

  InvitationCreationResponseBuilder() {
    InvitationCreationResponse._defaults(this);
  }

  InvitationCreationResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _status = $v.status;
      _expiryAt = $v.expiryAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InvitationCreationResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$InvitationCreationResponse;
  }

  @override
  void update(void Function(InvitationCreationResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  InvitationCreationResponse build() => _build();

  _$InvitationCreationResponse _build() {
    final _$result = _$v ??
        new _$InvitationCreationResponse._(
            email: email, status: status, expiryAt: expiryAt);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
