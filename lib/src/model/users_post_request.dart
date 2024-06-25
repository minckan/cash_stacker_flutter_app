//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'users_post_request.g.dart';

/// UsersPostRequest
///
/// Properties:
/// * [workspaceId] - The ID of the workspace.
/// * [username] - The username of the user.
/// * [email] - The email of the user.
/// * [loginType] - The login type of the user.
/// * [role] - The role of the user.
/// * [pushEnable] - Whether push notifications are enabled.
/// * [darkModeEnable] - Whether dark mode is enabled.
/// * [profileImage] - The profile image of the user.
/// * [pushId] - The push ID of the user.
/// * [joinedAt] - The date the user joined.
/// * [createdAt] - The date the user was created.
/// * [userId] - The ID of the user.
/// * [platformType] - The platform type of the user.
@BuiltValue()
abstract class UsersPostRequest
    implements Built<UsersPostRequest, UsersPostRequestBuilder> {
  /// The ID of the workspace.
  @BuiltValueField(wireName: r'workspace_id')
  String? get workspaceId;

  /// The username of the user.
  @BuiltValueField(wireName: r'username')
  String? get username;

  /// The email of the user.
  @BuiltValueField(wireName: r'email')
  String? get email;

  /// The login type of the user.
  @BuiltValueField(wireName: r'login_type')
  String? get loginType;

  /// The role of the user.
  @BuiltValueField(wireName: r'role')
  String? get role;

  /// Whether push notifications are enabled.
  @BuiltValueField(wireName: r'push_enable')
  bool? get pushEnable;

  /// Whether dark mode is enabled.
  @BuiltValueField(wireName: r'darkMode_enable')
  bool? get darkModeEnable;

  /// The profile image of the user.
  @BuiltValueField(wireName: r'profile_image')
  String? get profileImage;

  /// The push ID of the user.
  @BuiltValueField(wireName: r'push_id')
  String? get pushId;

  /// The date the user joined.
  @BuiltValueField(wireName: r'joined_at')
  DateTime? get joinedAt;

  /// The date the user was created.
  @BuiltValueField(wireName: r'created_at')
  DateTime? get createdAt;

  /// The ID of the user.
  @BuiltValueField(wireName: r'user_id')
  String? get userId;

  /// The platform type of the user.
  @BuiltValueField(wireName: r'platform_type')
  String? get platformType;

  UsersPostRequest._();

  factory UsersPostRequest([void Function(UsersPostRequestBuilder b) updates]) =
      _$UsersPostRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UsersPostRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UsersPostRequest> get serializer =>
      _$UsersPostRequestSerializer();
}

class _$UsersPostRequestSerializer
    implements PrimitiveSerializer<UsersPostRequest> {
  @override
  final Iterable<Type> types = const [UsersPostRequest, _$UsersPostRequest];

  @override
  final String wireName = r'UsersPostRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UsersPostRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.workspaceId != null) {
      yield r'workspace_id';
      yield serializers.serialize(
        object.workspaceId,
        specifiedType: const FullType(String),
      );
    }
    if (object.username != null) {
      yield r'username';
      yield serializers.serialize(
        object.username,
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
    if (object.loginType != null) {
      yield r'login_type';
      yield serializers.serialize(
        object.loginType,
        specifiedType: const FullType(String),
      );
    }
    if (object.role != null) {
      yield r'role';
      yield serializers.serialize(
        object.role,
        specifiedType: const FullType(String),
      );
    }
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
    if (object.profileImage != null) {
      yield r'profile_image';
      yield serializers.serialize(
        object.profileImage,
        specifiedType: const FullType(String),
      );
    }
    if (object.pushId != null) {
      yield r'push_id';
      yield serializers.serialize(
        object.pushId,
        specifiedType: const FullType(String),
      );
    }
    if (object.joinedAt != null) {
      yield r'joined_at';
      yield serializers.serialize(
        object.joinedAt,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.createdAt != null) {
      yield r'created_at';
      yield serializers.serialize(
        object.createdAt,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.userId != null) {
      yield r'user_id';
      yield serializers.serialize(
        object.userId,
        specifiedType: const FullType(String),
      );
    }
    if (object.platformType != null) {
      yield r'platform_type';
      yield serializers.serialize(
        object.platformType,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UsersPostRequest object, {
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
    required UsersPostRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'workspace_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.workspaceId = valueDes;
          break;
        case r'username':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.username = valueDes;
          break;
        case r'email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.email = valueDes;
          break;
        case r'login_type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.loginType = valueDes;
          break;
        case r'role':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.role = valueDes;
          break;
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
        case r'profile_image':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.profileImage = valueDes;
          break;
        case r'push_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.pushId = valueDes;
          break;
        case r'joined_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.joinedAt = valueDes;
          break;
        case r'created_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        case r'user_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.userId = valueDes;
          break;
        case r'platform_type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.platformType = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UsersPostRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UsersPostRequestBuilder();
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
