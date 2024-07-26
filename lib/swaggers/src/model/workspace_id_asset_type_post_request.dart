//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'workspace_id_asset_type_post_request.g.dart';

/// WorkspaceIdAssetTypePostRequest
///
/// Properties:
/// * [assetTypeName] - The name of the asset type
/// * [isForeignAssetType] - 해외 자산 여부
@BuiltValue()
abstract class WorkspaceIdAssetTypePostRequest
    implements
        Built<WorkspaceIdAssetTypePostRequest,
            WorkspaceIdAssetTypePostRequestBuilder> {
  /// The name of the asset type
  @BuiltValueField(wireName: r'asset_type_name')
  String? get assetTypeName;

  /// 해외 자산 여부
  @BuiltValueField(wireName: r'is_foreign_asset_type')
  bool? get isForeignAssetType;

  WorkspaceIdAssetTypePostRequest._();

  factory WorkspaceIdAssetTypePostRequest(
          [void updates(WorkspaceIdAssetTypePostRequestBuilder b)]) =
      _$WorkspaceIdAssetTypePostRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(WorkspaceIdAssetTypePostRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<WorkspaceIdAssetTypePostRequest> get serializer =>
      _$WorkspaceIdAssetTypePostRequestSerializer();
}

class _$WorkspaceIdAssetTypePostRequestSerializer
    implements PrimitiveSerializer<WorkspaceIdAssetTypePostRequest> {
  @override
  final Iterable<Type> types = const [
    WorkspaceIdAssetTypePostRequest,
    _$WorkspaceIdAssetTypePostRequest
  ];

  @override
  final String wireName = r'WorkspaceIdAssetTypePostRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    WorkspaceIdAssetTypePostRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.assetTypeName != null) {
      yield r'asset_type_name';
      yield serializers.serialize(
        object.assetTypeName,
        specifiedType: const FullType(String),
      );
    }
    if (object.isForeignAssetType != null) {
      yield r'is_foreign_asset_type';
      yield serializers.serialize(
        object.isForeignAssetType,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    WorkspaceIdAssetTypePostRequest object, {
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
    required WorkspaceIdAssetTypePostRequestBuilder result,
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
        case r'is_foreign_asset_type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isForeignAssetType = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  WorkspaceIdAssetTypePostRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = WorkspaceIdAssetTypePostRequestBuilder();
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
