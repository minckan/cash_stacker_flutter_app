//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'workspaces_post201_response.g.dart';

/// WorkspacesPost201Response
///
/// Properties:
/// * [workspaceId] - The ID of the newly created workspace.
@BuiltValue()
abstract class WorkspacesPost201Response
    implements
        Built<WorkspacesPost201Response, WorkspacesPost201ResponseBuilder> {
  /// The ID of the newly created workspace.
  @BuiltValueField(wireName: r'workspace_id')
  String? get workspaceId;

  WorkspacesPost201Response._();

  factory WorkspacesPost201Response(
          [void Function(WorkspacesPost201ResponseBuilder b) updates]) =
      _$WorkspacesPost201Response;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(WorkspacesPost201ResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<WorkspacesPost201Response> get serializer =>
      _$WorkspacesPost201ResponseSerializer();
}

class _$WorkspacesPost201ResponseSerializer
    implements PrimitiveSerializer<WorkspacesPost201Response> {
  @override
  final Iterable<Type> types = const [
    WorkspacesPost201Response,
    _$WorkspacesPost201Response
  ];

  @override
  final String wireName = r'WorkspacesPost201Response';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    WorkspacesPost201Response object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
    WorkspacesPost201Response object, {
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
    required WorkspacesPost201ResponseBuilder result,
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  WorkspacesPost201Response deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = WorkspacesPost201ResponseBuilder();
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
