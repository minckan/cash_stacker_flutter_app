//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'workspace_id_assets_id_put_request.g.dart';

/// WorkspaceIdAssetsIdPutRequest
///
/// Properties:
/// * [assetName]
@BuiltValue()
abstract class WorkspaceIdAssetsIdPutRequest
    implements
        Built<WorkspaceIdAssetsIdPutRequest,
            WorkspaceIdAssetsIdPutRequestBuilder> {
  @BuiltValueField(wireName: r'asset_name')
  String? get assetName;

  WorkspaceIdAssetsIdPutRequest._();

  factory WorkspaceIdAssetsIdPutRequest(
          [void updates(WorkspaceIdAssetsIdPutRequestBuilder b)]) =
      _$WorkspaceIdAssetsIdPutRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(WorkspaceIdAssetsIdPutRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<WorkspaceIdAssetsIdPutRequest> get serializer =>
      _$WorkspaceIdAssetsIdPutRequestSerializer();
}

class _$WorkspaceIdAssetsIdPutRequestSerializer
    implements PrimitiveSerializer<WorkspaceIdAssetsIdPutRequest> {
  @override
  final Iterable<Type> types = const [
    WorkspaceIdAssetsIdPutRequest,
    _$WorkspaceIdAssetsIdPutRequest
  ];

  @override
  final String wireName = r'WorkspaceIdAssetsIdPutRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    WorkspaceIdAssetsIdPutRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.assetName != null) {
      yield r'asset_name';
      yield serializers.serialize(
        object.assetName,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    WorkspaceIdAssetsIdPutRequest object, {
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
    required WorkspaceIdAssetsIdPutRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'asset_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.assetName = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  WorkspaceIdAssetsIdPutRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = WorkspaceIdAssetsIdPutRequestBuilder();
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
