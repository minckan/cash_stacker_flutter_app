//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_financial_tracker_category_req.g.dart';

/// CreateFinancialTrackerCategoryReq
///
/// Properties:
/// * [categoryName] - The name of the category
/// * [categoryType] - The type of the category (income or expense)
@BuiltValue()
abstract class CreateFinancialTrackerCategoryReq
    implements
        Built<CreateFinancialTrackerCategoryReq,
            CreateFinancialTrackerCategoryReqBuilder> {
  /// The name of the category
  @BuiltValueField(wireName: r'category_name')
  String? get categoryName;

  /// The type of the category (income or expense)
  @BuiltValueField(wireName: r'category_type')
  String? get categoryType;

  CreateFinancialTrackerCategoryReq._();

  factory CreateFinancialTrackerCategoryReq(
          [void Function(CreateFinancialTrackerCategoryReqBuilder b) updates]) =
      _$CreateFinancialTrackerCategoryReq;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateFinancialTrackerCategoryReqBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateFinancialTrackerCategoryReq> get serializer =>
      _$CreateFinancialTrackerCategoryReqSerializer();
}

class _$CreateFinancialTrackerCategoryReqSerializer
    implements PrimitiveSerializer<CreateFinancialTrackerCategoryReq> {
  @override
  final Iterable<Type> types = const [
    CreateFinancialTrackerCategoryReq,
    _$CreateFinancialTrackerCategoryReq
  ];

  @override
  final String wireName = r'CreateFinancialTrackerCategoryReq';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateFinancialTrackerCategoryReq object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.categoryName != null) {
      yield r'category_name';
      yield serializers.serialize(
        object.categoryName,
        specifiedType: const FullType(String),
      );
    }
    if (object.categoryType != null) {
      yield r'category_type';
      yield serializers.serialize(
        object.categoryType,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateFinancialTrackerCategoryReq object, {
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
    required CreateFinancialTrackerCategoryReqBuilder result,
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
        case r'category_type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.categoryType = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateFinancialTrackerCategoryReq deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateFinancialTrackerCategoryReqBuilder();
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
