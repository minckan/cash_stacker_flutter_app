//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'date.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'asset_info.g.dart';

/// AssetInfo
///
/// Properties:
/// * [id] - 자산 아이디
/// * [name] - 자산 이름
/// * [amount] - 수량
/// * [ratio] - 비율(비중)
/// * [initialPurchaseDate] - 최초 편입일
/// * [buyingExchangeRate] - 매입 환율
/// * [totalBuyingAmountKrw] - 원화 투자 총액
/// * [buyingSinglePriceKrw] - 원화 평균 매입가
/// * [currentSinglePriceKrw] - 원화 가장 최근 입력받은 현재가
/// * [totalEvaluationAmountKrw] - 원화 현재가 총금액
/// * [profitLossRateKrw] - 원화 원화환산 수익률
/// * [totalCurrentAmountKrw] - 원화 현재가 총 평가액
/// * [totalBuyingAmountForeign] - 외화 투자원금 총액
/// * [buyingSinglePriceForeign] - 외화 평균 매입가
/// * [currentSinglePriceForeign] - 외화 가장 최근 입력 받은 현재가
/// * [totalEvaluationAmountForeign] - 외화 현재가 총금액
/// * [profitLossRateForeign] - 외화 외화 수익률 (외화 차제로 얼마나 수익이 있는지)
/// * [totalCurrentAmountForeign] - 외화 현재가 총 평가액
@BuiltValue()
abstract class AssetInfo implements Built<AssetInfo, AssetInfoBuilder> {
  /// 자산 아이디
  @BuiltValueField(wireName: r'id')
  num? get id;

  /// 자산 이름
  @BuiltValueField(wireName: r'name')
  String? get name;

  /// 수량
  @BuiltValueField(wireName: r'amount')
  num? get amount;

  /// 비율(비중)
  @BuiltValueField(wireName: r'ratio')
  num? get ratio;

  /// 최초 편입일
  @BuiltValueField(wireName: r'initialPurchaseDate')
  Date? get initialPurchaseDate;

  /// 매입 환율
  @BuiltValueField(wireName: r'buyingExchangeRate')
  num? get buyingExchangeRate;

  /// 원화 투자 총액
  @BuiltValueField(wireName: r'totalBuyingAmountKrw')
  num? get totalBuyingAmountKrw;

  /// 원화 평균 매입가
  @BuiltValueField(wireName: r'buyingSinglePriceKrw')
  num? get buyingSinglePriceKrw;

  /// 원화 가장 최근 입력받은 현재가
  @BuiltValueField(wireName: r'currentSinglePriceKrw')
  num? get currentSinglePriceKrw;

  /// 원화 현재가 총금액
  @BuiltValueField(wireName: r'totalEvaluationAmountKrw')
  num? get totalEvaluationAmountKrw;

  /// 원화 원화환산 수익률
  @BuiltValueField(wireName: r'profitLossRateKrw')
  num? get profitLossRateKrw;

  /// 원화 현재가 총 평가액
  @BuiltValueField(wireName: r'totalCurrentAmountKrw')
  num? get totalCurrentAmountKrw;

  /// 외화 투자원금 총액
  @BuiltValueField(wireName: r'totalBuyingAmountForeign')
  num? get totalBuyingAmountForeign;

  /// 외화 평균 매입가
  @BuiltValueField(wireName: r'buyingSinglePriceForeign')
  num? get buyingSinglePriceForeign;

  /// 외화 가장 최근 입력 받은 현재가
  @BuiltValueField(wireName: r'currentSinglePriceForeign')
  num? get currentSinglePriceForeign;

  /// 외화 현재가 총금액
  @BuiltValueField(wireName: r'totalEvaluationAmountForeign')
  num? get totalEvaluationAmountForeign;

  /// 외화 외화 수익률 (외화 차제로 얼마나 수익이 있는지)
  @BuiltValueField(wireName: r'profitLossRateForeign')
  num? get profitLossRateForeign;

  /// 외화 현재가 총 평가액
  @BuiltValueField(wireName: r'totalCurrentAmountForeign')
  num? get totalCurrentAmountForeign;

  AssetInfo._();

  factory AssetInfo([void Function(AssetInfoBuilder b) updates]) = _$AssetInfo;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AssetInfoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AssetInfo> get serializer => _$AssetInfoSerializer();
}

class _$AssetInfoSerializer implements PrimitiveSerializer<AssetInfo> {
  @override
  final Iterable<Type> types = const [AssetInfo, _$AssetInfo];

