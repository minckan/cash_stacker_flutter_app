import 'package:cash_stacker_flutter_app/auth/util/auth_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

enum UserRole {
  keyUser,
  memberUser,
}

@JsonSerializable()
class UserModel {
  @JsonKey(name: 'user_id')
  final String uid;
  final String email;
  final UserRole role;
  @JsonKey(name: 'profile_image')
  final String profileImage;
  @JsonKey(name: 'username')
  final String displayName;
  @JsonKey(name: 'push_enable')
  final bool? pushEnables;
  @JsonKey(name: 'darkMode_enable')
  final bool? darkMode;
  @JsonKey(name: 'workspace_id')
  final String workspaceId;
  @JsonKey(name: 'platform_type')
  final String platformType;
  @JsonKey(name: 'push_id')
  final String pushId;
  @JsonKey(name: 'login_type')
  final LoginType loginType;

  UserModel({
    required this.uid,
    required this.email,
    required this.role,
    required this.profileImage,
    required this.displayName,
    required this.workspaceId,
    required this.platformType,
    required this.pushId,
    required this.loginType,
    this.pushEnables,
    this.darkMode = false,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
