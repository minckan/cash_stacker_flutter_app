//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'portfolio_ratios_value.g.dart';

/// PortfolioRatiosValue
///
/// Properties:
/// * [totalAssets] - Total assets in the given category
/// * [assetTypeName] - Name of the asset type
@BuiltValue()
abstract class PortfolioRatiosValue
    implements Built<PortfolioRatiosValue, PortfolioRatiosValueBuilder> {
  /// Total assets in the given category
  @BuiltValueField(wireName: r'total_assets')
  num? get totalAssets;

  /// Name of the asset type
  @BuiltValueField(wireName: r'asset_type_name')
  String? get assetTypeName;

  PortfolioRatiosValue._();

  factory PortfolioRatiosValue([void updates(PortfolioRatiosValueBuilder b)]) =
      _$PortfolioRatiosValue;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PortfolioRatiosValueBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PortfolioRatiosValue> get serializer =>
      _$PortfolioRatiosValueSerializer();
}

class _$PortfolioRatiosValueSerializer
    implements PrimitiveSerializer<PortfolioRatiosValue> {
  @override
  final Iterable<Type> types = const [
    PortfolioRatiosValue,
    _$PortfolioRatiosValue
  ];

  @override
  final String wireName = r'PortfolioRatiosValue';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PortfolioRatiosValue object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.totalAssets != null) {
      yield r'total_assets';
      yield serializers.serialize(
        object.totalAssets,
        specifiedType: const FullType(num),
      );
    }
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
    PortfolioRatiosValue object, {
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
    required PortfolioRatiosValueBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'total_assets':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.totalAssets = valueDes;
          break;
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
  PortfolioRatiosValue deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PortfolioRatiosValueBuilder();
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
