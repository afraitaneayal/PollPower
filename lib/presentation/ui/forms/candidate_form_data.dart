class CandidateFirstFormData {
  final String firstName;
  final String lastName;
  final String areaOfStudy;
  final String grade;
  CandidateFirstFormData(
      this.firstName, this.lastName, this.areaOfStudy, this.grade);
}

class CandidateSecondFormData {
  final String slogan;
  final String? speetch;
  final String? image;
  CandidateSecondFormData(this.slogan, this.speetch, this.image);
}

class CandidateFormDatas {
  final CandidateFirstFormData? firstFormData;
  final CandidateSecondFormData? secondFormData;

  CandidateFormDatas(
      {required this.firstFormData, required this.secondFormData});
}
