//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'transaction.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'workspace_id_finance_monthly_month_key_get200_response.g.dart';

/// WorkspaceIdFinanceMonthlyMonthKeyGet200Response
///
/// Properties:
/// * [netTotal] - Total amount of transactions
/// * [expense] - Total expense amount
/// * [income] - Total income amount
/// * [transactions]
@BuiltValue()
abstract class WorkspaceIdFinanceMonthlyMonthKeyGet200Response
    implements
        Built<WorkspaceIdFinanceMonthlyMonthKeyGet200Response,
            WorkspaceIdFinanceMonthlyMonthKeyGet200ResponseBuilder> {
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

  WorkspaceIdFinanceMonthlyMonthKeyGet200Response._();

  factory WorkspaceIdFinanceMonthlyMonthKeyGet200Response(
      [void Function(WorkspaceIdFinanceMonthlyMonthKeyGet200ResponseBuilder b)
          updates]) = _$WorkspaceIdFinanceMonthlyMonthKeyGet200Response;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(
          WorkspaceIdFinanceMonthlyMonthKeyGet200ResponseBuilder b) =>
      b;

  @BuiltValueSerializer(custom: true)
  static Serializer<WorkspaceIdFinanceMonthlyMonthKeyGet200Response>
      get serializer =>
          _$WorkspaceIdFinanceMonthlyMonthKeyGet200ResponseSerializer();
}

class _$WorkspaceIdFinanceMonthlyMonthKeyGet200ResponseSerializer
    implements
        PrimitiveSerializer<WorkspaceIdFinanceMonthlyMonthKeyGet200Response> {
  @override
  final Iterable<Type> types = const [
    WorkspaceIdFinanceMonthlyMonthKeyGet200Response,
    _$WorkspaceIdFinanceMonthlyMonthKeyGet200Response
  ];

  @override
  final String wireName = r'WorkspaceIdFinanceMonthlyMonthKeyGet200Response';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    WorkspaceIdFinanceMonthlyMonthKeyGet200Response object, {
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
    WorkspaceIdFinanceMonthlyMonthKeyGet200Response object, {
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
    required WorkspaceIdFinanceMonthlyMonthKeyGet200ResponseBuilder result,
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
  WorkspaceIdFinanceMonthlyMonthKeyGet200Response deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = WorkspaceIdFinanceMonthlyMonthKeyGet200ResponseBuilder();
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
