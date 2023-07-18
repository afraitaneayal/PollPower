import 'package:isar/isar.dart';
part 'candidate_entity.g.dart';

@collection
class Candidate {
  Id userId = Isar.autoIncrement;
  String? fistName;
  String? lastName;
  String? grade;
  String? arreaOfStudy;
  bool? voted;
  bool? status;
  String? speetch;
  String? phoneNumber;
  int? voteCount;
}
