//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'workspace_id_assets_monthly_trend_get200_response_inner.g.dart';

/// WorkspaceIdAssetsMonthlyTrendGet200ResponseInner
///
/// Properties:
/// * [month] 
/// * [totalBalance] 
@BuiltValue()
abstract class WorkspaceIdAssetsMonthlyTrendGet200ResponseInner implements Built<WorkspaceIdAssetsMonthlyTrendGet200ResponseInner, WorkspaceIdAssetsMonthlyTrendGet200ResponseInnerBuilder> {
  @BuiltValueField(wireName: r'month')
  String? get month;

  @BuiltValueField(wireName: r'total_balance')
  double? get totalBalance;

  WorkspaceIdAssetsMonthlyTrendGet200ResponseInner._();

  factory WorkspaceIdAssetsMonthlyTrendGet200ResponseInner([void updates(WorkspaceIdAssetsMonthlyTrendGet200ResponseInnerBuilder b)]) = _$WorkspaceIdAssetsMonthlyTrendGet200ResponseInner;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(WorkspaceIdAssetsMonthlyTrendGet200ResponseInnerBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<WorkspaceIdAssetsMonthlyTrendGet200ResponseInner> get serializer => _$WorkspaceIdAssetsMonthlyTrendGet200ResponseInnerSerializer();
}

class _$WorkspaceIdAssetsMonthlyTrendGet200ResponseInnerSerializer implements PrimitiveSerializer<WorkspaceIdAssetsMonthlyTrendGet200ResponseInner> {
  @override
  final Iterable<Type> types = const [WorkspaceIdAssetsMonthlyTrendGet200ResponseInner, _$WorkspaceIdAssetsMonthlyTrendGet200ResponseInner];

  @override
  final String wireName = r'WorkspaceIdAssetsMonthlyTrendGet200ResponseInner';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    WorkspaceIdAssetsMonthlyTrendGet200ResponseInner object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.month != null) {
      yield r'month';
      yield serializers.serialize(
        object.month,
        specifiedType: const FullType(String),
      );
    }
    if (object.totalBalance != null) {
      yield r'total_balance';
      yield serializers.serialize(
        object.totalBalance,
        specifiedType: const FullType(double),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    WorkspaceIdAssetsMonthlyTrendGet200ResponseInner object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required WorkspaceIdAssetsMonthlyTrendGet200ResponseInnerBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'month':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.month = valueDes;
          break;
        case r'total_balance':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.totalBalance = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  WorkspaceIdAssetsMonthlyTrendGet200ResponseInner deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = WorkspaceIdAssetsMonthlyTrendGet200ResponseInnerBuilder();
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

