import 'package:cash_stacker_flutter_app/common/dio/dio.dart';
import 'package:cash_stacker_flutter_app/setting/model/invitation_model.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';

part 'invitation_repository.g.dart';

final invitationRepositoryProvider = Provider<InvitationRepository>(
  (ref) {
    final dio = ref.watch(dioProvider);

    final repository =
        InvitationRepository(dio, baseUrl: dotenv.get('API_BASE_URL'));

    return repository;
  },
);

@RestApi()
abstract class InvitationRepository {
  factory InvitationRepository(Dio dio, {String baseUrl}) =
      _InvitationRepository;

  static const basePath = '/{workspaceId}/invitation';

  @GET(basePath)
  @Headers({'accessToken': 'true'})
  Future<List<Invitation>> getAllInvitations({
    @Path() required String workspaceId,
  });

  @POST(basePath)
  @Headers({'accessToken': 'true'})
  Future<Invitation> createInvitation({
    @Path() required String workspaceId,
    @Body() required Invitation body,
  });

  @PUT('$basePath/{id}')
  @Headers({'accessToken': 'true'})
  Future<Invitation> updateInvitation({
    @Path() required String workspaceId,
    @Path() required String id,
    @Body() required body,
  });

  @DELETE('$basePath/{id}')
  @Headers({'accessToken': 'true'})
  Future<void> deleteInvitation({
    @Path() required String workspaceId,
    @Path() required String id,
  });
}
