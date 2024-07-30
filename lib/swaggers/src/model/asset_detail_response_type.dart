//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'asset_transaction_response_type.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'asset_detail_response_type.g.dart';

/// AssetDetailResponseType
///
/// Properties:
/// * [assetId]
/// * [isKrwCashAsset]
/// * [currencyCode]
/// * [total]
/// * [assetTypeId]
/// * [transaction]
@BuiltValue()
abstract class AssetDetailResponseType
    implements Built<AssetDetailResponseType, AssetDetailResponseTypeBuilder> {
  @BuiltValueField(wireName: r'assetId')
  int? get assetId;

  @BuiltValueField(wireName: r'isKrwCashAsset')
  bool? get isKrwCashAsset;

  @BuiltValueField(wireName: r'currencyCode')
  String? get currencyCode;

  @BuiltValueField(wireName: r'total')
  num? get total;

  @BuiltValueField(wireName: r'assetTypeId')
  int? get assetTypeId;

  @BuiltValueField(wireName: r'transaction')
  BuiltList<AssetTransactionResponseType>? get transaction;

  AssetDetailResponseType._();

  factory AssetDetailResponseType(
          [void Function(AssetDetailResponseTypeBuilder b) updates]) =
      _$AssetDetailResponseType;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AssetDetailResponseTypeBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AssetDetailResponseType> get serializer =>
      _$AssetDetailResponseTypeSerializer();
}

class _$AssetDetailResponseTypeSerializer
    implements PrimitiveSerializer<AssetDetailResponseType> {
  @override
  final Iterable<Type> types = const [
    AssetDetailResponseType,
    _$AssetDetailResponseType
  ];

  @override
  final String wireName = r'AssetDetailResponseType';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AssetDetailResponseType object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.assetId != null) {
      yield r'assetId';
      yield serializers.serialize(
        object.assetId,
        specifiedType: const FullType(int),
      );
    }
    if (object.isKrwCashAsset != null) {
      yield r'isKrwCashAsset';
      yield serializers.serialize(
        object.isKrwCashAsset,
        specifiedType: const FullType(bool),
      );
    }
    if (object.currencyCode != null) {
      yield r'currencyCode';
      yield serializers.serialize(
        object.currencyCode,
        specifiedType: const FullType(String),
      );
    }
    if (object.total != null) {
      yield r'total';
      yield serializers.serialize(
        object.total,
        specifiedType: const FullType(num),
      );
    }
    if (object.assetTypeId != null) {
      yield r'assetTypeId';
      yield serializers.serialize(
        object.assetTypeId,
        specifiedType: const FullType(int),
      );
    }
    if (object.transaction != null) {
      yield r'transaction';
      yield serializers.serialize(
        object.transaction,
        specifiedType:
            const FullType(BuiltList, [FullType(AssetTransactionResponseType)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AssetDetailResponseType object, {
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
    required AssetDetailResponseTypeBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'assetId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.assetId = valueDes;
          break;
        case r'isKrwCashAsset':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isKrwCashAsset = valueDes;
          break;
        case r'currencyCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.currencyCode = valueDes;
          break;
        case r'total':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.total = valueDes;
          break;
        case r'assetTypeId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.assetTypeId = valueDes;
          break;
        case r'transaction':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(
                BuiltList, [FullType(AssetTransactionResponseType)]),
          ) as BuiltList<AssetTransactionResponseType>;
          result.transaction.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AssetDetailResponseType deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AssetDetailResponseTypeBuilder();
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
