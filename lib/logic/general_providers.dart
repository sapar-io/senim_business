
import 'package:firebase_storage/firebase_storage.dart';
import 'package:senim/logic/repositories/auth_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:senim/logic/repositories/companies_repository.dart';
import 'package:senim/logic/repositories/orders_repository.dart';
import 'package:senim/logic/repositories/storage_methods.dart';
import 'package:senim/logic/repositories/users_repository.dart';

// Firebase Auth
final firebaseAuthProvider = Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

// Firebase Firestore
final firebaseFirestoreProvider = Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance); 

// Firebase Storage
final firebaseStorageProvider = Provider<FirebaseStorage>((ref) => FirebaseStorage.instance); 

final authRepositoryProvider = Provider<AuthRepository>((ref) => AuthRepository(firebaseAuth: ref.read(firebaseAuthProvider), firebaseFirestore: ref.read(firebaseFirestoreProvider)));

final authStateProvider = StreamProvider<User?>((ref) {
  return ref.watch(authRepositoryProvider).authStateChange;
});

// Провайдер всех методов связанные с пользователем
final userRepositoryProvider = Provider<UsersRepository>((ref) => UsersRepositoryImpl()); 
// Провайдер всех методов связанные с пользователем
final ordersRepositoryProvider = Provider<OrdersRepository>((ref) => OrdersRepository()); 

// Провайдер всех методов связанные с пользователем
final companiesRepositoryProvider = Provider<CompaniesRepository>((ref) => CompaniesRepository()); 

// Провайдер всех методов связанные с storage
final storageRepositoryProvider = Provider<StorageRepository>((ref) => StorageRepository(authRepository: ref.read(authRepositoryProvider), firebaseStorage: ref.read(firebaseStorageProvider)));
