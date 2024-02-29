import 'package:cloud_firestore/cloud_firestore.dart';

class OrderProduct {
  // String id;
  // String uid;
  int index;
  String code;
  String name;
  // String orderID;

  OrderProduct({
    // required this.id,
    // required this.uid,
    required this.index,
    required this.code,
    required this.name,
    // required this.orderID,
  });

  factory OrderProduct.fromFirestore(Map<String, dynamic> data) {
    return OrderProduct(
      // id: data['id'],
      // uid: data['uid'],
      index: data['index'],
      code: data['code'],
      name: data['name'],
      // orderID: data['orderID'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      // "id": id,
      // "uid": uid,
      "index": index,
      "code": code,
      "name": name,
      // "orderID": orderID,
    };
  }
}