class VoterFirstFormData {
  final String firstName;
  final String lastName;
  final String areaOfStudy;
  final String grade;
  VoterFirstFormData(
      this.firstName, this.lastName, this.areaOfStudy, this.grade);
}

class VoterSecondFormData {
  final String image;
  VoterSecondFormData(this.image);
}

class VoteFormDatas {
  final VoterFirstFormData? voterFirstFormData;
  final VoterSecondFormData? voterSecondFormData;

  VoteFormDatas({this.voterFirstFormData, this.voterSecondFormData});
}
