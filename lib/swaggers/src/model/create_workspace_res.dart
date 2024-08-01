//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_workspace_res.g.dart';

/// CreateWorkspaceRes
///
/// Properties:
/// * [workspaceId] - The ID of the newly created workspace.
@BuiltValue()
abstract class CreateWorkspaceRes
    implements Built<CreateWorkspaceRes, CreateWorkspaceResBuilder> {
  /// The ID of the newly created workspace.
  @BuiltValueField(wireName: r'workspace_id')
  String? get workspaceId;

  CreateWorkspaceRes._();

  factory CreateWorkspaceRes(
          [void Function(CreateWorkspaceResBuilder b) updates]) =
      _$CreateWorkspaceRes;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateWorkspaceResBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateWorkspaceRes> get serializer =>
      _$CreateWorkspaceResSerializer();
}

class _$CreateWorkspaceResSerializer
    implements PrimitiveSerializer<CreateWorkspaceRes> {
  @override
  final Iterable<Type> types = const [CreateWorkspaceRes, _$CreateWorkspaceRes];

  @override
  final String wireName = r'CreateWorkspaceRes';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateWorkspaceRes object, {
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
    CreateWorkspaceRes object, {
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
    required CreateWorkspaceResBuilder result,
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
  CreateWorkspaceRes deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateWorkspaceResBuilder();
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
