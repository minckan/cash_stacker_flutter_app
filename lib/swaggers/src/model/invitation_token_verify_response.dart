//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'invitation_token_verify_response.g.dart';

/// InvitationTokenVerifyResponse
///
/// Properties:
/// * [workspaceId]
/// * [email]
/// * [tokenMatched]
@BuiltValue()
abstract class InvitationTokenVerifyResponse
    implements
        Built<InvitationTokenVerifyResponse,
            InvitationTokenVerifyResponseBuilder> {
  @BuiltValueField(wireName: r'workspaceId')
  String? get workspaceId;

  @BuiltValueField(wireName: r'email')
  String? get email;

  @BuiltValueField(wireName: r'tokenMatched')
  bool? get tokenMatched;

  InvitationTokenVerifyResponse._();

  factory InvitationTokenVerifyResponse(
          [void Function(InvitationTokenVerifyResponseBuilder b) updates]) =
      _$InvitationTokenVerifyResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(InvitationTokenVerifyResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<InvitationTokenVerifyResponse> get serializer =>
      _$InvitationTokenVerifyResponseSerializer();
}

class _$InvitationTokenVerifyResponseSerializer
    implements PrimitiveSerializer<InvitationTokenVerifyResponse> {
  @override
  final Iterable<Type> types = const [
    InvitationTokenVerifyResponse,
    _$InvitationTokenVerifyResponse
  ];

  @override
  final String wireName = r'InvitationTokenVerifyResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    InvitationTokenVerifyResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.workspaceId != null) {
      yield r'workspaceId';
      yield serializers.serialize(
        object.workspaceId,
        specifiedType: const FullType(String),
      );
    }
    if (object.email != null) {
      yield r'email';
      yield serializers.serialize(
        object.email,
        specifiedType: const FullType(String),
      );
    }
    if (object.tokenMatched != null) {
      yield r'tokenMatched';
      yield serializers.serialize(
        object.tokenMatched,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    InvitationTokenVerifyResponse object, {
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
    required InvitationTokenVerifyResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'workspaceId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.workspaceId = valueDes;
          break;
        case r'email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.email = valueDes;
          break;
        case r'tokenMatched':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.tokenMatched = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  InvitationTokenVerifyResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = InvitationTokenVerifyResponseBuilder();
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
