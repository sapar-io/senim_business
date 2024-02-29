import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:senim/logic/models/order_product.dart';

class Order {
  String id;
  String companyID;
  String uid;
  List<OrderProduct> products;
  Timestamp createdData;
  OrderStatus status;

  Order({
    required this.id,
    required this.companyID,
    required this.uid,
    required this.products,
    required this.createdData,
    required this.status,
  });

  factory Order.fromFirestore(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    
    final List<OrderProduct> products = [];
    final productsData = data['products'] as List<dynamic>;
    for(final productData in productsData) {
      products.add(OrderProduct.fromFirestore(productData));
    }

    final Order order = Order(
      id: data['id'],
      companyID: data['companyID'],
      uid: data['uid'],
      products: products,
      createdData: data['createdData'],
      status: OrderStatus.fromFirestore(data['status']),
    );

    return order;
  }

  Map<String, dynamic> toFirestore() {
    final productsList = products.map((e) => e.toFirestore()).toList();

    return {
      "id": id,
      "companyID": companyID,
      "uid": uid,
      "products": productsList,
      "createdData": createdData,
      'status': status.toFirestore(),
    };
  }
}

class OrderStatus {
  bool isCreated;
  bool isManagerVerified;
  bool isSendCommercial;
  bool isClientVerified;
  bool isClientDocSign;
  bool isStartWork;
  bool isWaitingMaket;
  bool isWaitingClientApproveMaket;
  bool isClientApproveMaket;
  bool isCompleted;

  OrderStatus({
    this.isCreated = true,
    this.isManagerVerified = false,
    this.isSendCommercial = false,
    this.isClientVerified = false,
    this.isClientDocSign = false,
    this.isStartWork = false,
    this.isWaitingMaket = false,
    this.isWaitingClientApproveMaket = false,
    this.isClientApproveMaket = false,
    this.isCompleted = false,
  });

  factory OrderStatus.fromFirestore(Map<String, dynamic> data) {
    return OrderStatus(
      isCreated: data['isCreated'],
      isManagerVerified: data['isManagerVerified'],
      isSendCommercial: data['isSendCommercial'],
      isClientVerified: data['isClientVerified'],
      isClientDocSign: data['isClientDocSign'],
      isStartWork: data['isStartWork'],
      isWaitingMaket: data['isWaitingMaket'],
      isWaitingClientApproveMaket: data['isWaitingClientApproveMaket'],
      isClientApproveMaket: data['isClientApproveMaket'],
      isCompleted: data['isCompleted'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'isCreated': isCreated,
      'isManagerVerified': isManagerVerified,
      'isSendCommercial': isSendCommercial,
      'isClientVerified': isClientVerified,
      'isClientDocSign': isClientDocSign,
      'isStartWork': isStartWork,
      'isWaitingMaket': isWaitingMaket,
      'isWaitingClientApproveMaket': isWaitingClientApproveMaket,
      'isClientApproveMaket': isClientApproveMaket,
      'isCompleted': isCompleted,
    };
  }
}
