import 'package:flutter/material.dart';
import 'package:poll_power/core/extensions/extension_on_strings.dart';
import 'package:poll_power/services/firebase/firebase_service.dart';

class CustomCandidateForm extends StatefulWidget {
  const CustomCandidateForm({super.key});

  @override
  State<CustomCandidateForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomCandidateForm> {
  final _formKey = GlobalKey<FormState>();

  String? firstNameValue;
  String? lastNameValue;
  String? gradeValue;
  String? areaOfStudyValue;
  String? speetch;
  int? voteCount;

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
            speetch = value;
          });
        },
      ),
      _buildElevateButton(context)
    ];
  }

  Widget _buildElevateButton(context) {
    return ElevatedButton(
        onPressed: () async {
          //TODO send candidate data to firebase

          Future.delayed(const Duration(seconds: 0), () async {
            final newCount = await FirebaseService().getUserCount();
            final data = {"users": newCount + 1};

            FirebaseService().addUser(data);
            switchToHome(context);
          });
        },
        child: "Register".getWidget());
  }

  void switchToHome(context) {
    Navigator.pushNamed(context, "/home");
  }
}
