//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'portfolio_ratios_value.dart';
import 'asset_info.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'portfolio.g.dart';

/// Portfolio
///
/// Properties:
/// * [totalAmount] - Total amount of all assets
/// * [ratios] - Ratios of different asset types
/// * [rows] - List of asset details
@BuiltValue()
abstract class Portfolio implements Built<Portfolio, PortfolioBuilder> {
  /// Total amount of all assets
  @BuiltValueField(wireName: r'totalAmount')
  num? get totalAmount;

  /// Ratios of different asset types
  @BuiltValueField(wireName: r'ratios')
  BuiltMap<String, PortfolioRatiosValue>? get ratios;

  /// List of asset details
  @BuiltValueField(wireName: r'rows')
  BuiltList<AssetInfo>? get rows;

  Portfolio._();

  factory Portfolio([void updates(PortfolioBuilder b)]) = _$Portfolio;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PortfolioBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Portfolio> get serializer => _$PortfolioSerializer();
}

class _$PortfolioSerializer implements PrimitiveSerializer<Portfolio> {
  @override
  final Iterable<Type> types = const [Portfolio, _$Portfolio];

  @override
  final String wireName = r'Portfolio';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Portfolio object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.totalAmount != null) {
      yield r'totalAmount';
      yield serializers.serialize(
        object.totalAmount,
        specifiedType: const FullType(num),
      );
    }
    if (object.ratios != null) {
      yield r'ratios';
      yield serializers.serialize(
        object.ratios,
        specifiedType: const FullType.nullable(
            BuiltMap, [FullType(String), FullType(PortfolioRatiosValue)]),
      );
    }
    if (object.rows != null) {
      yield r'rows';
      yield serializers.serialize(
        object.rows,
        specifiedType:
            const FullType.nullable(BuiltList, [FullType(AssetInfo)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    Portfolio object, {
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
    required PortfolioBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'totalAmount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.totalAmount = valueDes;
          break;
        case r'ratios':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(
                BuiltMap, [FullType(String), FullType(PortfolioRatiosValue)]),
          ) as BuiltMap<String, PortfolioRatiosValue>?;
          if (valueDes == null) continue;
          result.ratios.replace(valueDes);
          break;
        case r'rows':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType.nullable(BuiltList, [FullType(AssetInfo)]),
          ) as BuiltList<AssetInfo>?;
          if (valueDes == null) continue;
          result.rows.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Portfolio deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PortfolioBuilder();
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
