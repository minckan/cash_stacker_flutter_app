//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'budget.dart';
import 'workspace_id_budget_active_get200_response_expendable_budget.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'workspace_id_budget_active_get200_response.g.dart';

/// WorkspaceIdBudgetActiveGet200Response
///
/// Properties:
/// * [budget]
/// * [expendableBudget]
@BuiltValue()
abstract class WorkspaceIdBudgetActiveGet200Response
    implements
        Built<WorkspaceIdBudgetActiveGet200Response,
            WorkspaceIdBudgetActiveGet200ResponseBuilder> {
  @BuiltValueField(wireName: r'budget')
  Budget? get budget;

  @BuiltValueField(wireName: r'expendableBudget')
  WorkspaceIdBudgetActiveGet200ResponseExpendableBudget? get expendableBudget;

  WorkspaceIdBudgetActiveGet200Response._();

  factory WorkspaceIdBudgetActiveGet200Response(
      [void Function(WorkspaceIdBudgetActiveGet200ResponseBuilder b)
          updates]) = _$WorkspaceIdBudgetActiveGet200Response;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(WorkspaceIdBudgetActiveGet200ResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<WorkspaceIdBudgetActiveGet200Response> get serializer =>
      _$WorkspaceIdBudgetActiveGet200ResponseSerializer();
}

class _$WorkspaceIdBudgetActiveGet200ResponseSerializer
    implements PrimitiveSerializer<WorkspaceIdBudgetActiveGet200Response> {
  @override
  final Iterable<Type> types = const [
    WorkspaceIdBudgetActiveGet200Response,
    _$WorkspaceIdBudgetActiveGet200Response
  ];

  @override
  final String wireName = r'WorkspaceIdBudgetActiveGet200Response';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    WorkspaceIdBudgetActiveGet200Response object, {
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
        specifiedType: const FullType.nullable(
            WorkspaceIdBudgetActiveGet200ResponseExpendableBudget),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    WorkspaceIdBudgetActiveGet200Response object, {
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
    required WorkspaceIdBudgetActiveGet200ResponseBuilder result,
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
            specifiedType: const FullType.nullable(
                WorkspaceIdBudgetActiveGet200ResponseExpendableBudget),
          ) as WorkspaceIdBudgetActiveGet200ResponseExpendableBudget?;
          if (valueDes == null) continue;
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
  WorkspaceIdBudgetActiveGet200Response deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = WorkspaceIdBudgetActiveGet200ResponseBuilder();
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
