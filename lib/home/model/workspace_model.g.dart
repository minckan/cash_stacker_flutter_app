// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workspace_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Workspace _$WorkspaceFromJson(Map<String, dynamic> json) => Workspace(
      id: json['workspace_id'] as String,
      name: json['workspace_name'] as String,
      createdDate: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$WorkspaceToJson(Workspace instance) => <String, dynamic>{
      'workspace_id': instance.id,
      'workspace_name': instance.name,
      'created_at': instance.createdDate?.toIso8601String(),
    };
