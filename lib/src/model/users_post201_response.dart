//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'users_post201_response.g.dart';

/// UsersPost201Response
///
/// Properties:
/// * [userId] - The ID of the newly created user.
@BuiltValue()
abstract class UsersPost201Response
    implements Built<UsersPost201Response, UsersPost201ResponseBuilder> {
  /// The ID of the newly created user.
  @BuiltValueField(wireName: r'user_id')
  String? get userId;

  UsersPost201Response._();

  factory UsersPost201Response(
          [void Function(UsersPost201ResponseBuilder b) updates]) =
      _$UsersPost201Response;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UsersPost201ResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UsersPost201Response> get serializer =>
      _$UsersPost201ResponseSerializer();
}

class _$UsersPost201ResponseSerializer
    implements PrimitiveSerializer<UsersPost201Response> {
  @override
  final Iterable<Type> types = const [
    UsersPost201Response,
    _$UsersPost201Response
  ];

  @override
  final String wireName = r'UsersPost201Response';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UsersPost201Response object, {
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
    UsersPost201Response object, {
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
    required UsersPost201ResponseBuilder result,
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
  UsersPost201Response deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UsersPost201ResponseBuilder();
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
