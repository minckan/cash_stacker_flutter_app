//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:dio/dio.dart';
import 'package:built_value/serializer.dart';
import 'serializers.dart';
import 'auth/api_key_auth.dart';
import 'auth/basic_auth.dart';
import 'auth/bearer_auth.dart';
import 'auth/oauth.dart';
import 'api/asset_api.dart';
import 'api/asset_type_api.dart';
import 'api/budget_api.dart';
import 'api/exchange_rate_api.dart';
import 'api/financial_category_api.dart';
import 'api/financial_tracker_api.dart';
import 'api/invitation_api.dart';
import 'api/user_api.dart';
import 'api/workspace_api.dart';

class Openapi {
  static const String basePath = r'http://localhost:8000';

  final Dio dio;
  final Serializers serializers;

  Openapi({
    Dio? dio,
    Serializers? serializers,
    String? basePathOverride,
    List<Interceptor>? interceptors,
  })  : this.serializers = serializers ?? standardSerializers,
        this.dio = dio ??
            Dio(BaseOptions(
              baseUrl: basePathOverride ?? basePath,
              connectTimeout: const Duration(milliseconds: 5000),
              receiveTimeout: const Duration(milliseconds: 3000),
            )) {
    if (interceptors == null) {
      this.dio.interceptors.addAll([
        OAuthInterceptor(),
        BasicAuthInterceptor(),
        BearerAuthInterceptor(),
        ApiKeyAuthInterceptor(),
      ]);
    } else {
      this.dio.interceptors.addAll(interceptors);
    }
  }

  void setOAuthToken(String name, String token) {
    if (this.dio.interceptors.any((i) => i is OAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is OAuthInterceptor)
              as OAuthInterceptor)
          .tokens[name] = token;
    }
  }

  void setBearerAuth(String name, String token) {
    if (this.dio.interceptors.any((i) => i is BearerAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BearerAuthInterceptor)
              as BearerAuthInterceptor)
          .tokens[name] = token;
    }
  }

  void setBasicAuth(String name, String username, String password) {
    if (this.dio.interceptors.any((i) => i is BasicAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BasicAuthInterceptor)
              as BasicAuthInterceptor)
          .authInfo[name] = BasicAuthInfo(username, password);
    }
  }

  void setApiKey(String name, String apiKey) {
    if (this.dio.interceptors.any((i) => i is ApiKeyAuthInterceptor)) {
      (this
                  .dio
                  .interceptors
                  .firstWhere((element) => element is ApiKeyAuthInterceptor)
              as ApiKeyAuthInterceptor)
          .apiKeys[name] = apiKey;
    }
  }

  /// Get AssetApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  AssetApi getAssetApi() {
    return AssetApi(dio, serializers);
  }

  /// Get AssetTypeApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  AssetTypeApi getAssetTypeApi() {
    return AssetTypeApi(dio, serializers);
  }

  /// Get BudgetApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  BudgetApi getBudgetApi() {
    return BudgetApi(dio, serializers);
  }

  /// Get ExchangeRateApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  ExchangeRateApi getExchangeRateApi() {
    return ExchangeRateApi(dio, serializers);
  }

  /// Get FinancialCategoryApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  FinancialCategoryApi getFinancialCategoryApi() {
    return FinancialCategoryApi(dio, serializers);
  }

  /// Get FinancialTrackerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  FinancialTrackerApi getFinancialTrackerApi() {
    return FinancialTrackerApi(dio, serializers);
  }

  /// Get InvitationApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  InvitationApi getInvitationApi() {
    return InvitationApi(dio, serializers);
  }

  /// Get UserApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  UserApi getUserApi() {
    return UserApi(dio, serializers);
  }

  /// Get WorkspaceApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  WorkspaceApi getWorkspaceApi() {
    return WorkspaceApi(dio, serializers);
  }
}
