import 'package:cash_stacker_flutter_app/common/providers/id_token.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio();

  final token = ref.watch(idTokenProvider);

  dio.interceptors.add(CustomInterceptor(token: token));

  return dio;
});

class CustomInterceptor extends Interceptor {
  final String? token;

  CustomInterceptor({
    required this.token,
  });

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    print('[REQ] [${options.method}] ${options.uri}');

    if (options.headers['accessToken'] == 'true') {
      // 헤더 삭제
      options.headers.remove('accessToken');

      // 실제 토큰으로 대체
      if (token != null) {
        options.headers.addAll({
          'authorization': 'Bearer $token',
        });
      }
    }

    return super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    return handler.reject(err);
  }
}
