import 'package:cash_stacker_flutter_app/common/dio/dio.dart';
import 'package:cash_stacker_flutter_app/common/model/monthly_asset_trend_model.dart';
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

  @POST('/monthlyTrend')
  @Headers({'accessToken': 'true'})
  Future<List<MonthlyAssetTrendModel>> getMonthlyTrends(
    @Body() body,
  );
}
