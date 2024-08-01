//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'delete_asset_transaction201_response.g.dart';

/// DeleteAssetTransaction201Response
///
/// Properties:
/// * [result]
@BuiltValue()
abstract class DeleteAssetTransaction201Response
    implements
        Built<DeleteAssetTransaction201Response,
            DeleteAssetTransaction201ResponseBuilder> {
  @BuiltValueField(wireName: r'result')
  String? get result;

  DeleteAssetTransaction201Response._();

  factory DeleteAssetTransaction201Response(
          [void Function(DeleteAssetTransaction201ResponseBuilder b) updates]) =
      _$DeleteAssetTransaction201Response;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DeleteAssetTransaction201ResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DeleteAssetTransaction201Response> get serializer =>
      _$DeleteAssetTransaction201ResponseSerializer();
}

class _$DeleteAssetTransaction201ResponseSerializer
    implements PrimitiveSerializer<DeleteAssetTransaction201Response> {
  @override
  final Iterable<Type> types = const [
    DeleteAssetTransaction201Response,
    _$DeleteAssetTransaction201Response
  ];

  @override
  final String wireName = r'DeleteAssetTransaction201Response';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DeleteAssetTransaction201Response object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.result != null) {
      yield r'result';
      yield serializers.serialize(
        object.result,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    DeleteAssetTransaction201Response object, {
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
    required DeleteAssetTransaction201ResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'result':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.result = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DeleteAssetTransaction201Response deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DeleteAssetTransaction201ResponseBuilder();
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
