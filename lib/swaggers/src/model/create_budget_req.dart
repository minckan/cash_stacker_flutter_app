//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_budget_req.g.dart';

/// CreateBudgetReq
///
/// Properties:
/// * [startDate] - The start date of the budget
/// * [endDate] - The end date of the budget
/// * [amount] - The amount of the budget
/// * [isActive] - Whether the budget is active
@BuiltValue()
abstract class CreateBudgetReq
    implements Built<CreateBudgetReq, CreateBudgetReqBuilder> {
  /// The start date of the budget
  @BuiltValueField(wireName: r'start_date')
  DateTime? get startDate;

  /// The end date of the budget
  @BuiltValueField(wireName: r'end_date')
  DateTime? get endDate;

  /// The amount of the budget
  @BuiltValueField(wireName: r'amount')
  double? get amount;

  /// Whether the budget is active
  @BuiltValueField(wireName: r'isActive')
  bool? get isActive;

  CreateBudgetReq._();

  factory CreateBudgetReq([void Function(CreateBudgetReqBuilder b) updates]) =
      _$CreateBudgetReq;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateBudgetReqBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateBudgetReq> get serializer =>
      _$CreateBudgetReqSerializer();
}

class _$CreateBudgetReqSerializer
    implements PrimitiveSerializer<CreateBudgetReq> {
  @override
  final Iterable<Type> types = const [CreateBudgetReq, _$CreateBudgetReq];

  @override
  final String wireName = r'CreateBudgetReq';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateBudgetReq object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.startDate != null) {
      yield r'start_date';
      yield serializers.serialize(
        object.startDate,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.endDate != null) {
      yield r'end_date';
      yield serializers.serialize(
        object.endDate,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.amount != null) {
      yield r'amount';
      yield serializers.serialize(
        object.amount,
        specifiedType: const FullType(double),
      );
    }
    if (object.isActive != null) {
      yield r'isActive';
      yield serializers.serialize(
        object.isActive,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateBudgetReq object, {
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
    required CreateBudgetReqBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'start_date':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.startDate = valueDes;
          break;
        case r'end_date':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.endDate = valueDes;
          break;
        case r'amount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.amount = valueDes;
          break;
        case r'isActive':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isActive = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateBudgetReq deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateBudgetReqBuilder();
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
