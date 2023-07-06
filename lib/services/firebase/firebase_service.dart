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

  Future<Map<String, dynamic>> getWinner() async {
    final snapData = await db.collection("candidates").get();
    var winner = snapData.docs.first.data();
    for (var element in snapData.docs) {
      if (element.data()['voteCount'] > winner['voteCount']) {
        winner = element.data();
      }
    }
    return winner;
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

  Stream<bool> getPollState() async* {
    final snapData = db.collection("start").snapshots().asBroadcastStream();
    await for (final eachSnapData in snapData) {
      if (eachSnapData.docChanges.isNotEmpty) {
        final firstData =
            eachSnapData.docChanges.first.doc.data()?['pollStatus'] as bool;
        yield firstData;
      }
    }
  }

  Stream<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getCandidates() async* {
    final snapData = db.collection("candidates").snapshots();
    await for (final candidateStreamItem in snapData) {
      if (candidateStreamItem.docChanges.isNotEmpty) {
        yield candidateStreamItem.docs;
      }
    }
  }

  void changeStartStatus(bool status) async {
    final finalStatus = !status;
    await db.collection("start").doc("start").update({"status": finalStatus});
  }

  void addUserCount() async {
    final oldCount = await FirebaseService().getUserCount();
    final newCount = {"users": oldCount + 1};
    db.collection("users").doc('count').set(newCount, SetOptions(merge: true));
  }

  void createCandidate(String candidateID, Map<String, Object?> candidate) {
    db
        .collection("candidates")
        .doc(candidateID)
        .set(candidate, SetOptions(merge: true));
  }

  Future<void> updateCandidateVoteCount(dynamic candidate) async {
    final data = db.collection("candidates");
    final candidateID = candidate["candidateID"];
    data.doc(candidateID).update(candidate);
  }
}
