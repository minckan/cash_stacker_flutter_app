//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'asset_transaction_request.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_asset_req.g.dart';

/// CreateAssetReq
///
/// Properties:
/// * [assetTypeId]
/// * [assetName]
/// * [currencyCode]
/// * [transactions]
@BuiltValue()
abstract class CreateAssetReq
    implements Built<CreateAssetReq, CreateAssetReqBuilder> {
  @BuiltValueField(wireName: r'asset_type_id')
  int? get assetTypeId;

  @BuiltValueField(wireName: r'asset_name')
  String? get assetName;

  @BuiltValueField(wireName: r'currency_code')
  String? get currencyCode;

  @BuiltValueField(wireName: r'transactions')
  AssetTransactionRequest? get transactions;

  CreateAssetReq._();

  factory CreateAssetReq([void Function(CreateAssetReqBuilder b) updates]) =
      _$CreateAssetReq;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateAssetReqBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateAssetReq> get serializer =>
      _$CreateAssetReqSerializer();
}

class _$CreateAssetReqSerializer
    implements PrimitiveSerializer<CreateAssetReq> {
  @override
  final Iterable<Type> types = const [CreateAssetReq, _$CreateAssetReq];

  @override
  final String wireName = r'CreateAssetReq';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateAssetReq object, {
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
    CreateAssetReq object, {
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
    required CreateAssetReqBuilder result,
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
  CreateAssetReq deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateAssetReqBuilder();
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
