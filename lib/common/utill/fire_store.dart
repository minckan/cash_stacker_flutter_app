import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseFirestore db = FirebaseFirestore.instance;
CollectionReference<Map<String, dynamic>> users = db.collection("users");

Future<bool> checkDBUser(String email) async {
  try {
    await users.get().then((snapshot) {
      print(snapshot.docs);
      if (snapshot.docs.isEmpty) {
        return false;
      }
      QuerySnapshot querySnapshot = users.where('email', isEqualTo: email).get()
          as QuerySnapshot<Object?>;
      if (querySnapshot.docs.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    });

    return false;
  } catch (e) {
    return false;
  }
}

void createUser(UserCredential user) async {
  db.collection("users").doc().set(
    {'email': user.user?.email, 'id': user.user?.uid},
  );
}
