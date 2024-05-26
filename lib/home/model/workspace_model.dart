import 'package:json_annotation/json_annotation.dart';

part 'workspace_model.g.dart';

@JsonSerializable()
class Workspace {
  Workspace({
    required this.id,
    required this.members,
  });

  final String id;
  final List<String> members;

  factory Workspace.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceFromJson(json);

  Map<String, dynamic> toJson() => _$WorkspaceToJson(this);
}
