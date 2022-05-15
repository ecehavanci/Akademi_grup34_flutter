import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class User_ {
  final String uid;
  final String? name;
  final String? email;
  final String? horoscope;
  final Array? likedMoviesIndexs;

  User_({
    required this.uid,
    this.name,
    this.email,
    this.horoscope,
    this.likedMoviesIndexs,
  });

  User_.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  )   : name = snapshot.data()?["name"],
        uid = snapshot.data()?["uid"],
        email = snapshot.data()?["email"],
        horoscope = snapshot.data()?["horoscope"],
        likedMoviesIndexs = snapshot.data()?["likedMoviesIndexs"];

  Map<String, dynamic> toFirestore() {
    return {
      if (uid != null) "uid": uid,
      if (name != null) "name": name,
      if (email != null) "email": email,
      if (horoscope != null) "horoscope": horoscope,
      if (likedMoviesIndexs != null) "likedMoviesIndexs": likedMoviesIndexs,
    };
  }

}
