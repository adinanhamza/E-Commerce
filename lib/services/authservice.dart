import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Only use one instance of GoogleSignIn
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId:
        kIsWeb
            ? '426988229556-3l91br70k164t443j9oc0qf8o9d4au1m.apps.googleusercontent.com'
            : null,
  );

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await _auth.signInWithCredential(
        credential,
      );

      return userCredential.user;
    } catch (e) {
      print('Google Sign-In Error: $e');
      return null;
    }
  }

  Future<void>signOutFromGoogle()async{
    try {
      await _auth.signOut();
      await  _googleSignIn.signOut;
      log('google signOut success : ) ');
    }on FirebaseAuthException catch (e) {
      log('error in google SignOut ${e.message}');
      throw Exception('failed google SignOut');
    }
  }

  User? getCurrentUser() {
    return _auth.currentUser;
  }


// main email and password for create user
  Future<void> signUp({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      await _auth.currentUser?.sendEmailVerification();
      log('user registered! Email verification sent!');
    } on FirebaseAuthException catch (e) {
      throw Exception('error in register ${e.message}');
    }
  }

  Future<void>SignIn({required String email,required String password})async{
    try {
      await Future.delayed(Duration(seconds: 2));
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
     if (user != null) {
      if (user.emailVerified) {
        log('User logged in: ${user.email}');
      } else {
        throw Exception('Email not verified. Please verify your email.');
      }
    } else {
      throw Exception('No user returned from signIn.');
    }
  } on FirebaseAuthException catch (e) {
    throw Exception('User login failed: ${e.message}');
  }

  }

  Future<void>logOutEmail()async{
    try {
      await _auth.signOut();
        log('user logout successfully : )');
    }on FirebaseException catch (e) {
        log('failed user logout ${e.message}');
    }
  }
}
