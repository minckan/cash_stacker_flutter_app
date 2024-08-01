//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_asset_type_req.g.dart';

/// CreateAssetTypeReq
///
/// Properties:
/// * [assetTypeName] - The name of the asset type
/// * [isForeignAssetType] - 해외 자산 여부
@BuiltValue()
abstract class CreateAssetTypeReq
    implements Built<CreateAssetTypeReq, CreateAssetTypeReqBuilder> {
  /// The name of the asset type
  @BuiltValueField(wireName: r'asset_type_name')
  String? get assetTypeName;

  /// 해외 자산 여부
  @BuiltValueField(wireName: r'is_foreign_asset_type')
  bool? get isForeignAssetType;

  CreateAssetTypeReq._();

  factory CreateAssetTypeReq(
          [void Function(CreateAssetTypeReqBuilder b) updates]) =
      _$CreateAssetTypeReq;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateAssetTypeReqBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateAssetTypeReq> get serializer =>
      _$CreateAssetTypeReqSerializer();
}

class _$CreateAssetTypeReqSerializer
    implements PrimitiveSerializer<CreateAssetTypeReq> {
  @override
  final Iterable<Type> types = const [CreateAssetTypeReq, _$CreateAssetTypeReq];

  @override
  final String wireName = r'CreateAssetTypeReq';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateAssetTypeReq object, {
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
    CreateAssetTypeReq object, {
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
    required CreateAssetTypeReqBuilder result,
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
  CreateAssetTypeReq deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateAssetTypeReqBuilder();
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
