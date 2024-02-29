import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String uid;
  String name;
  String? surname;
  int? city;
  String email;
  String phoneNumber;
  String? avatarURL;
  String? description;
  int role;
  UserStatus status;

  User({
    required this.uid,
    required this.name,
    this.surname,
    this.city,
    required this.email,
    required this.phoneNumber,
    this.avatarURL,
    this.description,
    this.role = 1,
    required this.status,
  });

  factory User.fromFirestore(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return User(
      uid: data['uid'],
      name: data['name'],
      surname: data['surname'],
      city: data['city'],
      email: data['email'],
      phoneNumber: data['phoneNumber'],
      avatarURL: data['avatarURL'],
      description: data['description'],
      role: data['role'],
      status: UserStatus.fromFirestore(data['status']),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "uid": uid,
      "name": name,
      if (surname != null) "surname": surname,
      "city": city,
      "email": email,
      "phoneNumber": phoneNumber,
      if (avatarURL != null) "avatarURL": avatarURL,
      if (description != null) "description": description,
      "role": role,
      'status': status.toFirestore(),
    };
  }
}

class UserStatus {
  bool isVerified;
  bool isBanned;

  UserStatus({
    this.isVerified = false,
    this.isBanned =false,
  });

  factory UserStatus.fromFirestore(Map<String, dynamic> data) {
    return UserStatus(
      isVerified: data['isVerified'],
      isBanned: data['isBanned'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'isVerified': isVerified,
      'isBanned': isBanned,
    };
  }
}