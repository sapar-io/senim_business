import 'package:firebase_auth/firebase_auth.dart';
import 'package:senim/logic/firestore/references.dart';
import 'package:senim/logic/models/order.dart';

class OrdersRepository {
  // -- Admin --
  Stream<List<Order>> listenMyOrders() {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    final ref = FirestoreRef.orders.where("uid", isEqualTo: uid);

    return ref.snapshots().map((snapshots) {
      List<Order> models = [];

      for (var snapshot in snapshots.docs) {
        final model = Order.fromFirestore(snapshot);
        models.add(model);
      }

      return models;
    });
  }
}
