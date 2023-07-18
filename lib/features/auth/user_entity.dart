import 'package:isar/isar.dart';
part 'user_entity.g.dart';

@collection
class User {
  Id userId = Isar.autoIncrement;
  String? fistName;
  String? lastName;
  String? grade;
  String? arreaOfStudy;
  bool? voted;
  bool? status;
}
