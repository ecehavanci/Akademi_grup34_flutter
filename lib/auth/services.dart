import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class User_ {
  final String uid;
  final String? name;
  final String? email;
  final DateTime? birthDate;
  final String? gender;
  final List? likedMoviesIndexs;

  User_({
    required this.uid,
    this.name,
    this.email,
    this.birthDate,
    this.gender,
    this.likedMoviesIndexs,
  });

  User_.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  )   : name = snapshot.data()?["name"],
        uid = snapshot.data()?["uid"],
        email = snapshot.data()?["email"],
        birthDate = snapshot.data()?["birthDate"],
        gender = snapshot.data()?["gender"],
        likedMoviesIndexs = snapshot.data()?["likedMoviesIndexs"];

  Map<String, dynamic> toFirestore() {
    return {
      if (uid != null) "uid": uid,
      if (name != null) "name": name,
      if (email != null) "email": email,
      if (birthDate != null) "birthDate": birthDate,
      if (gender != null) "gender": gender,
      if (likedMoviesIndexs != null) "likedMoviesIndexs": likedMoviesIndexs,
    };
  }
}
