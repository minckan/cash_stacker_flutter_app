//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'workspace_id_invitation_post_request.g.dart';

/// WorkspaceIdInvitationPostRequest
///
/// Properties:
/// * [email] - The email address to send the invitation to
/// * [status] - The status of the invitation
/// * [token] - The invitation token
/// * [expiryDate] - The expiry date of the invitation
@BuiltValue()
abstract class WorkspaceIdInvitationPostRequest
    implements
        Built<WorkspaceIdInvitationPostRequest,
            WorkspaceIdInvitationPostRequestBuilder> {
  /// The email address to send the invitation to
  @BuiltValueField(wireName: r'email')
  String? get email;

  /// The status of the invitation
  @BuiltValueField(wireName: r'status')
  String? get status;

  /// The invitation token
  @BuiltValueField(wireName: r'token')
  String? get token;

  /// The expiry date of the invitation
  @BuiltValueField(wireName: r'expiry_date')
  DateTime? get expiryDate;

  WorkspaceIdInvitationPostRequest._();

  factory WorkspaceIdInvitationPostRequest(
          [void updates(WorkspaceIdInvitationPostRequestBuilder b)]) =
      _$WorkspaceIdInvitationPostRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(WorkspaceIdInvitationPostRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<WorkspaceIdInvitationPostRequest> get serializer =>
      _$WorkspaceIdInvitationPostRequestSerializer();
}

class _$WorkspaceIdInvitationPostRequestSerializer
    implements PrimitiveSerializer<WorkspaceIdInvitationPostRequest> {
  @override
  final Iterable<Type> types = const [
    WorkspaceIdInvitationPostRequest,
    _$WorkspaceIdInvitationPostRequest
  ];

  @override
  final String wireName = r'WorkspaceIdInvitationPostRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    WorkspaceIdInvitationPostRequest object, {
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
        specifiedType: const FullType(String),
      );
    }
    if (object.token != null) {
      yield r'token';
      yield serializers.serialize(
        object.token,
        specifiedType: const FullType(String),
      );
    }
    if (object.expiryDate != null) {
      yield r'expiry_date';
      yield serializers.serialize(
        object.expiryDate,
        specifiedType: const FullType(DateTime),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    WorkspaceIdInvitationPostRequest object, {
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
    required WorkspaceIdInvitationPostRequestBuilder result,
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
            specifiedType: const FullType(String),
          ) as String;
          result.status = valueDes;
          break;
        case r'token':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.token = valueDes;
          break;
        case r'expiry_date':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.expiryDate = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  WorkspaceIdInvitationPostRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = WorkspaceIdInvitationPostRequestBuilder();
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
