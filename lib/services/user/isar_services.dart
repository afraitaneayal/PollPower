import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:poll_power/features/auth/candidate_entity.dart';
import 'package:poll_power/features/auth/user_entity.dart';

class IsarServices {
  late Future<Isar> db;

  IsarServices() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    final dir = (await getApplicationDocumentsDirectory()).path;
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open([UserSchema, CandidateSchema], directory: dir);
    }
    return await Future.value(Isar.getInstance());
  }

  Future<void> createUser(User user) async {
    final isar = await db;
    return await isar.writeTxn(() => isar.users.put(user));
  }

  Future<void> createCandidate(Candidate candidate) async {
    final isar = await db;
    return await isar.writeTxn(() => isar.candidates.put(candidate));
  }

  Future<User?> getUser() async {
    final isar = await db;
    return isar.users.where().findFirst();
  }

  Future<Candidate?> getCandidate() async {
    final isar = await db;
    return isar.candidates.where().findFirst();
  }
}
