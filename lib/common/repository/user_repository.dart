import 'package:cash_stacker_flutter_app/common/dio/dio.dart';
import 'package:cash_stacker_flutter_app/swaggers/src/api.dart';
import 'package:cash_stacker_flutter_app/swaggers/src/api/user_api.dart';
import 'package:cash_stacker_flutter_app/swaggers/src/model/user.dart';
import 'package:cash_stacker_flutter_app/swaggers/src/model/users_id_put_request.dart';
import 'package:cash_stacker_flutter_app/swaggers/src/model/users_post201_response.dart';
import 'package:cash_stacker_flutter_app/swaggers/src/model/users_post_request.dart';

import 'package:dio/dio.dart' hide Headers;

import 'package:flutter_riverpod/flutter_riverpod.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  final dio = ref.watch(dioProvider);
  final openapi = Openapi(dio: dio);
  final repository = UserRepository(openapi.getUserApi());
  return repository;
});

class UserRepository {
  final UserApi _userApi;
  UserRepository(this._userApi);

  Future<Response<User>> getUser({
    required String id,
  }) {
    return _userApi.usersIdGet(id: id);
  }

  Future<Response<UsersPost201Response>> createUser({
    required UsersPostRequest body,
  }) {
    return _userApi.usersPost(
      usersPostRequest: body,
    );
  }

  Future<Response<void>> updateUser({
    required String id,
    required UsersIdPutRequest body,
  }) {
    return _userApi.usersIdPut(
      id: id,
      usersIdPutRequest: body,
    );
  }
}
