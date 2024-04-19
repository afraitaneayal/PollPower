import '../../entities/user/user.dart';

class CreateCandidateParam {
  final String slogan;
  final String? speech;
  final UserEntity user;
  final int voteCount;

  CreateCandidateParam(this.slogan, this.speech, this.user, this.voteCount);
}
