//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'get_monthly_asset_trend200_response_inner.g.dart';

/// GetMonthlyAssetTrend200ResponseInner
///
/// Properties:
/// * [month]
/// * [totalBalance]
@BuiltValue()
abstract class GetMonthlyAssetTrend200ResponseInner
    implements
        Built<GetMonthlyAssetTrend200ResponseInner,
            GetMonthlyAssetTrend200ResponseInnerBuilder> {
  @BuiltValueField(wireName: r'month')
  String? get month;

  @BuiltValueField(wireName: r'total_balance')
  double? get totalBalance;

  GetMonthlyAssetTrend200ResponseInner._();

  factory GetMonthlyAssetTrend200ResponseInner(
      [void Function(GetMonthlyAssetTrend200ResponseInnerBuilder b)
          updates]) = _$GetMonthlyAssetTrend200ResponseInner;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GetMonthlyAssetTrend200ResponseInnerBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GetMonthlyAssetTrend200ResponseInner> get serializer =>
      _$GetMonthlyAssetTrend200ResponseInnerSerializer();
}

class _$GetMonthlyAssetTrend200ResponseInnerSerializer
    implements PrimitiveSerializer<GetMonthlyAssetTrend200ResponseInner> {
  @override
  final Iterable<Type> types = const [
    GetMonthlyAssetTrend200ResponseInner,
    _$GetMonthlyAssetTrend200ResponseInner
  ];

  @override
  final String wireName = r'GetMonthlyAssetTrend200ResponseInner';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GetMonthlyAssetTrend200ResponseInner object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.month != null) {
      yield r'month';
      yield serializers.serialize(
        object.month,
        specifiedType: const FullType(String),
      );
    }
    if (object.totalBalance != null) {
      yield r'total_balance';
      yield serializers.serialize(
        object.totalBalance,
        specifiedType: const FullType(double),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    GetMonthlyAssetTrend200ResponseInner object, {
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
    required GetMonthlyAssetTrend200ResponseInnerBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'month':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.month = valueDes;
          break;
        case r'total_balance':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.totalBalance = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GetMonthlyAssetTrend200ResponseInner deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GetMonthlyAssetTrend200ResponseInnerBuilder();
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
