import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final db = FirebaseFirestore.instance;

  Future<int> getUserCount() async {
    return await db
        .collection("users")
        .get()
        .then((value) => value.docs.first.data()['users']);
  }

  void addUser(count) {
    db.collection("users").doc('count').set(count, SetOptions(merge: true));
  }
}
