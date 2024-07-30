//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'asset_transaction_response_type.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'all_assets_response_type.g.dart';

/// AllAssetsResponseType
///
/// Properties:
/// * [total]
/// * [transaction]
@BuiltValue()
abstract class AllAssetsResponseType
    implements Built<AllAssetsResponseType, AllAssetsResponseTypeBuilder> {
  @BuiltValueField(wireName: r'total')
  num? get total;

  @BuiltValueField(wireName: r'transaction')
  BuiltList<AssetTransactionResponseType>? get transaction;

  AllAssetsResponseType._();

  factory AllAssetsResponseType(
      [void updates(AllAssetsResponseTypeBuilder b)]) = _$AllAssetsResponseType;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AllAssetsResponseTypeBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AllAssetsResponseType> get serializer =>
      _$AllAssetsResponseTypeSerializer();
}

class _$AllAssetsResponseTypeSerializer
    implements PrimitiveSerializer<AllAssetsResponseType> {
  @override
  final Iterable<Type> types = const [
    AllAssetsResponseType,
    _$AllAssetsResponseType
  ];

  @override
  final String wireName = r'AllAssetsResponseType';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AllAssetsResponseType object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.total != null) {
      yield r'total';
      yield serializers.serialize(
        object.total,
        specifiedType: const FullType(num),
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
    AllAssetsResponseType object, {
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
    required AllAssetsResponseTypeBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'total':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.total = valueDes;
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
  AllAssetsResponseType deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AllAssetsResponseTypeBuilder();
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
