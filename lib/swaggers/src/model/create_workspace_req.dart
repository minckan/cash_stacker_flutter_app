//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_workspace_req.g.dart';

/// CreateWorkspaceReq
///
/// Properties:
/// * [workspaceName] - The name of the workspace.
/// * [workspaceId] - The ID of the workspace.
@BuiltValue()
abstract class CreateWorkspaceReq
    implements Built<CreateWorkspaceReq, CreateWorkspaceReqBuilder> {
  /// The name of the workspace.
  @BuiltValueField(wireName: r'workspace_name')
  String? get workspaceName;

  /// The ID of the workspace.
  @BuiltValueField(wireName: r'workspace_id')
  String? get workspaceId;

  CreateWorkspaceReq._();

  factory CreateWorkspaceReq(
          [void Function(CreateWorkspaceReqBuilder b) updates]) =
      _$CreateWorkspaceReq;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateWorkspaceReqBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateWorkspaceReq> get serializer =>
      _$CreateWorkspaceReqSerializer();
}

class _$CreateWorkspaceReqSerializer
    implements PrimitiveSerializer<CreateWorkspaceReq> {
  @override
  final Iterable<Type> types = const [CreateWorkspaceReq, _$CreateWorkspaceReq];

  @override
  final String wireName = r'CreateWorkspaceReq';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateWorkspaceReq object, {
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
    CreateWorkspaceReq object, {
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
    required CreateWorkspaceReqBuilder result,
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
  CreateWorkspaceReq deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateWorkspaceReqBuilder();
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
