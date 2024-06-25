//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'workspaces_post_request.g.dart';

/// WorkspacesPostRequest
///
/// Properties:
/// * [workspaceName] - The name of the workspace.
/// * [workspaceId] - The ID of the workspace.
@BuiltValue()
abstract class WorkspacesPostRequest
    implements Built<WorkspacesPostRequest, WorkspacesPostRequestBuilder> {
  /// The name of the workspace.
  @BuiltValueField(wireName: r'workspace_name')
  String? get workspaceName;

  /// The ID of the workspace.
  @BuiltValueField(wireName: r'workspace_id')
  String? get workspaceId;

  WorkspacesPostRequest._();

  factory WorkspacesPostRequest(
          [void Function(WorkspacesPostRequestBuilder b) updates]) =
      _$WorkspacesPostRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(WorkspacesPostRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<WorkspacesPostRequest> get serializer =>
      _$WorkspacesPostRequestSerializer();
}

class _$WorkspacesPostRequestSerializer
    implements PrimitiveSerializer<WorkspacesPostRequest> {
  @override
  final Iterable<Type> types = const [
    WorkspacesPostRequest,
    _$WorkspacesPostRequest
  ];

  @override
  final String wireName = r'WorkspacesPostRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    WorkspacesPostRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.workspaceName != null) {
      yield r'workspace_name';
      yield serializers.serialize(
        object.workspaceName,
        specifiedType: const FullType(String),
      );
    }
    if (object.workspaceId != null) {
      yield r'workspace_id';
      yield serializers.serialize(
        object.workspaceId,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    WorkspacesPostRequest object, {
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
    required WorkspacesPostRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'workspace_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.workspaceName = valueDes;
          break;
        case r'workspace_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.workspaceId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  WorkspacesPostRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = WorkspacesPostRequestBuilder();
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
