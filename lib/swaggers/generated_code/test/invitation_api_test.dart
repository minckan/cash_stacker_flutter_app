import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for InvitationApi
void main() {
  final instance = Openapi().getInvitationApi();

  group(InvitationApi, () {
    // Get all invitations
    //
    // Retrieve all invitations sent from the specified workspace.
    //
    //Future<BuiltList<Invitation>> workspaceIdInvitationGet(String workspaceId) async
    test('test workspaceIdInvitationGet', () async {
      // TODO
    });

    // Delete an invitation
    //
    // Delete an existing invitation by its ID.
    //
    //Future workspaceIdInvitationIdDelete(String workspaceId, String id) async
    test('test workspaceIdInvitationIdDelete', () async {
      // TODO
    });

    // Update an invitation
    //
    // Update the status of an existing invitation by its ID.
    //
    //Future<Invitation> workspaceIdInvitationIdPut(String workspaceId, String id, WorkspaceIdInvitationIdPutRequest workspaceIdInvitationIdPutRequest) async
    test('test workspaceIdInvitationIdPut', () async {
      // TODO
    });

    // Create a new invitation
    //
    // Create a new invitation for the specified workspace.
    //
    //Future<Invitation> workspaceIdInvitationPost(String workspaceId, WorkspaceIdInvitationPostRequest workspaceIdInvitationPostRequest) async
    test('test workspaceIdInvitationPost', () async {
      // TODO
    });

  });
}
