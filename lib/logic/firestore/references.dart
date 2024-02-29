import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreRef {
  // MARK: - Firestore
  static final root = FirebaseFirestore.instance;
  // Users
  static final users = root.collection(_FirestorePath.users);
  static DocumentReference user(String uid) => users.doc(uid);
  // Orders
  static final orders = root.collection(_FirestorePath.orders);
  static DocumentReference order(String id) => orders.doc(id);
  // Reports
  static final companies = root.collection(_FirestorePath.companies);
  static DocumentReference company(String id) => companies.doc(id);
}

class _FirestorePath {
  static String users = 'users';
  static String orders = 'orders';
  static String companies = 'companies';
}