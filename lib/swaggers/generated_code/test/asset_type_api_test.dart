import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for AssetTypeApi
void main() {
  final instance = Openapi().getAssetTypeApi();

  group(AssetTypeApi, () {
    // Get all asset types
    //
    // Retrieve all asset types for the specified workspace.
    //
    //Future<BuiltList<AssetType>> workspaceIdAssetTypeGet(String workspaceId) async
    test('test workspaceIdAssetTypeGet', () async {
      // TODO
    });

    // Delete an asset type
    //
    // Delete an existing asset type by its ID.
    //
    //Future workspaceIdAssetTypeIdDelete(String workspaceId, int id) async
    test('test workspaceIdAssetTypeIdDelete', () async {
      // TODO
    });

    // Update an asset type
    //
    // Update an existing asset type by its ID.
    //
    //Future<AssetType> workspaceIdAssetTypeIdPut(String workspaceId, int id, WorkspaceIdAssetTypeIdPutRequest workspaceIdAssetTypeIdPutRequest) async
    test('test workspaceIdAssetTypeIdPut', () async {
      // TODO
    });

    // Create a new asset type
    //
    // Create a new asset type for the specified workspace.
    //
    //Future<AssetType> workspaceIdAssetTypePost(String workspaceId, WorkspaceIdAssetTypePostRequest workspaceIdAssetTypePostRequest) async
    test('test workspaceIdAssetTypePost', () async {
      // TODO
    });

  });
}
