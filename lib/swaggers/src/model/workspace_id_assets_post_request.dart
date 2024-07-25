//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'asset_transaction_request.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'workspace_id_assets_post_request.g.dart';

/// WorkspaceIdAssetsPostRequest
///
/// Properties:
/// * [assetTypeId]
/// * [assetName]
/// * [currencyCode]
/// * [transactions]
@BuiltValue()
abstract class WorkspaceIdAssetsPostRequest
    implements
        Built<WorkspaceIdAssetsPostRequest,
            WorkspaceIdAssetsPostRequestBuilder> {
  @BuiltValueField(wireName: r'asset_type_id')
  int? get assetTypeId;

  @BuiltValueField(wireName: r'asset_name')
  String? get assetName;

  @BuiltValueField(wireName: r'currency_code')
  String? get currencyCode;

  @BuiltValueField(wireName: r'transactions')
  AssetTransactionRequest? get transactions;

  WorkspaceIdAssetsPostRequest._();

  factory WorkspaceIdAssetsPostRequest(
          [void Function(WorkspaceIdAssetsPostRequestBuilder b) updates]) =
      _$WorkspaceIdAssetsPostRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(WorkspaceIdAssetsPostRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<WorkspaceIdAssetsPostRequest> get serializer =>
      _$WorkspaceIdAssetsPostRequestSerializer();
}

class _$WorkspaceIdAssetsPostRequestSerializer
    implements PrimitiveSerializer<WorkspaceIdAssetsPostRequest> {
  @override
  final Iterable<Type> types = const [
    WorkspaceIdAssetsPostRequest,
    _$WorkspaceIdAssetsPostRequest
  ];

  @override
  final String wireName = r'WorkspaceIdAssetsPostRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    WorkspaceIdAssetsPostRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.assetTypeId != null) {
      yield r'asset_type_id';
      yield serializers.serialize(
        object.assetTypeId,
        specifiedType: const FullType(int),
      );
    }
    if (object.assetName != null) {
      yield r'asset_name';
      yield serializers.serialize(
        object.assetName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.currencyCode != null) {
      yield r'currency_code';
      yield serializers.serialize(
        object.currencyCode,
        specifiedType: const FullType(String),
      );
    }
    if (object.transactions != null) {
      yield r'transactions';
      yield serializers.serialize(
        object.transactions,
        specifiedType: const FullType(AssetTransactionRequest),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    WorkspaceIdAssetsPostRequest object, {
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
    required WorkspaceIdAssetsPostRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'asset_type_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.assetTypeId = valueDes;
          break;
        case r'asset_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.assetName = valueDes;
          break;
        case r'currency_code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.currencyCode = valueDes;
          break;
        case r'transactions':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AssetTransactionRequest),
          ) as AssetTransactionRequest;
          result.transactions.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  WorkspaceIdAssetsPostRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = WorkspaceIdAssetsPostRequestBuilder();
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
