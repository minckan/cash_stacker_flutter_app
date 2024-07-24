import 'package:built_collection/built_collection.dart';
import 'package:cash_stacker_flutter_app/common/dio/dio.dart';
import 'package:cash_stacker_flutter_app/swaggers/openapi.dart';

import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_riverpod/flutter_riverpod.dart';

final workspaceRepositoryProvider = Provider<WorkspaceRepository>(
  (ref) {
    final dio = ref.watch(dioProvider);
    final openapi = Openapi(dio: dio);
    final repository = WorkspaceRepository(openapi.getWorkspaceApi());
    return repository;
  },
);

class WorkspaceRepository {
  final WorkspaceApi _workspaceApi;
  WorkspaceRepository(this._workspaceApi);

  Future<Response<WorkspacesPost201Response>> createWorkspace({
    required WorkspacesPostRequest body,
  }) {
    return _workspaceApi.workspacesPost(
      workspacesPostRequest: body,
    );
  }

  Future<Response<BuiltList<Workspace>>> getAllWorkspaces() {
    return _workspaceApi.workspacesGet();
  }

  Future<Response<Workspace>> getOneWorkspace({
    required String id,
  }) {
    return _workspaceApi.workspacesIdGet(
      id: id,
    );
  }
}
