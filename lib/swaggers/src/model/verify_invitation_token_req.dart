//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'verify_invitation_token_req.g.dart';

/// VerifyInvitationTokenReq
///
/// Properties:
/// * [token] - The invitation token
@BuiltValue()
abstract class VerifyInvitationTokenReq
    implements
        Built<VerifyInvitationTokenReq, VerifyInvitationTokenReqBuilder> {
  /// The invitation token
  @BuiltValueField(wireName: r'token')
  String? get token;

  VerifyInvitationTokenReq._();

  factory VerifyInvitationTokenReq(
          [void Function(VerifyInvitationTokenReqBuilder b) updates]) =
      _$VerifyInvitationTokenReq;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(VerifyInvitationTokenReqBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<VerifyInvitationTokenReq> get serializer =>
      _$VerifyInvitationTokenReqSerializer();
}

class _$VerifyInvitationTokenReqSerializer
    implements PrimitiveSerializer<VerifyInvitationTokenReq> {
  @override
  final Iterable<Type> types = const [
    VerifyInvitationTokenReq,
    _$VerifyInvitationTokenReq
  ];

  @override
  final String wireName = r'VerifyInvitationTokenReq';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    VerifyInvitationTokenReq object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.token != null) {
      yield r'token';
      yield serializers.serialize(
        object.token,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    VerifyInvitationTokenReq object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object,
            specifiedType: specifiedType)
        .toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required VerifyInvitationTokenReqBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'token':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.token = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  VerifyInvitationTokenReq deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = VerifyInvitationTokenReqBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}
