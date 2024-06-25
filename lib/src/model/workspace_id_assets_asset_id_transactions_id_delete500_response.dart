//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'workspace_id_assets_asset_id_transactions_id_delete500_response.g.dart';

/// WorkspaceIdAssetsAssetIdTransactionsIdDelete500Response
///
/// Properties:
/// * [error]
@BuiltValue()
abstract class WorkspaceIdAssetsAssetIdTransactionsIdDelete500Response
    implements
        Built<WorkspaceIdAssetsAssetIdTransactionsIdDelete500Response,
            WorkspaceIdAssetsAssetIdTransactionsIdDelete500ResponseBuilder> {
  @BuiltValueField(wireName: r'error')
  String? get error;

  WorkspaceIdAssetsAssetIdTransactionsIdDelete500Response._();

  factory WorkspaceIdAssetsAssetIdTransactionsIdDelete500Response(
      [void Function(
              WorkspaceIdAssetsAssetIdTransactionsIdDelete500ResponseBuilder b)
          updates]) = _$WorkspaceIdAssetsAssetIdTransactionsIdDelete500Response;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(
          WorkspaceIdAssetsAssetIdTransactionsIdDelete500ResponseBuilder b) =>
      b;

  @BuiltValueSerializer(custom: true)
  static Serializer<WorkspaceIdAssetsAssetIdTransactionsIdDelete500Response>
      get serializer =>
          _$WorkspaceIdAssetsAssetIdTransactionsIdDelete500ResponseSerializer();
}

class _$WorkspaceIdAssetsAssetIdTransactionsIdDelete500ResponseSerializer
    implements
        PrimitiveSerializer<
            WorkspaceIdAssetsAssetIdTransactionsIdDelete500Response> {
  @override
  final Iterable<Type> types = const [
    WorkspaceIdAssetsAssetIdTransactionsIdDelete500Response,
    _$WorkspaceIdAssetsAssetIdTransactionsIdDelete500Response
  ];

  @override
  final String wireName =
      r'WorkspaceIdAssetsAssetIdTransactionsIdDelete500Response';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    WorkspaceIdAssetsAssetIdTransactionsIdDelete500Response object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.error != null) {
      yield r'error';
      yield serializers.serialize(
        object.error,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    WorkspaceIdAssetsAssetIdTransactionsIdDelete500Response object, {
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
    required WorkspaceIdAssetsAssetIdTransactionsIdDelete500ResponseBuilder
        result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'error':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.error = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  WorkspaceIdAssetsAssetIdTransactionsIdDelete500Response deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result =
        WorkspaceIdAssetsAssetIdTransactionsIdDelete500ResponseBuilder();
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
