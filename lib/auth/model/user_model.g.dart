// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      uid: json['uid'] as String,
      email: json['email'] as String,
      role: $enumDecode(_$UserRoleEnumMap, json['role']),
      profileImage: json['profileImage'] as String,
      displayName: json['displayName'] as String,
      workspaceId: json['workspaceId'] as String,
      pushEnables: json['pushEnables'] as bool?,
      darkMode: json['darkMode'] as bool? ?? false,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'role': _$UserRoleEnumMap[instance.role]!,
      'profileImage': instance.profileImage,
      'displayName': instance.displayName,
      'pushEnables': instance.pushEnables,
      'darkMode': instance.darkMode,
      'workspaceId': instance.workspaceId,
    };

const _$UserRoleEnumMap = {
  UserRole.keyUser: 'keyUser',
  UserRole.memberUser: 'memberUser',
};
