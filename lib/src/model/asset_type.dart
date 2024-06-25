//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'asset_type.g.dart';

/// AssetType
///
/// Properties:
/// * [assetTypeId]
/// * [workspaceId]
/// * [assetTypeName]
/// * [isDefault]
@BuiltValue()
abstract class AssetType implements Built<AssetType, AssetTypeBuilder> {
  @BuiltValueField(wireName: r'asset_type_id')
  int? get assetTypeId;

  @BuiltValueField(wireName: r'workspace_id')
  String? get workspaceId;

  @BuiltValueField(wireName: r'asset_type_name')
  String? get assetTypeName;

  @BuiltValueField(wireName: r'is_default')
  bool? get isDefault;

  AssetType._();

  factory AssetType([void Function(AssetTypeBuilder b) updates]) = _$AssetType;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AssetTypeBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AssetType> get serializer => _$AssetTypeSerializer();
}

class _$AssetTypeSerializer implements PrimitiveSerializer<AssetType> {
  @override
  final Iterable<Type> types = const [AssetType, _$AssetType];

  @override
  final String wireName = r'AssetType';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AssetType object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.assetTypeId != null) {
      yield r'asset_type_id';
      yield serializers.serialize(
        object.assetTypeId,
        specifiedType: const FullType(int),
      );
    }
    if (object.workspaceId != null) {
      yield r'workspace_id';
      yield serializers.serialize(
        object.workspaceId,
        specifiedType: const FullType(String),
      );
    }
    if (object.assetTypeName != null) {
      yield r'asset_type_name';
      yield serializers.serialize(
        object.assetTypeName,
        specifiedType: const FullType(String),
      );
    }
    if (object.isDefault != null) {
      yield r'is_default';
      yield serializers.serialize(
        object.isDefault,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AssetType object, {
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
    required AssetTypeBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'asset_type_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.assetTypeId = valueDes;
          break;
        case r'workspace_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.workspaceId = valueDes;
          break;
        case r'asset_type_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.assetTypeName = valueDes;
          break;
        case r'is_default':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isDefault = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AssetType deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AssetTypeBuilder();
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
