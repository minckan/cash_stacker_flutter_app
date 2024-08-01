//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_asset_transaction_by_id_req.g.dart';

/// UpdateAssetTransactionByIdReq
///
/// Properties:
/// * [amount]
/// * [transactionType]
/// * [description]
/// * [transactionDate]
/// * [exchangeRate]
/// * [shares]
/// * [pricePerShare]
@BuiltValue()
abstract class UpdateAssetTransactionByIdReq
    implements
        Built<UpdateAssetTransactionByIdReq,
            UpdateAssetTransactionByIdReqBuilder> {
  @BuiltValueField(wireName: r'amount')
  num? get amount;

  @BuiltValueField(wireName: r'transaction_type')
  String? get transactionType;

  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'transaction_date')
  DateTime? get transactionDate;

  @BuiltValueField(wireName: r'exchange_rate')
  num? get exchangeRate;

  @BuiltValueField(wireName: r'shares')
  num? get shares;

  @BuiltValueField(wireName: r'price_per_share')
  num? get pricePerShare;

  UpdateAssetTransactionByIdReq._();

  factory UpdateAssetTransactionByIdReq(
          [void Function(UpdateAssetTransactionByIdReqBuilder b) updates]) =
      _$UpdateAssetTransactionByIdReq;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateAssetTransactionByIdReqBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateAssetTransactionByIdReq> get serializer =>
      _$UpdateAssetTransactionByIdReqSerializer();
}

class _$UpdateAssetTransactionByIdReqSerializer
    implements PrimitiveSerializer<UpdateAssetTransactionByIdReq> {
  @override
  final Iterable<Type> types = const [
    UpdateAssetTransactionByIdReq,
    _$UpdateAssetTransactionByIdReq
  ];

  @override
  final String wireName = r'UpdateAssetTransactionByIdReq';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateAssetTransactionByIdReq object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.amount != null) {
      yield r'amount';
      yield serializers.serialize(
        object.amount,
        specifiedType: const FullType(num),
      );
    }
    if (object.transactionType != null) {
      yield r'transaction_type';
      yield serializers.serialize(
        object.transactionType,
        specifiedType: const FullType(String),
      );
    }
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType(String),
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
        specifiedType: const FullType(num),
      );
    }
    if (object.shares != null) {
      yield r'shares';
      yield serializers.serialize(
        object.shares,
        specifiedType: const FullType(num),
      );
    }
    if (object.pricePerShare != null) {
      yield r'price_per_share';
      yield serializers.serialize(
        object.pricePerShare,
        specifiedType: const FullType(num),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdateAssetTransactionByIdReq object, {
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
    required UpdateAssetTransactionByIdReqBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'amount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.amount = valueDes;
          break;
        case r'transaction_type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.transactionType = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
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
            specifiedType: const FullType(num),
          ) as num;
          result.exchangeRate = valueDes;
          break;
        case r'shares':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.shares = valueDes;
          break;
        case r'price_per_share':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.pricePerShare = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpdateAssetTransactionByIdReq deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateAssetTransactionByIdReqBuilder();
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
