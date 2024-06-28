//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'asset_transaction.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'workspace_id_assets_post_request.g.dart';

/// WorkspaceIdAssetsPostRequest
///
/// Properties:
/// * [assetTypeId]
/// * [assetName]
/// * [balance]
/// * [transactions]
/// * [currencyCode]
@BuiltValue()
abstract class WorkspaceIdAssetsPostRequest
    implements
        Built<WorkspaceIdAssetsPostRequest,
            WorkspaceIdAssetsPostRequestBuilder> {
  @BuiltValueField(wireName: r'asset_type_id')
  int? get assetTypeId;

  @BuiltValueField(wireName: r'asset_name')
  String? get assetName;

  @BuiltValueField(wireName: r'balance')
  double? get balance;

  @BuiltValueField(wireName: r'transactions')
  BuiltList<AssetTransaction>? get transactions;

  @BuiltValueField(wireName: r'currency_code')
  String? get currencyCode;

  WorkspaceIdAssetsPostRequest._();

  factory WorkspaceIdAssetsPostRequest(
          [void updates(WorkspaceIdAssetsPostRequestBuilder b)]) =
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
        specifiedType: const FullType(String),
      );
    }
    if (object.balance != null) {
      yield r'balance';
      yield serializers.serialize(
        object.balance,
        specifiedType: const FullType(double),
      );
    }
    if (object.transactions != null) {
      yield r'transactions';
      yield serializers.serialize(
        object.transactions,
        specifiedType: const FullType(BuiltList, [FullType(AssetTransaction)]),
      );
    }
    if (object.currencyCode != null) {
      yield r'currency_code';
      yield serializers.serialize(
        object.currencyCode,
        specifiedType: const FullType(String),
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
            specifiedType: const FullType(String),
          ) as String;
          result.assetName = valueDes;
          break;
        case r'balance':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.balance = valueDes;
          break;
        case r'transactions':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(AssetTransaction)]),
          ) as BuiltList<AssetTransaction>;
          result.transactions.replace(valueDes);
          break;
        case r'currency_code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.currencyCode = valueDes;
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
