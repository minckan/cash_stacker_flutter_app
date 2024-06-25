import 'package:cash_stacker_flutter_app/auth/util/id_token.dart';
import 'package:cash_stacker_flutter_app/common/const/storage.dart';
import 'package:cash_stacker_flutter_app/common/secure_storage/secure_storage.dart';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio();

  final storage = ref.watch(secureStorageProvider);

  dio.interceptors.add(CustomInterceptor(storage: storage));

  return dio;
});

class CustomInterceptor extends Interceptor {
  final FlutterSecureStorage storage;

  CustomInterceptor({
    required this.storage,
  });

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    print('[REQ] [${options.method}] ${options.uri}');

    if (options.headers['accessToken'] == 'true') {
      // 헤더 삭제
      options.headers.remove('accessToken');

      final token = await storage.read(key: ACCESS_TOKEN_KEY);

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
    print('ERROR: $err');

    if (err.response?.statusCode == 401) {
      try {
        // 새로운 ID 토큰 발급
        String newIdToken = await getIdToken();

        // 새로운 토큰을 스토리지에 저장
        await storage.write(key: ACCESS_TOKEN_KEY, value: newIdToken);

        // 원래 요청 정보 가져오기
        final options = err.requestOptions;

        // 헤더 갱신
        options.headers['authorization'] = 'Bearer $newIdToken';

        // 새로운 요청으로 재시도
        final newResponse = await Dio().fetch(options);
        return handler.resolve(newResponse);
      } catch (e) {
        print('Error while refreshing token: $e');
        // 갱신 실패 시 에러 처리
        return handler.reject(err);
      }
    }

    return handler.reject(err);
  }
}
