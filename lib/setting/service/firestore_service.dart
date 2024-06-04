import 'package:cash_stacker_flutter_app/setting/model/invitation_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addInvitation(Invitation invitation) async {
    try {
      await _db
          .collection('invitations')
          .doc(invitation.id)
          .set(invitation.toJson());
    } catch (e) {
      throw Exception('Failed to add invitation: $e');
    }
  }

  Future<bool> isEmailAlreadyInvited(String workspaceId, String email) async {
    try {
      final querySnapshot = await _db
          .collection('invitations')
          .where('workspaceId', isEqualTo: workspaceId)
          .where('email', isEqualTo: email)
          .get();

      return querySnapshot.docs.isNotEmpty;
    } catch (e) {
      throw Exception('Failed to check email: $e');
    }
  }
}
