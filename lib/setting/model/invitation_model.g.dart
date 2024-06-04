// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invitation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Invitation _$InvitationFromJson(Map<String, dynamic> json) => Invitation(
      id: json['id'] as String,
      workspaceId: json['workspaceId'] as String,
      email: json['email'] as String,
      status: $enumDecode(_$InvitationStatusEnumMap, json['status']),
      token: json['token'] as String,
      expiryDate: DateTime.parse(json['expiryDate'] as String),
    );

Map<String, dynamic> _$InvitationToJson(Invitation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'workspaceId': instance.workspaceId,
      'email': instance.email,
      'status': _$InvitationStatusEnumMap[instance.status]!,
      'token': instance.token,
      'expiryDate': instance.expiryDate.toIso8601String(),
    };

const _$InvitationStatusEnumMap = {
  InvitationStatus.pending: 'pending',
  InvitationStatus.confirmed: 'confirmed',
};
