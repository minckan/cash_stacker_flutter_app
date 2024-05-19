enum UserRole {
  keyUser,
  memberUser,
}

class UserModel {
  UserModel({
    required this.id,
    required this.email,
    required this.role,
    required this.profileImage,
    required this.nickName,
    required this.workspaceId,
    this.pushEnables,
    this.darkMode = false,
  });
  final String id;
  final String email;
  final UserRole role;
  final String profileImage;
  final String nickName;
  final bool? pushEnables;
  final bool? darkMode;
  final String workspaceId;
}
