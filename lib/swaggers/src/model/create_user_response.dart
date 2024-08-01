//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_user_response.g.dart';

/// CreateUserResponse
///
/// Properties:
/// * [userId] - The ID of the newly created user.
@BuiltValue()
abstract class CreateUserResponse
    implements Built<CreateUserResponse, CreateUserResponseBuilder> {
  /// The ID of the newly created user.
  @BuiltValueField(wireName: r'user_id')
  String? get userId;

  CreateUserResponse._();

  factory CreateUserResponse(
          [void Function(CreateUserResponseBuilder b) updates]) =
      _$CreateUserResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateUserResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateUserResponse> get serializer =>
      _$CreateUserResponseSerializer();
}

class _$CreateUserResponseSerializer
    implements PrimitiveSerializer<CreateUserResponse> {
  @override
  final Iterable<Type> types = const [CreateUserResponse, _$CreateUserResponse];

  @override
  final String wireName = r'CreateUserResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateUserResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.userId != null) {
      yield r'user_id';
      yield serializers.serialize(
        object.userId,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateUserResponse object, {
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
    required CreateUserResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'user_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.userId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateUserResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateUserResponseBuilder();
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