  @override
  final String wireName = r'AssetInfo';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AssetInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(num),
      );
    }
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType(String),
      );
    }
    if (object.amount != null) {
      yield r'amount';
      yield serializers.serialize(
        object.amount,
        specifiedType: const FullType.nullable(num),
      );
    }
    if (object.ratio != null) {
      yield r'ratio';
      yield serializers.serialize(
        object.ratio,
        specifiedType: const FullType(num),
      );
    }
    if (object.initialPurchaseDate != null) {
      yield r'initialPurchaseDate';
      yield serializers.serialize(
        object.initialPurchaseDate,
        specifiedType: const FullType(Date),
      );
    }
    if (object.buyingExchangeRate != null) {
      yield r'buyingExchangeRate';
      yield serializers.serialize(
        object.buyingExchangeRate,
        specifiedType: const FullType.nullable(num),
      );
    }
    if (object.totalBuyingAmountKrw != null) {
      yield r'totalBuyingAmountKrw';
      yield serializers.serialize(
        object.totalBuyingAmountKrw,
        specifiedType: const FullType.nullable(num),
      );
    }
    if (object.buyingSinglePriceKrw != null) {
      yield r'buyingSinglePriceKrw';
      yield serializers.serialize(
        object.buyingSinglePriceKrw,
        specifiedType: const FullType.nullable(num),
      );
    }
    if (object.currentSinglePriceKrw != null) {
      yield r'currentSinglePriceKrw';
      yield serializers.serialize(
        object.currentSinglePriceKrw,
        specifiedType: const FullType.nullable(num),
      );
    }
    if (object.totalEvaluationAmountKrw != null) {
      yield r'totalEvaluationAmountKrw';
      yield serializers.serialize(
        object.totalEvaluationAmountKrw,
        specifiedType: const FullType.nullable(num),
      );
    }
    if (object.profitLossRateKrw != null) {
      yield r'profitLossRateKrw';
      yield serializers.serialize(
        object.profitLossRateKrw,
        specifiedType: const FullType.nullable(num),
      );
    }
    if (object.totalCurrentAmountKrw != null) {
      yield r'totalCurrentAmountKrw';
      yield serializers.serialize(
        object.totalCurrentAmountKrw,
        specifiedType: const FullType.nullable(num),
      );
    }
    if (object.totalBuyingAmountForeign != null) {
      yield r'totalBuyingAmountForeign';
      yield serializers.serialize(
        object.totalBuyingAmountForeign,
        specifiedType: const FullType.nullable(num),
      );
    }
    if (object.buyingSinglePriceForeign != null) {
      yield r'buyingSinglePriceForeign';
      yield serializers.serialize(
        object.buyingSinglePriceForeign,
        specifiedType: const FullType.nullable(num),
      );
    }
    if (object.currentSinglePriceForeign != null) {
      yield r'currentSinglePriceForeign';
      yield serializers.serialize(
        object.currentSinglePriceForeign,
        specifiedType: const FullType.nullable(num),
      );
    }
    if (object.totalEvaluationAmountForeign != null) {
      yield r'totalEvaluationAmountForeign';
      yield serializers.serialize(
        object.totalEvaluationAmountForeign,
        specifiedType: const FullType.nullable(num),
      );
    }
    if (object.profitLossRateForeign != null) {
      yield r'profitLossRateForeign';
      yield serializers.serialize(
        object.profitLossRateForeign,
        specifiedType: const FullType.nullable(num),
      );
    }
    if (object.totalCurrentAmountForeign != null) {
      yield r'totalCurrentAmountForeign';
      yield serializers.serialize(
        object.totalCurrentAmountForeign,
        specifiedType: const FullType.nullable(num),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AssetInfo object, {
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
    required AssetInfoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.id = valueDes;
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'amount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.amount = valueDes;
          break;
        case r'ratio':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.ratio = valueDes;
          break;
        case r'initialPurchaseDate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Date),
          ) as Date;
          result.initialPurchaseDate = valueDes;
          break;
        case r'buyingExchangeRate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.buyingExchangeRate = valueDes;
          break;
        case r'totalBuyingAmountKrw':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.totalBuyingAmountKrw = valueDes;
          break;
        case r'buyingSinglePriceKrw':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.buyingSinglePriceKrw = valueDes;
          break;
        case r'currentSinglePriceKrw':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.currentSinglePriceKrw = valueDes;
          break;
        case r'totalEvaluationAmountKrw':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.totalEvaluationAmountKrw = valueDes;
          break;
        case r'profitLossRateKrw':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.profitLossRateKrw = valueDes;
          break;
        case r'totalCurrentAmountKrw':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.totalCurrentAmountKrw = valueDes;
          break;
        case r'totalBuyingAmountForeign':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.totalBuyingAmountForeign = valueDes;
          break;
        case r'buyingSinglePriceForeign':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.buyingSinglePriceForeign = valueDes;
          break;
        case r'currentSinglePriceForeign':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.currentSinglePriceForeign = valueDes;
          break;
        case r'totalEvaluationAmountForeign':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.totalEvaluationAmountForeign = valueDes;
          break;
        case r'profitLossRateForeign':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.profitLossRateForeign = valueDes;
          break;
        case r'totalCurrentAmountForeign':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.totalCurrentAmountForeign = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AssetInfo deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AssetInfoBuilder();
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
