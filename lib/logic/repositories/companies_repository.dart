import 'package:firebase_auth/firebase_auth.dart';
import 'package:senim/logic/firestore/references.dart';
import 'package:senim/logic/models/company.dart';

class CompaniesRepository {
  // -- Admin --
  Stream<List<Company>> listenMyCompanies() {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    final ref = FirestoreRef.companies
        .where("uid", isEqualTo: uid)
        .where("isDeleted", isEqualTo: false);

    return ref.snapshots().map((snapshots) {
      List<Company> companies = [];

      for (var snapshot in snapshots.docs) {
        final model = Company.fromFirestore(snapshot);
        companies.add(model);
      }

      return companies;
    });
  }

  Future<bool> delete({required String id}) async {
    await FirestoreRef.company(id).update({
      'isDeleted': true,
    });

    return true;
  }

  Future<List<Company>> getCompanies() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    final ref = FirestoreRef.companies
        .where("uid", isEqualTo: uid)
        .where("isDeleted", isEqualTo: false);

    final snapshots = await ref.get();

    if (snapshots.docs.isEmpty) return [];

    List<Company> companies = [];

    for (var snapshot in snapshots.docs) {
      final model = Company.fromFirestore(snapshot);
      companies.add(model);
    }
    return companies;
  }

  Future<Company> getCompany(String id) async {
    final ref = FirestoreRef.company(id);

    final snapshot = await ref.get();
    final model = Company.fromFirestore(snapshot);
    return model;
  }
}
