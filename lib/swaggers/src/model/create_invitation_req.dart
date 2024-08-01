//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_invitation_req.g.dart';

/// CreateInvitationReq
///
/// Properties:
/// * [email] - The email address to send the invitation to
@BuiltValue()
abstract class CreateInvitationReq
    implements Built<CreateInvitationReq, CreateInvitationReqBuilder> {
  /// The email address to send the invitation to
  @BuiltValueField(wireName: r'email')
  String? get email;

  CreateInvitationReq._();

  factory CreateInvitationReq(
          [void Function(CreateInvitationReqBuilder b) updates]) =
      _$CreateInvitationReq;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateInvitationReqBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateInvitationReq> get serializer =>
      _$CreateInvitationReqSerializer();
}

class _$CreateInvitationReqSerializer
    implements PrimitiveSerializer<CreateInvitationReq> {
  @override
  final Iterable<Type> types = const [
    CreateInvitationReq,
    _$CreateInvitationReq
  ];

  @override
  final String wireName = r'CreateInvitationReq';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateInvitationReq object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.email != null) {
      yield r'email';
      yield serializers.serialize(
        object.email,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateInvitationReq object, {
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
    required CreateInvitationReqBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.email = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateInvitationReq deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateInvitationReqBuilder();
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
