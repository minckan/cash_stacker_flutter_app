//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'transaction.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'get_monthly_asset_transaction_res.g.dart';

/// GetMonthlyAssetTransactionRes
///
/// Properties:
/// * [netTotal] - Total amount of transactions
/// * [expense] - Total expense amount
/// * [income] - Total income amount
/// * [transactions]
@BuiltValue()
abstract class GetMonthlyAssetTransactionRes
    implements
        Built<GetMonthlyAssetTransactionRes,
            GetMonthlyAssetTransactionResBuilder> {
  /// Total amount of transactions
  @BuiltValueField(wireName: r'netTotal')
  num? get netTotal;

  /// Total expense amount
  @BuiltValueField(wireName: r'expense')
  num? get expense;

  /// Total income amount
  @BuiltValueField(wireName: r'income')
  num? get income;

  @BuiltValueField(wireName: r'transactions')
  BuiltList<Transaction>? get transactions;

  GetMonthlyAssetTransactionRes._();

  factory GetMonthlyAssetTransactionRes(
          [void Function(GetMonthlyAssetTransactionResBuilder b) updates]) =
      _$GetMonthlyAssetTransactionRes;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GetMonthlyAssetTransactionResBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GetMonthlyAssetTransactionRes> get serializer =>
      _$GetMonthlyAssetTransactionResSerializer();
}

class _$GetMonthlyAssetTransactionResSerializer
    implements PrimitiveSerializer<GetMonthlyAssetTransactionRes> {
  @override
  final Iterable<Type> types = const [
    GetMonthlyAssetTransactionRes,
    _$GetMonthlyAssetTransactionRes
  ];

  @override
  final String wireName = r'GetMonthlyAssetTransactionRes';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GetMonthlyAssetTransactionRes object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.netTotal != null) {
      yield r'netTotal';
      yield serializers.serialize(
        object.netTotal,
        specifiedType: const FullType(num),
      );
    }
    if (object.expense != null) {
      yield r'expense';
      yield serializers.serialize(
        object.expense,
        specifiedType: const FullType(num),
      );
    }
    if (object.income != null) {
      yield r'income';
      yield serializers.serialize(
        object.income,
        specifiedType: const FullType(num),
      );
    }
    if (object.transactions != null) {
      yield r'transactions';
      yield serializers.serialize(
        object.transactions,
        specifiedType: const FullType(BuiltList, [FullType(Transaction)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    GetMonthlyAssetTransactionRes object, {
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
    required GetMonthlyAssetTransactionResBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'netTotal':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.netTotal = valueDes;
          break;
        case r'expense':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.expense = valueDes;
          break;
        case r'income':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.income = valueDes;
          break;
        case r'transactions':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(Transaction)]),
          ) as BuiltList<Transaction>;
          result.transactions.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GetMonthlyAssetTransactionRes deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GetMonthlyAssetTransactionResBuilder();
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
