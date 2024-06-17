import 'package:json_annotation/json_annotation.dart';

part 'asset_type_model.g.dart';

@JsonSerializable()
class AssetTypeModel {
  @JsonKey(name: 'asset_type_id')
  final String id;
  @JsonKey(name: 'asset_type_name')
  final String name;
  @JsonKey(name: 'is_default')
  final bool isDefault;

  AssetTypeModel({
    required this.id,
    required this.name,
    required this.isDefault,
  });

  factory AssetTypeModel.fromJson(Map<String, dynamic> json) =>
      _$AssetTypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$AssetTypeModelToJson(this);
}
