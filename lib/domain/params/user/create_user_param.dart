class CreateUserParam {
  final String email;
  final String areaOfStudy;
  final String grade;
  final String? image;
  final String lastName;
  final String firstName;
  final String password;

  CreateUserParam(this.email, this.areaOfStudy, this.grade, this.image,
      this.lastName, this.firstName, this.password);
}
