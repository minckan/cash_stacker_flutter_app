//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_asset_res.g.dart';

/// UpdateAssetRes
///
/// Properties:
/// * [assetName]
@BuiltValue()
abstract class UpdateAssetRes
    implements Built<UpdateAssetRes, UpdateAssetResBuilder> {
  @BuiltValueField(wireName: r'asset_name')
  String? get assetName;

  UpdateAssetRes._();

  factory UpdateAssetRes([void Function(UpdateAssetResBuilder b) updates]) =
      _$UpdateAssetRes;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateAssetResBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateAssetRes> get serializer =>
      _$UpdateAssetResSerializer();
}

class _$UpdateAssetResSerializer
    implements PrimitiveSerializer<UpdateAssetRes> {
  @override
  final Iterable<Type> types = const [UpdateAssetRes, _$UpdateAssetRes];

  @override
  final String wireName = r'UpdateAssetRes';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateAssetRes object, {
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
    UpdateAssetRes object, {
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
    required UpdateAssetResBuilder result,
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
  UpdateAssetRes deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateAssetResBuilder();
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
