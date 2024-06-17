import 'package:cash_stacker_flutter_app/auth/model/user_model.dart';
import 'package:cash_stacker_flutter_app/common/dio/dio.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/http.dart';

part 'user_repository.g.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  final dio = ref.watch(dioProvider);

  final repository =
      UserRepository(dio, baseUrl: '${dotenv.get('API_BASE_URL')}/users');

  return repository;
});

@RestApi()
abstract class UserRepository {
  factory UserRepository(Dio dio, {String baseUrl}) = _UserRepository;

  @GET('/:id')
  Future<UserModel?> getUser(
    @Path() path,
  );

  @POST('/')
  Future<void> createUser(
    @Body() body,
  );

  @PUT('/:id')
  @Headers({'accessToken': 'true'})
  Future<void> updateUser(
    @Path() path,
    @Body() body,
  );
}
