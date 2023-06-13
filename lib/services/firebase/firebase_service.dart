import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final db = FirebaseFirestore.instance;

  Future<int> getUserCount() async {
    return await db
        .collection("users")
        .get()
        .then((value) => value.docs.first.data()['users']);
  }

  Future<bool> getStartStatus() async {
    return await db
        .collection("start")
        .get()
        .then((value) => value.docs.first.data()['status']);
  }

  void addUserCount(count) {
    db.collection("users").doc('count').set(count, SetOptions(merge: true));
  }

  void createCandidate(candidateID, candidate) {
    db
        .collection("candidates")
        .doc(candidateID)
        .set(candidate, SetOptions(merge: true));
  }
}
