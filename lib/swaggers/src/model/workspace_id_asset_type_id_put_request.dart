//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'workspace_id_asset_type_id_put_request.g.dart';

/// WorkspaceIdAssetTypeIdPutRequest
///
/// Properties:
/// * [assetTypeName] - The name of the asset type
@BuiltValue()
abstract class WorkspaceIdAssetTypeIdPutRequest
    implements
        Built<WorkspaceIdAssetTypeIdPutRequest,
            WorkspaceIdAssetTypeIdPutRequestBuilder> {
  /// The name of the asset type
  @BuiltValueField(wireName: r'asset_type_name')
  String? get assetTypeName;

  WorkspaceIdAssetTypeIdPutRequest._();

  factory WorkspaceIdAssetTypeIdPutRequest(
          [void Function(WorkspaceIdAssetTypeIdPutRequestBuilder b) updates]) =
      _$WorkspaceIdAssetTypeIdPutRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(WorkspaceIdAssetTypeIdPutRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<WorkspaceIdAssetTypeIdPutRequest> get serializer =>
      _$WorkspaceIdAssetTypeIdPutRequestSerializer();
}

class _$WorkspaceIdAssetTypeIdPutRequestSerializer
    implements PrimitiveSerializer<WorkspaceIdAssetTypeIdPutRequest> {
  @override
  final Iterable<Type> types = const [
    WorkspaceIdAssetTypeIdPutRequest,
    _$WorkspaceIdAssetTypeIdPutRequest
  ];

  @override
  final String wireName = r'WorkspaceIdAssetTypeIdPutRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    WorkspaceIdAssetTypeIdPutRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.assetTypeName != null) {
      yield r'asset_type_name';
      yield serializers.serialize(
        object.assetTypeName,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    WorkspaceIdAssetTypeIdPutRequest object, {
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
    required WorkspaceIdAssetTypeIdPutRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'asset_type_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.assetTypeName = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  WorkspaceIdAssetTypeIdPutRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = WorkspaceIdAssetTypeIdPutRequestBuilder();
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
