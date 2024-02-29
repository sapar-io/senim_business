import 'package:cloud_firestore/cloud_firestore.dart';

class RestAPI {
  static void create(Map<String, dynamic> model, DocumentReference ref) async {
    return await ref.set(model);
  }
}
