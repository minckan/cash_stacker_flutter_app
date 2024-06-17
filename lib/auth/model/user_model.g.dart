// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      uid: json['user_id'] as String,
      email: json['email'] as String,
      role: $enumDecode(_$UserRoleEnumMap, json['role']),
      profileImage: json['profile_image'] as String,
      displayName: json['username'] as String,
      workspaceId: json['workspace_id'] as String,
      platformType: json['platform_type'] as String,
      pushId: json['push_id'] as String,
      loginType: $enumDecode(_$LoginTypeEnumMap, json['login_type']),
      pushEnables: json['push_enable'] as bool?,
      darkMode: json['darkMode_enable'] as bool? ?? false,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'user_id': instance.uid,
      'email': instance.email,
      'role': _$UserRoleEnumMap[instance.role]!,
      'profile_image': instance.profileImage,
      'username': instance.displayName,
      'push_enable': instance.pushEnables,
      'darkMode_enable': instance.darkMode,
      'workspace_id': instance.workspaceId,
      'platform_type': instance.platformType,
      'push_id': instance.pushId,
      'login_type': _$LoginTypeEnumMap[instance.loginType]!,
    };

const _$UserRoleEnumMap = {
  UserRole.keyUser: 'keyUser',
  UserRole.memberUser: 'memberUser',
};

const _$LoginTypeEnumMap = {
  LoginType.kakao: 'kakao',
  LoginType.apple: 'apple',
  LoginType.google: 'google',
  LoginType.naver: 'naver',
};
