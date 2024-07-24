//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'asset_transaction_request.g.dart';

/// AssetTransactionRequest
///
/// Properties:
/// * [assetId]
/// * [transactionType]
/// * [description]
/// * [transactionDate]
/// * [exchangeRate]
/// * [shares]
/// * [pricePerShare]
/// * [currentPricePerShare]
@BuiltValue()
abstract class AssetTransactionRequest
    implements Built<AssetTransactionRequest, AssetTransactionRequestBuilder> {
  @BuiltValueField(wireName: r'asset_id')
  int? get assetId;

  @BuiltValueField(wireName: r'transaction_type')
  AssetTransactionRequestTransactionTypeEnum? get transactionType;
  // enum transactionTypeEnum {  sell,  buy,  };

  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'transaction_date')
  DateTime? get transactionDate;

  @BuiltValueField(wireName: r'exchange_rate')
  double? get exchangeRate;

  @BuiltValueField(wireName: r'shares')
  int? get shares;

  @BuiltValueField(wireName: r'price_per_share')
  double? get pricePerShare;

  @BuiltValueField(wireName: r'current_price_per_share')
  double? get currentPricePerShare;

  AssetTransactionRequest._();

  factory AssetTransactionRequest(
          [void Function(AssetTransactionRequestBuilder b) updates]) =
      _$AssetTransactionRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AssetTransactionRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AssetTransactionRequest> get serializer =>
      _$AssetTransactionRequestSerializer();
}

class _$AssetTransactionRequestSerializer
    implements PrimitiveSerializer<AssetTransactionRequest> {
  @override
  final Iterable<Type> types = const [
    AssetTransactionRequest,
    _$AssetTransactionRequest
  ];

  @override
  final String wireName = r'AssetTransactionRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AssetTransactionRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.assetId != null) {
      yield r'asset_id';
      yield serializers.serialize(
        object.assetId,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.transactionType != null) {
      yield r'transaction_type';
      yield serializers.serialize(
        object.transactionType,
        specifiedType:
            const FullType(AssetTransactionRequestTransactionTypeEnum),
      );
    }
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.transactionDate != null) {
      yield r'transaction_date';
      yield serializers.serialize(
        object.transactionDate,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.exchangeRate != null) {
      yield r'exchange_rate';
      yield serializers.serialize(
        object.exchangeRate,
        specifiedType: const FullType.nullable(double),
      );
    }
    if (object.shares != null) {
      yield r'shares';
      yield serializers.serialize(
        object.shares,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.pricePerShare != null) {
      yield r'price_per_share';
      yield serializers.serialize(
        object.pricePerShare,
        specifiedType: const FullType.nullable(double),
      );
    }
    if (object.currentPricePerShare != null) {
      yield r'current_price_per_share';
      yield serializers.serialize(
        object.currentPricePerShare,
        specifiedType: const FullType.nullable(double),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AssetTransactionRequest object, {
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
    required AssetTransactionRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'asset_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.assetId = valueDes;
          break;
        case r'transaction_type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(AssetTransactionRequestTransactionTypeEnum),
          ) as AssetTransactionRequestTransactionTypeEnum;
          result.transactionType = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.description = valueDes;
          break;
        case r'transaction_date':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.transactionDate = valueDes;
          break;
        case r'exchange_rate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(double),
          ) as double?;
          if (valueDes == null) continue;
          result.exchangeRate = valueDes;
          break;
        case r'shares':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.shares = valueDes;
          break;
        case r'price_per_share':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(double),
          ) as double?;
          if (valueDes == null) continue;
          result.pricePerShare = valueDes;
          break;
        case r'current_price_per_share':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(double),
          ) as double?;
          if (valueDes == null) continue;
          result.currentPricePerShare = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AssetTransactionRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AssetTransactionRequestBuilder();
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

class AssetTransactionRequestTransactionTypeEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'sell')
  static const AssetTransactionRequestTransactionTypeEnum sell =
      _$assetTransactionRequestTransactionTypeEnum_sell;
  @BuiltValueEnumConst(wireName: r'buy')
  static const AssetTransactionRequestTransactionTypeEnum buy =
      _$assetTransactionRequestTransactionTypeEnum_buy;

  static Serializer<AssetTransactionRequestTransactionTypeEnum>
      get serializer => _$assetTransactionRequestTransactionTypeEnumSerializer;

  const AssetTransactionRequestTransactionTypeEnum._(super.name);

  static BuiltSet<AssetTransactionRequestTransactionTypeEnum> get values =>
      _$assetTransactionRequestTransactionTypeEnumValues;
  static AssetTransactionRequestTransactionTypeEnum valueOf(String name) =>
      _$assetTransactionRequestTransactionTypeEnumValueOf(name);
}
