class CreateVoteParam {
  final String candidateUuid;
  final String userUiid;
  DateTime votedAt = DateTime.now();

  CreateVoteParam(this.candidateUuid, this.userUiid);
}
