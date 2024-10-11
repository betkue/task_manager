import 'package:cloud_firestore/cloud_firestore.dart';

class Profile {

  String? id;
  String? userName;
  String? email;
  String? token;
  List<dynamic>? tasks;

  Profile(
      {this.id,
      this.userName,
    this.email,
    this.token,
    this.tasks
    });



  factory Profile.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    return Profile(
      id: data?['id'],
      userName: data?['lastName']?? data?['firstName'] ?? "User",
      email: data?['email'],
        token: data?['token'],
        tasks: data?['tasks'],
    );
  }



  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) "id": id,
      if (userName != null) "userName": userName,
      if (email != null) "email": email,
      if (token != null) "birthdate": token,
      if (tasks != null) "tasks": tasks,

    };
  }
}
