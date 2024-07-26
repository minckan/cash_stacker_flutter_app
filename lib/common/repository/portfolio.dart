import 'package:cash_stacker_flutter_app/common/dio/dio.dart';
import 'package:cash_stacker_flutter_app/swaggers/openapi.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final portfolioRepositoryProvider = Provider<PortfolioRepository>(
  (ref) {
    final dio = ref.watch(dioProvider);
    final openapi = Openapi(dio: dio);
    final repository = PortfolioRepository(openapi.getDefaultApi());
    return repository;
  },
);

class PortfolioRepository {
  final DefaultApi _portfolioApi;
  PortfolioRepository(this._portfolioApi);

  Future<Response<Portfolio>> getPortfolio(String workspaceId) {
    return _portfolioApi.workspaceIdPortfolioGet(workspaceId: workspaceId);
  }
}
