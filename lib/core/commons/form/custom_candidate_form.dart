import 'package:flutter/material.dart';
import 'package:poll_power/core/extensions/extension_on_strings.dart';
import 'package:poll_power/core/screens/home/home_screen.dart';
import 'package:poll_power/features/auth/candidate_entity.dart';
import 'package:poll_power/services/firebase/firebase_service.dart';
import '../../../services/user/isar_services.dart';
import 'package:uuid/uuid.dart';

class CustomCandidateForm extends StatefulWidget {
  const CustomCandidateForm(
      {super.key, required this.candidateData, required this.userCount});

  final List<dynamic> candidateData;
  final int userCount;

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
            ..voteCount = 0
            ..voted = false
            ..status = true);

          final candidateData = {
            "firstName": firstNameValue,
            "lastName": lastNameValue,
            "grade": gradeValue,
            "areaOfStudy": areaOfStudyValue,
            "speetch": speetchValue,
            "phoneNumber": phoneNumberValue,
            "voteCount": 0,
            "candidateID": candidateID
          };

          FirebaseService().addUserCount();
          FirebaseService().createCandidate(candidateID, candidateData);

          final candidate = await isarService.getCandidate();
          final newCandidate = await FirebaseService().getCandidates();

          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return HomeScreen(
                candidateData: newCandidate,
                userCount: widget.userCount,
                user: candidate);
          }));
        },
        child: "Login".getWidget());
  }
}
