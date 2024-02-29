import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:senim/logic/general_providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:senim/logic/models/user.dart' as model;

abstract class BaseAuthRepository {
  Stream<User?> get authStateChange;
  User? getCurrentUser();
  Future<void> signOut();
}

class AuthRepository implements BaseAuthRepository {
  const AuthRepository({
    required this.firebaseAuth,
    required this.firebaseFirestore,
  });

  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;

  @override
  Stream<User?> get authStateChange =>
      firebaseAuth.authStateChanges();

  @override
  User? getCurrentUser() {
    return firebaseAuth.currentUser;
  }

  // -- Sign In --
  Future<String> signIn(
    String email,
    String password,
  ) async {
    String response = 'Some error occured';
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      response = 'success';
    } on FirebaseAuthException catch (error) {
      if (error.code == 'user-not-found') {
        response = 'user not found';
      } else if (error.code == 'wrong-password') {
        response = 'wrong password';
      } else {
        response = 'firebase error -- ${error.message}';
      }
    } catch (error) {
      response = error.toString();
    }

    return response;
  }

  // -- Sign Up --
  Future<String> signUp({
    required String name,
    required String phoneNumber,
    required String email,
    required String password,
  }) async {
    String response = "Some error occured";

    try {
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      String uid = credential.user!.uid;

      DocumentReference ref =
          firebaseFirestore.collection('users').doc(uid);

      model.User user = model.User(
        uid: uid,
        name: name,
        phoneNumber: phoneNumber,
        email: email,
        status: model.UserStatus(),
      );

      await ref.set(user.toFirestore());
      response = "success";
    } on FirebaseAuthException catch (error) {
      if (error.code == 'invalid-email') {
        response = 'The email is badly formatted';
      } else if (error.code == 'weak-password') {
        response = 'Password should be at least 6 characters';
      } else {
        response = 'Firebase error $error';
      }
    } catch (error) {
      response = error.toString();
    }

    return response;
  }

  // MARK: - Sign out
  @override
  signOut() async {
    await firebaseAuth.signOut();
  }
}
