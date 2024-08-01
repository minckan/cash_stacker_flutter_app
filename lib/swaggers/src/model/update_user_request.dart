//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_user_request.g.dart';

/// UpdateUserRequest
///
/// Properties:
/// * [pushEnable] - Whether push notifications are enabled.
/// * [darkModeEnable] - Whether dark mode is enabled.
/// * [role] - The role of the user.
@BuiltValue()
abstract class UpdateUserRequest
    implements Built<UpdateUserRequest, UpdateUserRequestBuilder> {
  /// Whether push notifications are enabled.
  @BuiltValueField(wireName: r'push_enable')
  bool? get pushEnable;

  /// Whether dark mode is enabled.
  @BuiltValueField(wireName: r'darkMode_enable')
  bool? get darkModeEnable;

  /// The role of the user.
  @BuiltValueField(wireName: r'role')
  String? get role;

  UpdateUserRequest._();

  factory UpdateUserRequest(
          [void Function(UpdateUserRequestBuilder b) updates]) =
      _$UpdateUserRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateUserRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateUserRequest> get serializer =>
      _$UpdateUserRequestSerializer();
}

class _$UpdateUserRequestSerializer
    implements PrimitiveSerializer<UpdateUserRequest> {
  @override
  final Iterable<Type> types = const [UpdateUserRequest, _$UpdateUserRequest];

  @override
  final String wireName = r'UpdateUserRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateUserRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.pushEnable != null) {
      yield r'push_enable';
      yield serializers.serialize(
        object.pushEnable,
        specifiedType: const FullType(bool),
      );
    }
    if (object.darkModeEnable != null) {
      yield r'darkMode_enable';
      yield serializers.serialize(
        object.darkModeEnable,
        specifiedType: const FullType(bool),
      );
    }
    if (object.role != null) {
      yield r'role';
      yield serializers.serialize(
        object.role,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdateUserRequest object, {
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
    required UpdateUserRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'push_enable':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.pushEnable = valueDes;
          break;
        case r'darkMode_enable':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.darkModeEnable = valueDes;
          break;
        case r'role':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.role = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpdateUserRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateUserRequestBuilder();
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
