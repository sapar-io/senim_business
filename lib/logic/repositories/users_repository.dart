import 'dart:async';

import 'package:senim/logic/firestore/references.dart';
import 'package:senim/logic/firestore/rest_api.dart';
import 'package:senim/logic/models/user.dart' as model;
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class UsersRepository {
  Future<void> createUser({required model.User model});
  Future<model.User?> getUser({required String uid});
  Stream<model.User?> listenUser({required String uid});
  Future<bool> updateUser({
    required String uid,
    required Map<String, dynamic> data,
  });
  // Stream<List<model.User>> listenAllWaitingExperts();
  // Future<bool> approveExpert({required String uid});
}

class UsersRepositoryImpl implements UsersRepository {
  @override
  Future<void> createUser({required model.User model}) async {
    final ref = FirestoreRef.user(model.uid);
    return RestAPI.create(model.toFirestore(), ref);
  }

  @override
  Future<model.User?> getUser({required String uid}) async {
    final ref = FirestoreRef.user(uid);
    try {
      DocumentSnapshot snapshot = await ref.get();
      return model.User.fromFirestore(snapshot);
    } catch (error) {
      // ignore: avoid_print
      print("error $error");
      return null;
    }
  }

  @override
  Stream<model.User?> listenUser({required String uid}) {
    final ref = FirestoreRef.user(uid);
    return ref.snapshots().map((snapshot) {
      if (snapshot.data() == null) {
        return null;
      }
      return model.User.fromFirestore(snapshot);
    });
  }

  @override
  Future<bool> updateUser({
    required String uid,
    required Map<String, dynamic> data,
  }) async {
    await FirestoreRef.user(uid).update(data);
    return true;
  }

  // -- Experts --
  // @override
  // Stream<List<model.User>> listenAllWaitingExperts() {
  //   final ref = FirestoreRef.users
  //       .where("role", isEqualTo: 1)
  //       .where("status.isCompleted", isEqualTo: false);

  //   return ref.snapshots().map((snapshots) {
  //     List<model.User> users = [];

      // for (var snapshot in snapshots.docs) {
      //   final user = model.User.fromFirestore(snapshot);
      //   users.add(user);
      // }

  //     return users;
  //   });
  // }

  // Future<bool> approveExpert({required String uid}) async {
  //   await FirestoreRef.user(uid).update({
  //     'status.isCompleted': true,
  //   });

  //   return true;
  // }
}
