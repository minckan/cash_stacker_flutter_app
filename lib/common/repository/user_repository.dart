import 'package:cash_stacker_flutter_app/common/dio/dio.dart';
import 'package:cash_stacker_flutter_app/swaggers/openapi.dart';

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
    return _userApi.getUser(id: id);
  }

  Future<Response<CreateUserResponse>> createUser({
    required CreateUserRequest body,
  }) {
    return _userApi.createUser(
      createUserRequest: body,
    );
  }

  Future<Response<void>> updateUser({
    required String id,
    required UpdateUserRequest body,
  }) {
    return _userApi.updateUserStatus(
      id: id,
      updateUserRequest: body,
    );
  }
}
