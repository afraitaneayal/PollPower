import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:poll_power/features/auth/user_entity.dart';

class IsarServices {
  late Future<Isar> db;

  IsarServices() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    final dir = (await getApplicationDocumentsDirectory()).path;
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open([UserSchema], directory: dir);
    }
    return await Future.value(Isar.getInstance());
  }

  Future<void> createUser(User user) async {
    final isar = await db;
    return await isar.writeTxn(() => isar.users.put(user));
  }

  Future<User?> getUserStatus() async {
    final isar = await db;
    return isar.users.where().findFirst();
  }
}
