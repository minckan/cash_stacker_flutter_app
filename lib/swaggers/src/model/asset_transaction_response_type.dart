//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'asset_transaction_response_type.g.dart';

/// AssetTransactionResponseType
///
/// Properties:
/// * [transactionId]
/// * [transactionType]
/// * [description]
/// * [transactionDate]
/// * [exchangeRate]
/// * [shares]
/// * [pricePerShare]
/// * [currentPricePerShare]
/// * [balance]
/// * [currencyCode]
@BuiltValue()
abstract class AssetTransactionResponseType
    implements
        Built<AssetTransactionResponseType,
            AssetTransactionResponseTypeBuilder> {
  @BuiltValueField(wireName: r'transactionId')
  int? get transactionId;

  @BuiltValueField(wireName: r'transactionType')
  AssetTransactionResponseTypeTransactionTypeEnum? get transactionType;
  // enum transactionTypeEnum {  sell,  buy,  };

  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'transactionDate')
  DateTime? get transactionDate;

  @BuiltValueField(wireName: r'exchangeRate')
  num? get exchangeRate;

  @BuiltValueField(wireName: r'shares')
  int? get shares;

  @BuiltValueField(wireName: r'pricePerShare')
  num? get pricePerShare;

  @BuiltValueField(wireName: r'currentPricePerShare')
  num? get currentPricePerShare;

  @BuiltValueField(wireName: r'balance')
  num? get balance;

  @BuiltValueField(wireName: r'currencyCode')
  String? get currencyCode;

  AssetTransactionResponseType._();

  factory AssetTransactionResponseType(
          [void updates(AssetTransactionResponseTypeBuilder b)]) =
      _$AssetTransactionResponseType;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AssetTransactionResponseTypeBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AssetTransactionResponseType> get serializer =>
      _$AssetTransactionResponseTypeSerializer();
}

class _$AssetTransactionResponseTypeSerializer
    implements PrimitiveSerializer<AssetTransactionResponseType> {
  @override
  final Iterable<Type> types = const [
    AssetTransactionResponseType,
    _$AssetTransactionResponseType
  ];

  @override
  final String wireName = r'AssetTransactionResponseType';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AssetTransactionResponseType object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.transactionId != null) {
      yield r'transactionId';
      yield serializers.serialize(
        object.transactionId,
        specifiedType: const FullType(int),
      );
    }
    if (object.transactionType != null) {
      yield r'transactionType';
      yield serializers.serialize(
        object.transactionType,
        specifiedType:
            const FullType(AssetTransactionResponseTypeTransactionTypeEnum),
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
      yield r'transactionDate';
      yield serializers.serialize(
        object.transactionDate,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.exchangeRate != null) {
      yield r'exchangeRate';
      yield serializers.serialize(
        object.exchangeRate,
        specifiedType: const FullType.nullable(num),
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
      yield r'pricePerShare';
      yield serializers.serialize(
        object.pricePerShare,
        specifiedType: const FullType.nullable(num),
      );
    }
    if (object.currentPricePerShare != null) {
      yield r'currentPricePerShare';
      yield serializers.serialize(
        object.currentPricePerShare,
        specifiedType: const FullType.nullable(num),
      );
    }
    if (object.balance != null) {
      yield r'balance';
      yield serializers.serialize(
        object.balance,
        specifiedType: const FullType.nullable(num),
      );
    }
    if (object.currencyCode != null) {
      yield r'currencyCode';
      yield serializers.serialize(
        object.currencyCode,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AssetTransactionResponseType object, {
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
    required AssetTransactionResponseTypeBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'transactionId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.transactionId = valueDes;
          break;
        case r'transactionType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(AssetTransactionResponseTypeTransactionTypeEnum),
          ) as AssetTransactionResponseTypeTransactionTypeEnum;
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
        case r'transactionDate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.transactionDate = valueDes;
          break;
        case r'exchangeRate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
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
        case r'pricePerShare':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.pricePerShare = valueDes;
          break;
        case r'currentPricePerShare':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.currentPricePerShare = valueDes;
          break;
        case r'balance':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.balance = valueDes;
          break;
        case r'currencyCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.currencyCode = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AssetTransactionResponseType deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AssetTransactionResponseTypeBuilder();
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

class AssetTransactionResponseTypeTransactionTypeEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'sell')
  static const AssetTransactionResponseTypeTransactionTypeEnum sell =
      _$assetTransactionResponseTypeTransactionTypeEnum_sell;
  @BuiltValueEnumConst(wireName: r'buy')
  static const AssetTransactionResponseTypeTransactionTypeEnum buy =
      _$assetTransactionResponseTypeTransactionTypeEnum_buy;

  static Serializer<AssetTransactionResponseTypeTransactionTypeEnum>
      get serializer =>
          _$assetTransactionResponseTypeTransactionTypeEnumSerializer;

  const AssetTransactionResponseTypeTransactionTypeEnum._(String name)
      : super(name);

  static BuiltSet<AssetTransactionResponseTypeTransactionTypeEnum> get values =>
      _$assetTransactionResponseTypeTransactionTypeEnumValues;
  static AssetTransactionResponseTypeTransactionTypeEnum valueOf(String name) =>
      _$assetTransactionResponseTypeTransactionTypeEnumValueOf(name);
}
