//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'workspace_id_invitation_id_put_request.g.dart';

/// WorkspaceIdInvitationIdPutRequest
///
/// Properties:
/// * [status] - The new status of the invitation
@BuiltValue()
abstract class WorkspaceIdInvitationIdPutRequest implements Built<WorkspaceIdInvitationIdPutRequest, WorkspaceIdInvitationIdPutRequestBuilder> {
  /// The new status of the invitation
  @BuiltValueField(wireName: r'status')
  String? get status;

  WorkspaceIdInvitationIdPutRequest._();

  factory WorkspaceIdInvitationIdPutRequest([void updates(WorkspaceIdInvitationIdPutRequestBuilder b)]) = _$WorkspaceIdInvitationIdPutRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(WorkspaceIdInvitationIdPutRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<WorkspaceIdInvitationIdPutRequest> get serializer => _$WorkspaceIdInvitationIdPutRequestSerializer();
}

class _$WorkspaceIdInvitationIdPutRequestSerializer implements PrimitiveSerializer<WorkspaceIdInvitationIdPutRequest> {
  @override
  final Iterable<Type> types = const [WorkspaceIdInvitationIdPutRequest, _$WorkspaceIdInvitationIdPutRequest];

  @override
  final String wireName = r'WorkspaceIdInvitationIdPutRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    WorkspaceIdInvitationIdPutRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.status != null) {
      yield r'status';
      yield serializers.serialize(
        object.status,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    WorkspaceIdInvitationIdPutRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required WorkspaceIdInvitationIdPutRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.status = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  WorkspaceIdInvitationIdPutRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = WorkspaceIdInvitationIdPutRequestBuilder();
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

