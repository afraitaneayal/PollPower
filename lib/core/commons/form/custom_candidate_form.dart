import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:poll_power/core/extensions/extension_on_strings.dart';
import 'package:poll_power/core/screens/home/home_screen.dart';
import 'package:poll_power/features/auth/candidate_entity.dart';
import 'package:poll_power/features/auth/device_state.dart';
import 'package:poll_power/services/firebase/firebase_service.dart';
import '../../../services/user/isar_services.dart';
import 'package:uuid/uuid.dart';
import 'dart:math' as math;

class CustomCandidateForm extends StatefulWidget {
  const CustomCandidateForm(
      {super.key,
      required this.candidateData,
      required this.userCount,
      required this.deviceState});

  final Stream<List<QueryDocumentSnapshot<Map<String, dynamic>>>>?
      candidateData;
  final int userCount;
  final DeviceState? deviceState;

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
          await IsarServices().createDevice(DeviceState()..voted = false);
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
            "candidateID": candidateID,
            "cardColor": randomColors(),
          };

          FirebaseService().addUserCount();
          FirebaseService().createCandidate(candidateID, candidateData);

          final candidate = await isarService.getCandidate();
          final newCandidate = FirebaseService().getCandidates();
          final deviceState = await IsarServices().getDeviceState();

          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return HomeScreen(
                deviceState: deviceState,
                candidateData: newCandidate,
                userCount: widget.userCount,
                user: candidate);
          }));
        },
        child: "Login".getWidget());
  }

  int randomColors() {
    return math.Random().nextInt(1000000000) + 1000000000;
  }
}
