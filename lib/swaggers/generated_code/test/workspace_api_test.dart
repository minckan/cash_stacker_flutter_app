import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for WorkspaceApi
void main() {
  final instance = Openapi().getWorkspaceApi();

  group(WorkspaceApi, () {
    // Get all workspaces
    //
    // Retrieve all workspaces.
    //
    //Future<BuiltList<Workspace>> workspacesGet() async
    test('test workspacesGet', () async {
      // TODO
    });

    // Get a workspace by ID
    //
    // Retrieve a specific workspace by its ID.
    //
    //Future<Workspace> workspacesIdGet(String id) async
    test('test workspacesIdGet', () async {
      // TODO
    });

    // Create a new workspace
    //
    // Create a new workspace with the provided information.
    //
    //Future<WorkspacesPost201Response> workspacesPost(WorkspacesPostRequest workspacesPostRequest) async
    test('test workspacesPost', () async {
      // TODO
    });

  });
}
