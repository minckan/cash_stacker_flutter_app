import 'package:json_annotation/json_annotation.dart';

part 'invitation_model.g.dart';

enum InvitationStatus {
  pending,
  confirmed,
}

@JsonSerializable()
class Invitation {
  final String id;
  final String workspaceId;
  final String email;
  final InvitationStatus status;
  final String token;
  final DateTime expiryDate;

  Invitation({
    required this.id,
    required this.workspaceId,
    required this.email,
    required this.status,
    required this.token,
    required this.expiryDate,
  });

  factory Invitation.fromJson(Map<String, dynamic> json) =>
      Invitation.fromJson(json);

  Map<String, dynamic> toJson() => _$InvitationToJson(this);
}
