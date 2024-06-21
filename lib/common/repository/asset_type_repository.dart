import 'package:cash_stacker_flutter_app/common/dio/dio.dart';
import 'package:cash_stacker_flutter_app/setting/model/asset_type_model.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';

part 'asset_type_repository.g.dart';

final assetTypeRepositoryProvider = Provider<AssetTypeRepository>(
  (ref) {
    final dio = ref.watch(dioProvider);

    final repository =
        AssetTypeRepository(dio, baseUrl: dotenv.get('API_BASE_URL'));

    return repository;
  },
);

@RestApi()
abstract class AssetTypeRepository {
  factory AssetTypeRepository(Dio dio, {String baseUrl}) = _AssetTypeRepository;

  static const basePath = '/{workspaceId}/asset/type';

  @GET(basePath)
  @Headers({'accessToken': 'true'})
  Future<List<AssetTypeModel>> getAllAssetTypes({
    @Path() required String workspaceId,
  });

  @POST(basePath)
  @Headers({'accessToken': 'true'})
  Future<AssetTypeModel> createAssetType({
    @Path() required String workspaceId,
    @Body() required AssetTypeModel body,
  });

  @PUT('$basePath/{id}')
  @Headers({'accessToken': 'true'})
  Future<AssetTypeModel> updateAssetType({
    @Path() required String workspaceId,
    @Path() required String id,
    @Body() required body,
  });

  @DELETE('$basePath/{id}')
  @Headers({'accessToken': 'true'})
  Future<void> deleteAssetType({
    @Path() required String workspaceId,
    @Path() required String id,
  });
}
