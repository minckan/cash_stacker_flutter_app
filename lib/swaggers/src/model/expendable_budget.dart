//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'expendable_budget.g.dart';

/// ExpendableBudget
///
/// Properties:
/// * [expendableBudget]
/// * [percentage]
@BuiltValue()
abstract class ExpendableBudget
    implements Built<ExpendableBudget, ExpendableBudgetBuilder> {
  @BuiltValueField(wireName: r'expendableBudget')
  num? get expendableBudget;

  @BuiltValueField(wireName: r'percentage')
  num? get percentage;

  ExpendableBudget._();

  factory ExpendableBudget([void Function(ExpendableBudgetBuilder b) updates]) =
      _$ExpendableBudget;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ExpendableBudgetBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ExpendableBudget> get serializer =>
      _$ExpendableBudgetSerializer();
}

class _$ExpendableBudgetSerializer
    implements PrimitiveSerializer<ExpendableBudget> {
  @override
  final Iterable<Type> types = const [ExpendableBudget, _$ExpendableBudget];

  @override
  final String wireName = r'ExpendableBudget';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ExpendableBudget object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.expendableBudget != null) {
      yield r'expendableBudget';
      yield serializers.serialize(
        object.expendableBudget,
        specifiedType: const FullType(num),
      );
    }
    if (object.percentage != null) {
      yield r'percentage';
      yield serializers.serialize(
        object.percentage,
        specifiedType: const FullType(num),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ExpendableBudget object, {
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
    required ExpendableBudgetBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'expendableBudget':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.expendableBudget = valueDes;
          break;
        case r'percentage':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.percentage = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ExpendableBudget deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ExpendableBudgetBuilder();
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
