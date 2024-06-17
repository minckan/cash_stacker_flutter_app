import 'package:json_annotation/json_annotation.dart';

part 'workspace_model.g.dart';

@JsonSerializable()
class Workspace {
  Workspace({
    required this.id,
    this.createdDate,
    this.name,
  });

  @JsonKey(name: 'workspace_id')
  final String id;
  @JsonKey(name: 'workspace_name')
  final String? name;
  @JsonKey(name: 'created_at')
  final DateTime? createdDate;

  factory Workspace.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceFromJson(json);

  Map<String, dynamic> toJson() => _$WorkspaceToJson(this);
}
