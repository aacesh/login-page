import 'package:firebase_auth/firebase_auth.dart';

import 'dart:async';

abstract class BaseAuth {
  Future<String> signInWithEmailAndPassword(String email, String password);
  Future<String> createUserWithEmailAndPassword(String email, String password);
}

class Auth implements BaseAuth{
  Future<String> signInWithEmailAndPassword(
      String email, String password) async {
    FirebaseUser firebaseUser = (await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password))
        .user;
    return firebaseUser.uid;
  }

   Future<String> createUserWithEmailAndPassword(
      String email, String password) async {
    FirebaseUser firebaseUser = (await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password))
        .user;
    return firebaseUser.uid;
  }
}
