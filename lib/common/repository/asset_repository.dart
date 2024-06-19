import 'package:cash_stacker_flutter_app/common/dio/dio.dart';
import 'package:cash_stacker_flutter_app/common/model/monthly_asset_trend_model.dart';
import 'package:cash_stacker_flutter_app/portfolio/model/asset_model.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';

part 'asset_repository.g.dart';

final assetRepositoryProvider = Provider<AssetRepository>(
  (ref) {
    final dio = ref.watch(dioProvider);

    final repository =
        AssetRepository(dio, baseUrl: dotenv.get('API_BASE_URL'));

    return repository;
  },
);

@RestApi()
abstract class AssetRepository {
  factory AssetRepository(Dio dio, {String baseUrl}) = _AssetRepository;

  static const basePath = '/{workspaceId}/assets';

  @POST(basePath)
  @Headers({'accessToken': 'true'})
  Future<void> createAsset({
    @Path() required String workspaceId,
    @Body() required body,
  });

  @GET(basePath)
  @Headers({'accessToken': 'true'})
  Future<List<Asset>> getAllAssets({
    @Path() required String workspaceId,
  });

  @GET('$basePath/{id}')
  @Headers({'accessToken': 'true'})
  Future<Asset> getOneAsset({
    @Path() required String workspaceId,
    @Path() required String id,
  });

  @PUT('$basePath/{id}')
  @Headers({'accessToken': 'true'})
  Future<void> updateAsset({
    @Path() required String workspaceId,
    @Path() required String id,
    @Body() required body,
  });

  @DELETE('$basePath/{id}')
  @Headers({'accessToken': 'true'})
  Future<void> deleteAsset({
    @Path() required String workspaceId,
    @Path() required String id,
  });

  @PUT('$basePath/{assetId}/transactions/{id}')
  @Headers({'accessToken': 'true'})
  Future<void> updateAssetTransaction({
    @Path() required String workspaceId,
    @Path() required String assetId,
    @Path() required String id,
    @Body() required body,
  });

  @DELETE('$basePath/{assetId}/transactions/{id}')
  @Headers({'accessToken': 'true'})
  Future<void> deleteAssetTransaction({
    @Path() required String workspaceId,
    @Path() required String assetId,
    @Path() required String id,
  });

  @POST('$basePath/monthlyTrend')
  @Headers({'accessToken': 'true'})
  Future<List<MonthlyAssetTrendModel>> getMonthlyTrends({
    @Path() required String workspaceId,
    @Body() required body,
  });
}
