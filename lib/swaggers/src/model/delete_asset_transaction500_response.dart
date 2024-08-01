//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'delete_asset_transaction500_response.g.dart';

/// DeleteAssetTransaction500Response
///
/// Properties:
/// * [message]
@BuiltValue()
abstract class DeleteAssetTransaction500Response
    implements
        Built<DeleteAssetTransaction500Response,
            DeleteAssetTransaction500ResponseBuilder> {
  @BuiltValueField(wireName: r'message')
  String? get message;

  DeleteAssetTransaction500Response._();

  factory DeleteAssetTransaction500Response(
          [void Function(DeleteAssetTransaction500ResponseBuilder b) updates]) =
      _$DeleteAssetTransaction500Response;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DeleteAssetTransaction500ResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DeleteAssetTransaction500Response> get serializer =>
      _$DeleteAssetTransaction500ResponseSerializer();
}

class _$DeleteAssetTransaction500ResponseSerializer
    implements PrimitiveSerializer<DeleteAssetTransaction500Response> {
  @override
  final Iterable<Type> types = const [
    DeleteAssetTransaction500Response,
    _$DeleteAssetTransaction500Response
  ];

  @override
  final String wireName = r'DeleteAssetTransaction500Response';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DeleteAssetTransaction500Response object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.message != null) {
      yield r'message';
      yield serializers.serialize(
        object.message,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    DeleteAssetTransaction500Response object, {
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
    required DeleteAssetTransaction500ResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'message':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.message = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DeleteAssetTransaction500Response deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DeleteAssetTransaction500ResponseBuilder();
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
