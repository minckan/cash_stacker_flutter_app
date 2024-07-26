//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'asset.g.dart';

/// Asset
///
/// Properties:
/// * [assetId]
/// * [workspaceId]
/// * [assetTypeId]
/// * [assetName]
/// * [createdAt]
/// * [currencyCode]
@BuiltValue()
abstract class Asset implements Built<Asset, AssetBuilder> {
  @BuiltValueField(wireName: r'asset_id')
  int? get assetId;

  @BuiltValueField(wireName: r'workspace_id')
  String? get workspaceId;

  @BuiltValueField(wireName: r'asset_type_id')
  int? get assetTypeId;

  @BuiltValueField(wireName: r'asset_name')
  String? get assetName;

  @BuiltValueField(wireName: r'created_at')
  DateTime? get createdAt;

  @BuiltValueField(wireName: r'currency_code')
  String? get currencyCode;

  Asset._();

  factory Asset([void updates(AssetBuilder b)]) = _$Asset;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AssetBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Asset> get serializer => _$AssetSerializer();
}

class _$AssetSerializer implements PrimitiveSerializer<Asset> {
  @override
  final Iterable<Type> types = const [Asset, _$Asset];

  @override
  final String wireName = r'Asset';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Asset object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.assetId != null) {
      yield r'asset_id';
      yield serializers.serialize(
        object.assetId,
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
    if (object.assetTypeId != null) {
      yield r'asset_type_id';
      yield serializers.serialize(
        object.assetTypeId,
        specifiedType: const FullType(int),
      );
    }
    if (object.assetName != null) {
      yield r'asset_name';
      yield serializers.serialize(
        object.assetName,
        specifiedType: const FullType(String),
      );
    }
    if (object.createdAt != null) {
      yield r'created_at';
      yield serializers.serialize(
        object.createdAt,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.currencyCode != null) {
      yield r'currency_code';
      yield serializers.serialize(
        object.currencyCode,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    Asset object, {
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
    required AssetBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'asset_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.assetId = valueDes;
          break;
        case r'workspace_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.workspaceId = valueDes;
          break;
        case r'asset_type_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.assetTypeId = valueDes;
          break;
        case r'asset_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.assetName = valueDes;
          break;
        case r'created_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        case r'currency_code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.currencyCode = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Asset deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AssetBuilder();
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
