enum UserRole {
  keyUser,
  memberUser,
}

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

  factory UserModel.fromJson(Map<String, dynamic> data) {
    return UserModel(
      uid: data['uid'],
      email: data['email'],
      role: UserRole.values[data['role']],
      profileImage: data['profileImage'],
      displayName: data['displayName'],
      workspaceId: data['workspaceId'],
      pushEnables: data['pushEnables'],
      darkMode: data['darkMode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'role': role.index,
      'profileImage': profileImage,
      'displayName': displayName,
      'workspaceId': workspaceId,
      'pushEnables': pushEnables,
      'darkMode': darkMode,
    };
  }
}
