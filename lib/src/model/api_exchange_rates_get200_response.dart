//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'date.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'api_exchange_rates_get200_response.g.dart';

/// ApiExchangeRatesGet200Response
///
/// Properties:
/// * [rates] - Exchange rates with currency codes as keys and rates as values.
/// * [base_] - Base currency for the exchange rates.
/// * [date] - The date when the exchange rates were last updated.
@BuiltValue()
abstract class ApiExchangeRatesGet200Response
    implements
        Built<ApiExchangeRatesGet200Response,
            ApiExchangeRatesGet200ResponseBuilder> {
  /// Exchange rates with currency codes as keys and rates as values.
  @BuiltValueField(wireName: r'rates')
  BuiltMap<String, num>? get rates;

  /// Base currency for the exchange rates.
  @BuiltValueField(wireName: r'base')
  String? get base_;

  /// The date when the exchange rates were last updated.
  @BuiltValueField(wireName: r'date')
  Date? get date;

  ApiExchangeRatesGet200Response._();

  factory ApiExchangeRatesGet200Response(
          [void Function(ApiExchangeRatesGet200ResponseBuilder b) updates]) =
      _$ApiExchangeRatesGet200Response;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ApiExchangeRatesGet200ResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ApiExchangeRatesGet200Response> get serializer =>
      _$ApiExchangeRatesGet200ResponseSerializer();
}

class _$ApiExchangeRatesGet200ResponseSerializer
    implements PrimitiveSerializer<ApiExchangeRatesGet200Response> {
  @override
  final Iterable<Type> types = const [
    ApiExchangeRatesGet200Response,
    _$ApiExchangeRatesGet200Response
  ];

  @override
  final String wireName = r'ApiExchangeRatesGet200Response';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ApiExchangeRatesGet200Response object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.rates != null) {
      yield r'rates';
      yield serializers.serialize(
        object.rates,
        specifiedType:
            const FullType(BuiltMap, [FullType(String), FullType(num)]),
      );
    }
    if (object.base_ != null) {
      yield r'base';
      yield serializers.serialize(
        object.base_,
        specifiedType: const FullType(String),
      );
    }
    if (object.date != null) {
      yield r'date';
      yield serializers.serialize(
        object.date,
        specifiedType: const FullType(Date),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ApiExchangeRatesGet200Response object, {
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
    required ApiExchangeRatesGet200ResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'rates':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltMap, [FullType(String), FullType(num)]),
          ) as BuiltMap<String, num>;
          result.rates.replace(valueDes);
          break;
        case r'base':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.base_ = valueDes;
          break;
        case r'date':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Date),
          ) as Date;
          result.date = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ApiExchangeRatesGet200Response deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ApiExchangeRatesGet200ResponseBuilder();
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
