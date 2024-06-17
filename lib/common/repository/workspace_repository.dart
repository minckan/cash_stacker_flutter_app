import 'package:cash_stacker_flutter_app/common/dio/dio.dart';
import 'package:cash_stacker_flutter_app/home/model/workspace_model.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';

part 'workspace_repository.g.dart';

final workspaceRepositoryProvider = Provider<WorkspaceRepository>(
  (ref) {
    final dio = ref.watch(dioProvider);

    final repository = WorkspaceRepository(
      dio,
      baseUrl: '${dotenv.get('API_BASE_URL')}/workspaces',
    );

    return repository;
  },
);

@RestApi()
abstract class WorkspaceRepository {
  factory WorkspaceRepository(Dio dio, {String baseUrl}) = _WorkspaceRepository;

  @POST('/')
  @Headers({'accessToken': 'true'})
  Future<void> createWorkspace(
    @Body() body,
  );

  @GET('/')
  @Headers({'accessToken': 'true'})
  Future<List<Workspace>?> getAllWorkspaces(
    @Path() path,
  );

  @GET('/:id')
  @Headers({'accessToken': 'true'})
  Future<Workspace?> getOneWorkspace(
    @Path() path,
  );
}
