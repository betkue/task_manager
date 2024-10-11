import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:task_manager/src/functions/firebase-messagering.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_manager/src/utils/constant.dart';
// Future<User?> signInWithGoogle() async {
//   try {
//     // Trigger the authentication flow
//     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

//     if (googleUser == null) {
//       return null; // L'utilisateur a annulé la connexion
//     }

//     // Obtain the auth details from the request
//     final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

//     // Create a new credential
//     final credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//     );

//     // Sign in to Firebase with the Google user credentials
//     final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

//     return userCredential.user;
//   } catch (e) {
//     print(e);
//     return null;
//   }
// }

signInWithGoogle() async {
  try {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    final credentials = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken, idToken: gAuth.idToken);

    return await FirebaseAuth.instance
        .signInWithCredential(credentials)
        .then((UserCredential userCredential) async {
      if (userCredential.user?.uid != null) {
        await userExists(uid: userCredential.user!.uid).then((exists) {
          if (exists) {
            FirebaseMessaging.instance.getToken().then((token) async {
              await FirebaseFirestore.instance
                  .collection("users")
                  .doc(userCredential.user!.uid)
                  .update({'tokens': token});
            });
          } else {
            FirebaseMessaging.instance.getToken().then((token) async {
              await usersCollections.doc(userCredential.user!.uid).update({
                'id': userCredential.user!.uid,
                'userName': userCredential.user!.displayName,
                'email': userCredential.user!.email,
                'token': token,
                'tasks': [],
              });
            });
          }
        });
      }
    });
  } catch (e) {
    log(e.toString());
  }
}

// Future<void> createUserInFirestore(User? user, String token) async {
//   if (user != null) {
//     await usersCollections.doc(user.uid).set({
//       'id': user.uid,
//       'name': user.displayName,
//       'email': user.email,
//       'token': token,
//       'tasks': [], // Initial tasks as an empty list
//     });
//   }
// }

// Future<void> login() async {
//   User? user = await signInWithGoogle();
//   if (user != null) {
//     String? token = await getToken();
//     if (token != null) {
//       // Enregistrer dans Firestore
//       await createUserInFirestore(user, token);

//       // Sauvegarder localement pour le mode hors-ligne
//       await saveUserLocally(user.uid, user.displayName ?? '', token, []);
//     }
//   }
// }
