//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'workspace_id_assets_asset_id_transactions_id_delete201_response.g.dart';

/// WorkspaceIdAssetsAssetIdTransactionsIdDelete201Response
///
/// Properties:
/// * [result]
@BuiltValue()
abstract class WorkspaceIdAssetsAssetIdTransactionsIdDelete201Response
    implements
        Built<WorkspaceIdAssetsAssetIdTransactionsIdDelete201Response,
            WorkspaceIdAssetsAssetIdTransactionsIdDelete201ResponseBuilder> {
  @BuiltValueField(wireName: r'result')
  String? get result;

  WorkspaceIdAssetsAssetIdTransactionsIdDelete201Response._();

  factory WorkspaceIdAssetsAssetIdTransactionsIdDelete201Response(
      [void updates(
          WorkspaceIdAssetsAssetIdTransactionsIdDelete201ResponseBuilder
              b)]) = _$WorkspaceIdAssetsAssetIdTransactionsIdDelete201Response;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(
          WorkspaceIdAssetsAssetIdTransactionsIdDelete201ResponseBuilder b) =>
      b;

  @BuiltValueSerializer(custom: true)
  static Serializer<WorkspaceIdAssetsAssetIdTransactionsIdDelete201Response>
      get serializer =>
          _$WorkspaceIdAssetsAssetIdTransactionsIdDelete201ResponseSerializer();
}

class _$WorkspaceIdAssetsAssetIdTransactionsIdDelete201ResponseSerializer
    implements
        PrimitiveSerializer<
            WorkspaceIdAssetsAssetIdTransactionsIdDelete201Response> {
  @override
  final Iterable<Type> types = const [
    WorkspaceIdAssetsAssetIdTransactionsIdDelete201Response,
    _$WorkspaceIdAssetsAssetIdTransactionsIdDelete201Response
  ];

  @override
  final String wireName =
      r'WorkspaceIdAssetsAssetIdTransactionsIdDelete201Response';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    WorkspaceIdAssetsAssetIdTransactionsIdDelete201Response object, {
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
    WorkspaceIdAssetsAssetIdTransactionsIdDelete201Response object, {
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
    required WorkspaceIdAssetsAssetIdTransactionsIdDelete201ResponseBuilder
        result,
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
  WorkspaceIdAssetsAssetIdTransactionsIdDelete201Response deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result =
        WorkspaceIdAssetsAssetIdTransactionsIdDelete201ResponseBuilder();
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
