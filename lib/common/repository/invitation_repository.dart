import 'package:built_collection/built_collection.dart';
import 'package:cash_stacker_flutter_app/common/dio/dio.dart';
import 'package:cash_stacker_flutter_app/swaggers/openapi.dart';

import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_riverpod/flutter_riverpod.dart';

final invitationRepositoryProvider = Provider<InvitationRepository>(
  (ref) {
    final dio = ref.watch(dioProvider);
    final openapi = Openapi(dio: dio);
    final repository = InvitationRepository(openapi.getInvitationApi());
    return repository;
  },
);

class InvitationRepository {
  final InvitationApi _invitationApi;
  InvitationRepository(this._invitationApi);

  static const basePath = '/{workspaceId}/invitation';

  Future<Response<BuiltList<Invitation>>> getAllInvitations({
    required String workspaceId,
  }) {
    return _invitationApi.workspaceIdInvitationGet(
      workspaceId: workspaceId,
    );
  }

  Future<Response<Invitation>> createInvitation({
    required String workspaceId,
    required WorkspaceIdInvitationPostRequest body,
  }) {
    return _invitationApi.workspaceIdInvitationPost(
      workspaceId: workspaceId,
      workspaceIdInvitationPostRequest: body,
    );
  }

  Future<Response<Invitation>> updateInvitation({
    required String workspaceId,
    required String id,
    required WorkspaceIdInvitationIdPutRequest body,
  }) {
    return _invitationApi.workspaceIdInvitationIdPut(
      workspaceId: workspaceId,
      id: id,
      workspaceIdInvitationIdPutRequest: body,
    );
  }

  Future<Response<void>> deleteInvitation({
    required String workspaceId,
    required String id,
  }) {
    return _invitationApi.workspaceIdInvitationIdDelete(
      workspaceId: workspaceId,
      id: id,
    );
  }
}
