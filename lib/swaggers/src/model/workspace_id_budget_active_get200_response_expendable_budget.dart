//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'workspace_id_budget_active_get200_response_expendable_budget.g.dart';

/// WorkspaceIdBudgetActiveGet200ResponseExpendableBudget
///
/// Properties:
/// * [expendableBudget]
/// * [percentage]
@BuiltValue()
abstract class WorkspaceIdBudgetActiveGet200ResponseExpendableBudget
    implements
        Built<WorkspaceIdBudgetActiveGet200ResponseExpendableBudget,
            WorkspaceIdBudgetActiveGet200ResponseExpendableBudgetBuilder> {
  @BuiltValueField(wireName: r'expendableBudget')
  num? get expendableBudget;

  @BuiltValueField(wireName: r'percentage')
  num? get percentage;

  WorkspaceIdBudgetActiveGet200ResponseExpendableBudget._();

  factory WorkspaceIdBudgetActiveGet200ResponseExpendableBudget(
      [void Function(
              WorkspaceIdBudgetActiveGet200ResponseExpendableBudgetBuilder b)
          updates]) = _$WorkspaceIdBudgetActiveGet200ResponseExpendableBudget;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(
          WorkspaceIdBudgetActiveGet200ResponseExpendableBudgetBuilder b) =>
      b;

  @BuiltValueSerializer(custom: true)
  static Serializer<WorkspaceIdBudgetActiveGet200ResponseExpendableBudget>
      get serializer =>
          _$WorkspaceIdBudgetActiveGet200ResponseExpendableBudgetSerializer();
}

class _$WorkspaceIdBudgetActiveGet200ResponseExpendableBudgetSerializer
    implements
        PrimitiveSerializer<
            WorkspaceIdBudgetActiveGet200ResponseExpendableBudget> {
  @override
  final Iterable<Type> types = const [
    WorkspaceIdBudgetActiveGet200ResponseExpendableBudget,
    _$WorkspaceIdBudgetActiveGet200ResponseExpendableBudget
  ];

  @override
  final String wireName =
      r'WorkspaceIdBudgetActiveGet200ResponseExpendableBudget';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    WorkspaceIdBudgetActiveGet200ResponseExpendableBudget object, {
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
    WorkspaceIdBudgetActiveGet200ResponseExpendableBudget object, {
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
    required WorkspaceIdBudgetActiveGet200ResponseExpendableBudgetBuilder
        result,
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
  WorkspaceIdBudgetActiveGet200ResponseExpendableBudget deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result =
        WorkspaceIdBudgetActiveGet200ResponseExpendableBudgetBuilder();
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
