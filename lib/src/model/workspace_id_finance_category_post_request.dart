//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'workspace_id_finance_category_post_request.g.dart';

/// WorkspaceIdFinanceCategoryPostRequest
///
/// Properties:
/// * [categoryName] - The name of the category
/// * [categoryType] - The type of the category (income or expense)
@BuiltValue()
abstract class WorkspaceIdFinanceCategoryPostRequest implements Built<WorkspaceIdFinanceCategoryPostRequest, WorkspaceIdFinanceCategoryPostRequestBuilder> {
  /// The name of the category
  @BuiltValueField(wireName: r'category_name')
  String? get categoryName;

  /// The type of the category (income or expense)
  @BuiltValueField(wireName: r'category_type')
  String? get categoryType;

  WorkspaceIdFinanceCategoryPostRequest._();

  factory WorkspaceIdFinanceCategoryPostRequest([void updates(WorkspaceIdFinanceCategoryPostRequestBuilder b)]) = _$WorkspaceIdFinanceCategoryPostRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(WorkspaceIdFinanceCategoryPostRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<WorkspaceIdFinanceCategoryPostRequest> get serializer => _$WorkspaceIdFinanceCategoryPostRequestSerializer();
}

class _$WorkspaceIdFinanceCategoryPostRequestSerializer implements PrimitiveSerializer<WorkspaceIdFinanceCategoryPostRequest> {
  @override
  final Iterable<Type> types = const [WorkspaceIdFinanceCategoryPostRequest, _$WorkspaceIdFinanceCategoryPostRequest];

  @override
  final String wireName = r'WorkspaceIdFinanceCategoryPostRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    WorkspaceIdFinanceCategoryPostRequest object, {
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
    WorkspaceIdFinanceCategoryPostRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required WorkspaceIdFinanceCategoryPostRequestBuilder result,
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
  WorkspaceIdFinanceCategoryPostRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = WorkspaceIdFinanceCategoryPostRequestBuilder();
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

