//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_financial_tracker_transaction_req.g.dart';

/// UpdateFinancialTrackerTransactionReq
///
/// Properties:
/// * [categoryId]
/// * [amount]
/// * [transactionType]
/// * [description]
/// * [transactionDate]
@BuiltValue()
abstract class UpdateFinancialTrackerTransactionReq
    implements
        Built<UpdateFinancialTrackerTransactionReq,
            UpdateFinancialTrackerTransactionReqBuilder> {
  @BuiltValueField(wireName: r'category_id')
  int? get categoryId;

  @BuiltValueField(wireName: r'amount')
  double? get amount;

  @BuiltValueField(wireName: r'transaction_type')
  String? get transactionType;

  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'transaction_date')
  DateTime? get transactionDate;

  UpdateFinancialTrackerTransactionReq._();

  factory UpdateFinancialTrackerTransactionReq(
      [void Function(UpdateFinancialTrackerTransactionReqBuilder b)
          updates]) = _$UpdateFinancialTrackerTransactionReq;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateFinancialTrackerTransactionReqBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateFinancialTrackerTransactionReq> get serializer =>
      _$UpdateFinancialTrackerTransactionReqSerializer();
}

class _$UpdateFinancialTrackerTransactionReqSerializer
    implements PrimitiveSerializer<UpdateFinancialTrackerTransactionReq> {
  @override
  final Iterable<Type> types = const [
    UpdateFinancialTrackerTransactionReq,
    _$UpdateFinancialTrackerTransactionReq
  ];

  @override
  final String wireName = r'UpdateFinancialTrackerTransactionReq';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateFinancialTrackerTransactionReq object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.categoryId != null) {
      yield r'category_id';
      yield serializers.serialize(
        object.categoryId,
        specifiedType: const FullType(int),
      );
    }
    if (object.amount != null) {
      yield r'amount';
      yield serializers.serialize(
        object.amount,
        specifiedType: const FullType(double),
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
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdateFinancialTrackerTransactionReq object, {
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
    required UpdateFinancialTrackerTransactionReqBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'category_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.categoryId = valueDes;
          break;
        case r'amount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpdateFinancialTrackerTransactionReq deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateFinancialTrackerTransactionReqBuilder();
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
