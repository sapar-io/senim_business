import 'package:cloud_firestore/cloud_firestore.dart';

class Company {
  String id;
  String uid;
  int type;
  String iin;
  String name;
  String directorName;
  String? founderName;
  String lawAddress;
  String? realAddress;
  bool isDeleted;

  Company({
    required this.id,
    required this.uid,
    required this.type,
    required this.iin,
    required this.name,
    required this.directorName,
    this.founderName,
    required this.lawAddress,
    this.realAddress,
    this.isDeleted = false,
  });

  factory Company.fromFirestore(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return Company(
      id: data['id'],
      uid: data['uid'],
      type: data['type'],
      iin: data['iin'],
      name: data['name'],
      directorName: data['directorName'],
      founderName: data['founderName'],
      lawAddress: data['lawAddress'],
      realAddress: data['realAddress'],
      isDeleted: data['isDeleted'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "id": id,
      "uid": uid,
      "type": type,
      "iin": iin,
      "name": name,
      "directorName": directorName,
      if (founderName != null) "founderName": founderName,
      "lawAddress": lawAddress,
      if (realAddress != null) "realAddress": realAddress,
      "isDeleted": isDeleted,
    };
  }
}
