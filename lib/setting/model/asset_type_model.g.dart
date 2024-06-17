// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssetTypeModel _$AssetTypeModelFromJson(Map<String, dynamic> json) =>
    AssetTypeModel(
      id: json['asset_type_id'] as String,
      name: json['asset_type_name'] as String,
      isDefault: json['is_default'] as bool,
    );

Map<String, dynamic> _$AssetTypeModelToJson(AssetTypeModel instance) =>
    <String, dynamic>{
      'asset_type_id': instance.id,
      'asset_type_name': instance.name,
      'is_default': instance.isDefault,
    };
