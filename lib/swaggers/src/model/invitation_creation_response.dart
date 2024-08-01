//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'invitation_creation_response.g.dart';

/// InvitationCreationResponse
///
/// Properties:
/// * [email]
/// * [status]
/// * [expiryAt]
@BuiltValue()
abstract class InvitationCreationResponse
    implements
        Built<InvitationCreationResponse, InvitationCreationResponseBuilder> {
  @BuiltValueField(wireName: r'email')
  String? get email;

  @BuiltValueField(wireName: r'status')
  InvitationCreationResponseStatusEnum? get status;
  // enum statusEnum {  WAITING,  COMPLETED,  FAILED,  };

  @BuiltValueField(wireName: r'expiryAt')
  DateTime? get expiryAt;

  InvitationCreationResponse._();

  factory InvitationCreationResponse(
          [void Function(InvitationCreationResponseBuilder b) updates]) =
      _$InvitationCreationResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(InvitationCreationResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<InvitationCreationResponse> get serializer =>
      _$InvitationCreationResponseSerializer();
}

class _$InvitationCreationResponseSerializer
    implements PrimitiveSerializer<InvitationCreationResponse> {
  @override
  final Iterable<Type> types = const [
    InvitationCreationResponse,
    _$InvitationCreationResponse
  ];

  @override
  final String wireName = r'InvitationCreationResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    InvitationCreationResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.email != null) {
      yield r'email';
      yield serializers.serialize(
        object.email,
        specifiedType: const FullType(String),
      );
    }
    if (object.status != null) {
      yield r'status';
      yield serializers.serialize(
        object.status,
        specifiedType: const FullType(InvitationCreationResponseStatusEnum),
      );
    }
    if (object.expiryAt != null) {
      yield r'expiryAt';
      yield serializers.serialize(
        object.expiryAt,
        specifiedType: const FullType(DateTime),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    InvitationCreationResponse object, {
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
    required InvitationCreationResponseBuilder result,
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
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(InvitationCreationResponseStatusEnum),
          ) as InvitationCreationResponseStatusEnum;
          result.status = valueDes;
          break;
        case r'expiryAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.expiryAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  InvitationCreationResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = InvitationCreationResponseBuilder();
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

class InvitationCreationResponseStatusEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'WAITING')
  static const InvitationCreationResponseStatusEnum WAITING =
      _$invitationCreationResponseStatusEnum_WAITING;
  @BuiltValueEnumConst(wireName: r'COMPLETED')
  static const InvitationCreationResponseStatusEnum COMPLETED =
      _$invitationCreationResponseStatusEnum_COMPLETED;
  @BuiltValueEnumConst(wireName: r'FAILED')
  static const InvitationCreationResponseStatusEnum FAILED =
      _$invitationCreationResponseStatusEnum_FAILED;

  static Serializer<InvitationCreationResponseStatusEnum> get serializer =>
      _$invitationCreationResponseStatusEnumSerializer;

  const InvitationCreationResponseStatusEnum._(super.name);

  static BuiltSet<InvitationCreationResponseStatusEnum> get values =>
      _$invitationCreationResponseStatusEnumValues;
  static InvitationCreationResponseStatusEnum valueOf(String name) =>
      _$invitationCreationResponseStatusEnumValueOf(name);
}
