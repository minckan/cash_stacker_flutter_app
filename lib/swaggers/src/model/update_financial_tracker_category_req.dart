//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_financial_tracker_category_req.g.dart';

/// UpdateFinancialTrackerCategoryReq
///
/// Properties:
/// * [categoryName] - The name of the category
@BuiltValue()
abstract class UpdateFinancialTrackerCategoryReq
    implements
        Built<UpdateFinancialTrackerCategoryReq,
            UpdateFinancialTrackerCategoryReqBuilder> {
  /// The name of the category
  @BuiltValueField(wireName: r'category_name')
  String? get categoryName;

  UpdateFinancialTrackerCategoryReq._();

  factory UpdateFinancialTrackerCategoryReq(
          [void Function(UpdateFinancialTrackerCategoryReqBuilder b) updates]) =
      _$UpdateFinancialTrackerCategoryReq;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateFinancialTrackerCategoryReqBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateFinancialTrackerCategoryReq> get serializer =>
      _$UpdateFinancialTrackerCategoryReqSerializer();
}

class _$UpdateFinancialTrackerCategoryReqSerializer
    implements PrimitiveSerializer<UpdateFinancialTrackerCategoryReq> {
  @override
  final Iterable<Type> types = const [
    UpdateFinancialTrackerCategoryReq,
    _$UpdateFinancialTrackerCategoryReq
  ];

  @override
  final String wireName = r'UpdateFinancialTrackerCategoryReq';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateFinancialTrackerCategoryReq object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.categoryName != null) {
      yield r'category_name';
      yield serializers.serialize(
        object.categoryName,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdateFinancialTrackerCategoryReq object, {
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
    required UpdateFinancialTrackerCategoryReqBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'category_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.categoryName = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpdateFinancialTrackerCategoryReq deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateFinancialTrackerCategoryReqBuilder();
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
