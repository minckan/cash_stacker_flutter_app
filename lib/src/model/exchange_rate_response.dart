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
/// * [RESULT] - 조회 결과
/// * [CUR_UNIT] - 통화코드
/// * [CUR_NM] - 국가/통화명
/// * [TTB] - 전신환(송금) 받으실때
/// * [TTS] - 전신환(송금) 보내실때
/// * [DEAL_BAS_R] - 매매 기준율
/// * [BKPR] - 장부가격
/// * [YY_EFEE_R] - 년환가료율
/// * [TEN_DD_EFEE_R] - 10일환가료율
/// * [KFTC_DEAL_BAS_R] - 서울외국환중개 매매기준율
/// * [KFTC_BKPR] - 서울외국환중개 장부가격
@BuiltValue()
abstract class ExchangeRateResponse
    implements Built<ExchangeRateResponse, ExchangeRateResponseBuilder> {
  /// 조회 결과
  @BuiltValueField(wireName: r'RESULT')
  ExchangeRateResponseRESULTEnum? get RESULT;
  // enum RESULTEnum {  1,  2,  3,  4,  };

  /// 통화코드
  @BuiltValueField(wireName: r'CUR_UNIT')
  String? get CUR_UNIT;

  /// 국가/통화명
  @BuiltValueField(wireName: r'CUR_NM')
  String? get CUR_NM;

  /// 전신환(송금) 받으실때
  @BuiltValueField(wireName: r'TTB')
  String? get TTB;

  /// 전신환(송금) 보내실때
  @BuiltValueField(wireName: r'TTS')
  String? get TTS;

  /// 매매 기준율
  @BuiltValueField(wireName: r'DEAL_BAS_R')
  String? get DEAL_BAS_R;

  /// 장부가격
  @BuiltValueField(wireName: r'BKPR')
  String? get BKPR;

  /// 년환가료율
  @BuiltValueField(wireName: r'YY_EFEE_R')
  String? get YY_EFEE_R;

  /// 10일환가료율
  @BuiltValueField(wireName: r'TEN_DD_EFEE_R')
  String? get TEN_DD_EFEE_R;

  /// 서울외국환중개 매매기준율
  @BuiltValueField(wireName: r'KFTC_DEAL_BAS_R')
  String? get KFTC_DEAL_BAS_R;

  /// 서울외국환중개 장부가격
  @BuiltValueField(wireName: r'KFTC_BKPR')
  String? get KFTC_BKPR;

  ExchangeRateResponse._();

  factory ExchangeRateResponse([void updates(ExchangeRateResponseBuilder b)]) =
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
    if (object.RESULT != null) {
      yield r'RESULT';
      yield serializers.serialize(
        object.RESULT,
        specifiedType: const FullType(ExchangeRateResponseRESULTEnum),
      );
    }
    if (object.CUR_UNIT != null) {
      yield r'CUR_UNIT';
      yield serializers.serialize(
        object.CUR_UNIT,
        specifiedType: const FullType(String),
      );
    }
    if (object.CUR_NM != null) {
      yield r'CUR_NM';
      yield serializers.serialize(
        object.CUR_NM,
        specifiedType: const FullType(String),
      );
    }
    if (object.TTB != null) {
      yield r'TTB';
      yield serializers.serialize(
        object.TTB,
        specifiedType: const FullType(String),
      );
    }
    if (object.TTS != null) {
      yield r'TTS';
      yield serializers.serialize(
        object.TTS,
        specifiedType: const FullType(String),
      );
    }
    if (object.DEAL_BAS_R != null) {
      yield r'DEAL_BAS_R';
      yield serializers.serialize(
        object.DEAL_BAS_R,
        specifiedType: const FullType(String),
      );
    }
    if (object.BKPR != null) {
      yield r'BKPR';
      yield serializers.serialize(
        object.BKPR,
        specifiedType: const FullType(String),
      );
    }
    if (object.YY_EFEE_R != null) {
      yield r'YY_EFEE_R';
      yield serializers.serialize(
        object.YY_EFEE_R,
        specifiedType: const FullType(String),
      );
    }
    if (object.TEN_DD_EFEE_R != null) {
      yield r'TEN_DD_EFEE_R';
      yield serializers.serialize(
        object.TEN_DD_EFEE_R,
        specifiedType: const FullType(String),
      );
    }
    if (object.KFTC_DEAL_BAS_R != null) {
      yield r'KFTC_DEAL_BAS_R';
      yield serializers.serialize(
        object.KFTC_DEAL_BAS_R,
        specifiedType: const FullType(String),
      );
    }
    if (object.KFTC_BKPR != null) {
      yield r'KFTC_BKPR';
      yield serializers.serialize(
        object.KFTC_BKPR,
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
        case r'RESULT':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ExchangeRateResponseRESULTEnum),
          ) as ExchangeRateResponseRESULTEnum;
          result.RESULT = valueDes;
          break;
        case r'CUR_UNIT':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.CUR_UNIT = valueDes;
          break;
        case r'CUR_NM':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.CUR_NM = valueDes;
          break;
        case r'TTB':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.TTB = valueDes;
          break;
        case r'TTS':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.TTS = valueDes;
          break;
        case r'DEAL_BAS_R':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.DEAL_BAS_R = valueDes;
          break;
        case r'BKPR':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.BKPR = valueDes;
          break;
        case r'YY_EFEE_R':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.YY_EFEE_R = valueDes;
          break;
        case r'TEN_DD_EFEE_R':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.TEN_DD_EFEE_R = valueDes;
          break;
        case r'KFTC_DEAL_BAS_R':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.KFTC_DEAL_BAS_R = valueDes;
          break;
        case r'KFTC_BKPR':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.KFTC_BKPR = valueDes;
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

class ExchangeRateResponseRESULTEnum extends EnumClass {
  /// 조회 결과
  @BuiltValueEnumConst(wireNumber: 1)
  static const ExchangeRateResponseRESULTEnum number1 =
      _$exchangeRateResponseRESULTEnum_number1;

  /// 조회 결과
  @BuiltValueEnumConst(wireNumber: 2)
  static const ExchangeRateResponseRESULTEnum number2 =
      _$exchangeRateResponseRESULTEnum_number2;

  /// 조회 결과
  @BuiltValueEnumConst(wireNumber: 3)
  static const ExchangeRateResponseRESULTEnum number3 =
      _$exchangeRateResponseRESULTEnum_number3;

  /// 조회 결과
  @BuiltValueEnumConst(wireNumber: 4)
  static const ExchangeRateResponseRESULTEnum number4 =
      _$exchangeRateResponseRESULTEnum_number4;

  static Serializer<ExchangeRateResponseRESULTEnum> get serializer =>
      _$exchangeRateResponseRESULTEnumSerializer;

  const ExchangeRateResponseRESULTEnum._(String name) : super(name);

  static BuiltSet<ExchangeRateResponseRESULTEnum> get values =>
      _$exchangeRateResponseRESULTEnumValues;
  static ExchangeRateResponseRESULTEnum valueOf(String name) =>
      _$exchangeRateResponseRESULTEnumValueOf(name);
}
