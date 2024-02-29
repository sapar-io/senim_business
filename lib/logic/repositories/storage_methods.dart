import 'dart:typed_data';

import 'package:senim/logic/general_providers.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:senim/logic/repositories/auth_repository.dart';

class StorageRepository {
  const StorageRepository({
    required this.authRepository,
    required this.firebaseStorage,
  });

  final AuthRepository authRepository;
  final FirebaseStorage firebaseStorage;

  // -- Methods --
  Future<String> uploadAvatar(Uint8List file) async {
    String uid = authRepository.getCurrentUser()!.uid;

    Reference ref =
        firebaseStorage.ref().child('avatars').child(uid);
    UploadTask uploadTask = ref.putData(file);

    try {
      TaskSnapshot snapshot = await uploadTask;
      String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } on FirebaseException catch (e) {
      print("Firebase exception;");
      print(e.message);
      print(e);
      print(e.toString());
      return "";
    } catch (e) {
      print("just error");
      print(e);
      print(e.toString());
      return "";
    }
  }
}
