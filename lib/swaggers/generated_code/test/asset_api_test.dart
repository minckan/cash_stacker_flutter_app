import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for AssetApi
void main() {
  final instance = Openapi().getAssetApi();

  group(AssetApi, () {
    // Delete an asset transaction by ID
    //
    // Delete a specific asset transaction by its ID.
    //
    //Future<WorkspaceIdAssetsAssetIdTransactionsIdDelete201Response> workspaceIdAssetsAssetIdTransactionsIdDelete(String workspaceId, int assetId, int id) async
    test('test workspaceIdAssetsAssetIdTransactionsIdDelete', () async {
      // TODO
    });

    // update asset transaction by ID
    //
    // update specific asset transaction by its ID.
    //
    //Future<AssetTransaction> workspaceIdAssetsAssetIdTransactionsIdPut(String workspaceId, int assetId, int id, WorkspaceIdAssetsAssetIdTransactionsIdPutRequest workspaceIdAssetsAssetIdTransactionsIdPutRequest) async
    test('test workspaceIdAssetsAssetIdTransactionsIdPut', () async {
      // TODO
    });

    // Create a new asset transaction
    //
    // Create a new asset transaction for the specified asset
    //
    //Future<AssetTransaction> workspaceIdAssetsAssetIdTransactionsPost(String workspaceId, String assetId, AssetTransaction assetTransaction) async
    test('test workspaceIdAssetsAssetIdTransactionsPost', () async {
      // TODO
    });

    // Get all assets
    //
    // Retrieve all assets for the specified workspace.
    //
    //Future<BuiltList<Asset>> workspaceIdAssetsGet(String workspaceId) async
    test('test workspaceIdAssetsGet', () async {
      // TODO
    });

    // Delete an asset by ID
    //
    // Delete a specific asset by its ID.
    //
    //Future workspaceIdAssetsIdDelete(String workspaceId, int id) async
    test('test workspaceIdAssetsIdDelete', () async {
      // TODO
    });

    // asset ID로 자산 조회
    //
    // Retrieve a specific asset by its ID.
    //
    //Future<Asset> workspaceIdAssetsIdGet(String workspaceId, int id) async
    test('test workspaceIdAssetsIdGet', () async {
      // TODO
    });

    // 자산 데이터 수정
    //
    // Update the name of a specific asset by its ID.
    //
    //Future<Asset> workspaceIdAssetsIdPut(String workspaceId, int id, WorkspaceIdAssetsIdPutRequest workspaceIdAssetsIdPutRequest) async
    test('test workspaceIdAssetsIdPut', () async {
      // TODO
    });

    // Get monthly asset trend
    //
    // Retrieve the monthly trend of assets for the specified workspace.
    //
    //Future<BuiltList<WorkspaceIdAssetsMonthlyTrendGet200ResponseInner>> workspaceIdAssetsMonthlyTrendGet(String workspaceId) async
    test('test workspaceIdAssetsMonthlyTrendGet', () async {
      // TODO
    });

    // Create a new asset
    //
    // Create a new asset for the specified workspace.
    //
    //Future<Asset> workspaceIdAssetsPost(String workspaceId, WorkspaceIdAssetsPostRequest workspaceIdAssetsPostRequest) async
    test('test workspaceIdAssetsPost', () async {
      // TODO
    });

  });
}
