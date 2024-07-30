//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'asset_to_transaction.g.dart';

/// AssetToTransaction
///
/// Properties:
/// * [assetId]
/// * [transactionId]
@BuiltValue()
abstract class AssetToTransaction
    implements Built<AssetToTransaction, AssetToTransactionBuilder> {
  @BuiltValueField(wireName: r'asset_id')
  int? get assetId;

  @BuiltValueField(wireName: r'transaction_id')
  int? get transactionId;

  AssetToTransaction._();

  factory AssetToTransaction(
          [void Function(AssetToTransactionBuilder b) updates]) =
      _$AssetToTransaction;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AssetToTransactionBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AssetToTransaction> get serializer =>
      _$AssetToTransactionSerializer();
}

class _$AssetToTransactionSerializer
    implements PrimitiveSerializer<AssetToTransaction> {
  @override
  final Iterable<Type> types = const [AssetToTransaction, _$AssetToTransaction];

  @override
  final String wireName = r'AssetToTransaction';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AssetToTransaction object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.assetId != null) {
      yield r'asset_id';
      yield serializers.serialize(
        object.assetId,
        specifiedType: const FullType(int),
      );
    }
    if (object.transactionId != null) {
      yield r'transaction_id';
      yield serializers.serialize(
        object.transactionId,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AssetToTransaction object, {
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
    required AssetToTransactionBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'asset_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.assetId = valueDes;
          break;
        case r'transaction_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.transactionId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AssetToTransaction deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AssetToTransactionBuilder();
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
