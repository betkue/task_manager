import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference usersCollections =
    FirebaseFirestore.instance.collection("users");

Future<bool> userExists({required String uid}) async {
  bool exists = false;
  await usersCollections.where("id", isEqualTo: uid).get().then((user) {
    exists = user.docs.isEmpty ? false : true;
  });
  return exists;
}
