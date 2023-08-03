import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_map/views/sign_up.dart';

FirebaseAuth auth = FirebaseAuth.instance;

class Auth {
  String email = '';
  String password = '';
  String name = '';
  String message = '';
  
  Register() async {
    try {
      message = '';
      await auth.createUserWithEmailAndPassword(
          email: this.email, password: this.password);
     
    } on FirebaseAuthException catch (e) {
      message = '';

      message = e.message.toString();
      print("message:$message");
    }
  }
  
   SignIn() async {
    try {
      message = '';
      await auth.signInWithEmailAndPassword(
          email: this.email, password: this.password);
     
    } on FirebaseAuthException catch (e) {
      message = '';

      message = e.message.toString();
      print("message:$message");
    }
  }
}
