import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final db = FirebaseFirestore.instance;

  Future<int> getUserCount() async {
    final usersData = await db.collection("users").get();
    return await usersData.docs.first.data()['users'];
  }

  Future<bool> getStartStatus() async {
    final statusData = await db.collection("start").get();
    return statusData.docs.first.data()['status'];
  }

  Stream<bool> getStartStatusWithStream() async* {
    final snapData = db.collection("start").snapshots();
    await for (final eachStatus in snapData) {
      if (eachStatus.docChanges.isNotEmpty) {
        final first = eachStatus.docChanges.first.doc.data()!['status'] as bool;
        yield first;
      }
    }
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getCandidateList() async {
    return await db.collection("candidates").get();
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
