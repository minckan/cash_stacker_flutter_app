//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'workspace_id_finance_category_id_put_request.g.dart';

/// WorkspaceIdFinanceCategoryIdPutRequest
///
/// Properties:
/// * [categoryName] - The name of the category
@BuiltValue()
abstract class WorkspaceIdFinanceCategoryIdPutRequest
    implements
        Built<WorkspaceIdFinanceCategoryIdPutRequest,
            WorkspaceIdFinanceCategoryIdPutRequestBuilder> {
  /// The name of the category
  @BuiltValueField(wireName: r'category_name')
  String? get categoryName;

  WorkspaceIdFinanceCategoryIdPutRequest._();

  factory WorkspaceIdFinanceCategoryIdPutRequest(
      [void Function(WorkspaceIdFinanceCategoryIdPutRequestBuilder b)
          updates]) = _$WorkspaceIdFinanceCategoryIdPutRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(WorkspaceIdFinanceCategoryIdPutRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<WorkspaceIdFinanceCategoryIdPutRequest> get serializer =>
      _$WorkspaceIdFinanceCategoryIdPutRequestSerializer();
}

class _$WorkspaceIdFinanceCategoryIdPutRequestSerializer
    implements PrimitiveSerializer<WorkspaceIdFinanceCategoryIdPutRequest> {
  @override
  final Iterable<Type> types = const [
    WorkspaceIdFinanceCategoryIdPutRequest,
    _$WorkspaceIdFinanceCategoryIdPutRequest
  ];

  @override
  final String wireName = r'WorkspaceIdFinanceCategoryIdPutRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    WorkspaceIdFinanceCategoryIdPutRequest object, {
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
    WorkspaceIdFinanceCategoryIdPutRequest object, {
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
    required WorkspaceIdFinanceCategoryIdPutRequestBuilder result,
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
  WorkspaceIdFinanceCategoryIdPutRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = WorkspaceIdFinanceCategoryIdPutRequestBuilder();
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
