import 'package:flutter/material.dart';
import 'package:poll_power/core/extensions/extension_on_strings.dart';
import 'package:poll_power/features/auth/candidate_entity.dart';
import 'package:poll_power/services/firebase/firebase_service.dart';
import '../../../services/user/isar_services.dart';
import 'package:uuid/uuid.dart';

class CustomCandidateForm extends StatefulWidget {
  const CustomCandidateForm({super.key});

  @override
  State<CustomCandidateForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomCandidateForm> {
  final _formKey = GlobalKey<FormState>();
  final candidateID = const Uuid().v1();

  String? firstNameValue;
  String? lastNameValue;
  String? gradeValue;
  String? areaOfStudyValue;
  String? speetchValue;
  String? phoneNumberValue;
  int? voteCountValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Form(
            key: _formKey,
            child: Container(
              alignment: Alignment.center,
              child: Column(children: _buidFormField()),
            )),
      ),
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
        decoration: const InputDecoration(labelText: "Phone number"),
        obscureText: false,
        onChanged: (String value) {
          setState(() {
            phoneNumberValue = value;
          });
        },
      ),
      TextFormField(
        decoration: const InputDecoration(labelText: "Speetch"),
        obscureText: false,
        onChanged: (String value) {
          setState(() {
            speetchValue = value;
          });
        },
      ),
      _buildElevateButton(context)
    ];
  }

  Widget _buildElevateButton(context) {
    return ElevatedButton(
        onPressed: () async {
          final isarService = IsarServices();
          await isarService.createCandidate(Candidate()
            ..fistName = firstNameValue
            ..lastName = lastNameValue
            ..grade = gradeValue
            ..arreaOfStudy = areaOfStudyValue
            ..speetch = speetchValue
            ..phoneNumber = phoneNumberValue
            ..voteCount = voteCountValue
            ..status = true);

          Future.delayed(const Duration(seconds: 0), () async {
            final oldCount = await FirebaseService().getUserCount();
            final newCount = {"users": oldCount + 1};
            final candidate = {
              "firstName": firstNameValue,
              "lastName": lastNameValue,
              "grade": gradeValue,
              "areaOfStudy": areaOfStudyValue,
              "speetch": speetchValue,
              "phoneNumber": phoneNumberValue,
              "voteCount": voteCountValue
            };
            FirebaseService().addUserCount(newCount);
            FirebaseService().createCandidate(candidateID, candidate);

            switchToHome(context);
          });
        },
        child: "Register".getWidget());
  }

  void switchToHome(context) {
    Navigator.pushNamed(context, "/home");
  }
}
