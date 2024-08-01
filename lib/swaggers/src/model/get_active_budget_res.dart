//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'budget.dart';
import 'expendable_budget.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'get_active_budget_res.g.dart';

/// GetActiveBudgetRes
///
/// Properties:
/// * [budget]
/// * [expendableBudget]
@BuiltValue()
abstract class GetActiveBudgetRes
    implements Built<GetActiveBudgetRes, GetActiveBudgetResBuilder> {
  @BuiltValueField(wireName: r'budget')
  Budget? get budget;

  @BuiltValueField(wireName: r'expendableBudget')
  ExpendableBudget? get expendableBudget;

  GetActiveBudgetRes._();

  factory GetActiveBudgetRes(
          [void Function(GetActiveBudgetResBuilder b) updates]) =
      _$GetActiveBudgetRes;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GetActiveBudgetResBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GetActiveBudgetRes> get serializer =>
      _$GetActiveBudgetResSerializer();
}

class _$GetActiveBudgetResSerializer
    implements PrimitiveSerializer<GetActiveBudgetRes> {
  @override
  final Iterable<Type> types = const [GetActiveBudgetRes, _$GetActiveBudgetRes];

  @override
  final String wireName = r'GetActiveBudgetRes';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GetActiveBudgetRes object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.budget != null) {
      yield r'budget';
      yield serializers.serialize(
        object.budget,
        specifiedType: const FullType(Budget),
      );
    }
    if (object.expendableBudget != null) {
      yield r'expendableBudget';
      yield serializers.serialize(
        object.expendableBudget,
        specifiedType: const FullType(ExpendableBudget),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    GetActiveBudgetRes object, {
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
    required GetActiveBudgetResBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'budget':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Budget),
          ) as Budget;
          result.budget.replace(valueDes);
          break;
        case r'expendableBudget':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ExpendableBudget),
          ) as ExpendableBudget;
          result.expendableBudget.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GetActiveBudgetRes deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GetActiveBudgetResBuilder();
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
