import 'package:cash_stacker_flutter_app/setting/model/invitation_model.dart';
import 'package:cash_stacker_flutter_app/setting/service/firestore_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InvitationViewModel extends StateNotifier<void> {
  final FirestoreService _firestoreService;

  InvitationViewModel(this._firestoreService) : super(null);

  Future<void> sendInvitation(Invitation invitation) async {
    try {
      if (await _firestoreService.isEmailAlreadyInvited(
          invitation.workspaceId, invitation.email)) {
        throw Exception('This email is already invited.');
      }

      await _firestoreService.addInvitation(invitation);
    } catch (e) {
      print('Failed to send invitation: $e');
    }
  }
}

final firestoreServiceProvider = Provider<FirestoreService>((ref) {
  return FirestoreService();
});

final invitationViewModelProvider =
    StateNotifierProvider<InvitationViewModel, void>((ref) {
  return InvitationViewModel(ref.read(firestoreServiceProvider));
});
