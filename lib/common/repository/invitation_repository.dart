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
    return _invitationApi.getAllInvitations(
      workspaceId: workspaceId,
    );
  }

  Future<Response<InvitationCreationResponse>> createInvitation({
    required String workspaceId,
    required CreateInvitationReq body,
  }) {
    return _invitationApi.createInvitation(
      workspaceId: workspaceId,
      createInvitationReq: body,
    );
  }

  Future<Response<void>> deleteInvitation({
    required String workspaceId,
    required String id,
  }) {
    return _invitationApi.deleteInvitation(
      workspaceId: workspaceId,
      id: id,
    );
  }
}
