import 'package:flutter/material.dart';
import 'package:poll_power/core/extensions/extension_on_strings.dart';
import '../../../features/auth/user_entity.dart';
import '../../../services/user/isar_services.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({super.key});

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final _formKey = GlobalKey<FormState>();

  String? firstNameValue;
  String? lastNameValue;
  String? gradeValue;
  String? areaOfStudyValue;
  String? passwordValue;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: _buidFormField()),
    );
  }

  List<Widget> _buidFormField() {
    return [
      TextFormField(
        decoration: const InputDecoration(labelText: "First Name"),
        onChanged: (String value) {
          setState(() {
            firstNameValue = value;
          });
        },
      ),
      TextFormField(
        decoration: const InputDecoration(labelText: "Last Name"),
        onChanged: (String value) {
          setState(() {
            lastNameValue = value;
          });
        },
      ),
      TextFormField(
        decoration: const InputDecoration(labelText: "Grade"),
        onChanged: (String value) {
          setState(() {
            gradeValue = value;
          });
        },
      ),
      TextFormField(
        decoration: const InputDecoration(labelText: "Area of Study"),
        onChanged: (String value) {
          setState(() {
            areaOfStudyValue = value;
          });
        },
      ),
      TextFormField(
        decoration: const InputDecoration(labelText: "Password"),
        obscureText: true,
        onChanged: (String value) {
          setState(() {
            passwordValue = value;
          });
        },
      ),
      _buildElevateButton()
    ];
  }

  Widget _buildElevateButton() {
    return ElevatedButton(
        onPressed: () async {
          final isarService = IsarServices();
          await isarService.createUser(User()
            ..fistName = firstNameValue
            ..lastName = lastNameValue
            ..grade = gradeValue
            ..arreaOfStudy = areaOfStudyValue
            ..password = passwordValue
            ..status = true);

          Future.delayed(const Duration(seconds: 2), () {
            Navigator.pushNamed(context, "/login");
          });
        },
        child: "Register".getWidget());
  }
}
