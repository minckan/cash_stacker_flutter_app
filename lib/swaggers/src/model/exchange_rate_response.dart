//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'exchange_rate_response.g.dart';

/// ExchangeRateResponse
///
/// Properties:
/// * [result] - 조회 결과
/// * [curUnit] - 통화코드
/// * [curNm] - 국가/통화명
/// * [ttb] - 전신환(송금) 받으실때
/// * [tts] - 전신환(송금) 보내실때
/// * [dealBasR] - 매매 기준율
/// * [bkpr] - 장부가격
/// * [yyEfeeR] - 년환가료율
/// * [tenDdEfeeR] - 10일환가료율
/// * [kftcDealBasR] - 서울외국환중개 매매기준율
/// * [kftcBkpr] - 서울외국환중개 장부가격
@BuiltValue()
abstract class ExchangeRateResponse
    implements Built<ExchangeRateResponse, ExchangeRateResponseBuilder> {
  /// 조회 결과
  @BuiltValueField(wireName: r'result')
  ExchangeRateResponseResultEnum? get result;
  // enum resultEnum {  1,  2,  3,  4,  };

  /// 통화코드
  @BuiltValueField(wireName: r'cur_unit')
  String? get curUnit;

  /// 국가/통화명
  @BuiltValueField(wireName: r'cur_nm')
  String? get curNm;

  /// 전신환(송금) 받으실때
  @BuiltValueField(wireName: r'ttb')
  String? get ttb;

  /// 전신환(송금) 보내실때
  @BuiltValueField(wireName: r'tts')
  String? get tts;

  /// 매매 기준율
  @BuiltValueField(wireName: r'deal_bas_r')
  String? get dealBasR;

  /// 장부가격
  @BuiltValueField(wireName: r'bkpr')
  String? get bkpr;

  /// 년환가료율
  @BuiltValueField(wireName: r'yy_efee_r')
  String? get yyEfeeR;

  /// 10일환가료율
  @BuiltValueField(wireName: r'ten_dd_efee_r')
  String? get tenDdEfeeR;

  /// 서울외국환중개 매매기준율
  @BuiltValueField(wireName: r'kftc_deal_bas_r')
  String? get kftcDealBasR;

  /// 서울외국환중개 장부가격
  @BuiltValueField(wireName: r'kftc_bkpr')
  String? get kftcBkpr;

  ExchangeRateResponse._();

  factory ExchangeRateResponse(
          [void Function(ExchangeRateResponseBuilder b) updates]) =
      _$ExchangeRateResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ExchangeRateResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ExchangeRateResponse> get serializer =>
      _$ExchangeRateResponseSerializer();
}

class _$ExchangeRateResponseSerializer
    implements PrimitiveSerializer<ExchangeRateResponse> {
  @override
  final Iterable<Type> types = const [
    ExchangeRateResponse,
    _$ExchangeRateResponse
  ];

  @override
  final String wireName = r'ExchangeRateResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ExchangeRateResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.result != null) {
      yield r'result';
      yield serializers.serialize(
        object.result,
        specifiedType: const FullType(ExchangeRateResponseResultEnum),
      );
    }
    if (object.curUnit != null) {
      yield r'cur_unit';
      yield serializers.serialize(
        object.curUnit,
        specifiedType: const FullType(String),
      );
    }
    if (object.curNm != null) {
      yield r'cur_nm';
      yield serializers.serialize(
        object.curNm,
        specifiedType: const FullType(String),
      );
    }
    if (object.ttb != null) {
      yield r'ttb';
      yield serializers.serialize(
        object.ttb,
        specifiedType: const FullType(String),
      );
    }
    if (object.tts != null) {
      yield r'tts';
      yield serializers.serialize(
        object.tts,
        specifiedType: const FullType(String),
      );
    }
    if (object.dealBasR != null) {
      yield r'deal_bas_r';
      yield serializers.serialize(
        object.dealBasR,
        specifiedType: const FullType(String),
      );
    }
    if (object.bkpr != null) {
      yield r'bkpr';
      yield serializers.serialize(
        object.bkpr,
        specifiedType: const FullType(String),
      );
    }
    if (object.yyEfeeR != null) {
      yield r'yy_efee_r';
      yield serializers.serialize(
        object.yyEfeeR,
        specifiedType: const FullType(String),
      );
    }
    if (object.tenDdEfeeR != null) {
      yield r'ten_dd_efee_r';
      yield serializers.serialize(
        object.tenDdEfeeR,
        specifiedType: const FullType(String),
      );
    }
    if (object.kftcDealBasR != null) {
      yield r'kftc_deal_bas_r';
      yield serializers.serialize(
        object.kftcDealBasR,
        specifiedType: const FullType(String),
      );
    }
    if (object.kftcBkpr != null) {
      yield r'kftc_bkpr';
      yield serializers.serialize(
        object.kftcBkpr,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ExchangeRateResponse object, {
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
    required ExchangeRateResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'result':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ExchangeRateResponseResultEnum),
          ) as ExchangeRateResponseResultEnum;
          result.result = valueDes;
          break;
        case r'cur_unit':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.curUnit = valueDes;
          break;
        case r'cur_nm':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.curNm = valueDes;
          break;
        case r'ttb':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.ttb = valueDes;
          break;
        case r'tts':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.tts = valueDes;
          break;
        case r'deal_bas_r':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.dealBasR = valueDes;
          break;
        case r'bkpr':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.bkpr = valueDes;
          break;
        case r'yy_efee_r':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.yyEfeeR = valueDes;
          break;
        case r'ten_dd_efee_r':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.tenDdEfeeR = valueDes;
          break;
        case r'kftc_deal_bas_r':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.kftcDealBasR = valueDes;
          break;
        case r'kftc_bkpr':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.kftcBkpr = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ExchangeRateResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ExchangeRateResponseBuilder();
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

class ExchangeRateResponseResultEnum extends EnumClass {
  /// 조회 결과
  @BuiltValueEnumConst(wireNumber: 1)
  static const ExchangeRateResponseResultEnum number1 =
      _$exchangeRateResponseResultEnum_number1;

  /// 조회 결과
  @BuiltValueEnumConst(wireNumber: 2)
  static const ExchangeRateResponseResultEnum number2 =
      _$exchangeRateResponseResultEnum_number2;

  /// 조회 결과
  @BuiltValueEnumConst(wireNumber: 3)
  static const ExchangeRateResponseResultEnum number3 =
      _$exchangeRateResponseResultEnum_number3;

  /// 조회 결과
  @BuiltValueEnumConst(wireNumber: 4)
  static const ExchangeRateResponseResultEnum number4 =
      _$exchangeRateResponseResultEnum_number4;

  static Serializer<ExchangeRateResponseResultEnum> get serializer =>
      _$exchangeRateResponseResultEnumSerializer;

  const ExchangeRateResponseResultEnum._(super.name);

  static BuiltSet<ExchangeRateResponseResultEnum> get values =>
      _$exchangeRateResponseResultEnumValues;
  static ExchangeRateResponseResultEnum valueOf(String name) =>
      _$exchangeRateResponseResultEnumValueOf(name);
}
