import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

enum UserRole {
  keyUser,
  memberUser,
}

@JsonSerializable()
class UserModel {
  final String uid;
  final String email;
  final UserRole role;
  final String profileImage;
  final String displayName;
  final bool? pushEnables;
  final bool? darkMode;
  final String workspaceId;

  UserModel({
    required this.uid,
    required this.email,
    required this.role,
    required this.profileImage,
    required this.displayName,
    required this.workspaceId,
    this.pushEnables,
    this.darkMode = false,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
