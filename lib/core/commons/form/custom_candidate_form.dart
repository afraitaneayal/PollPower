import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:poll_power/core/extensions/extension_on_screen_size.dart';
import 'package:poll_power/core/extensions/extension_on_strings.dart';
import 'package:poll_power/core/screens/home/home_screen.dart';
import 'package:poll_power/features/auth/candidate_entity.dart';
import 'package:poll_power/features/auth/device_state.dart';
import 'package:poll_power/services/firebase/firebase_service.dart';
import '../../../services/user/isar_services.dart';
import 'package:uuid/uuid.dart';
import 'dart:math' as math;

import '../../app_colors/app_colors.dart';

class CustomCandidateForm extends StatefulWidget {
  const CustomCandidateForm(
      {super.key,
      required this.candidateData,
      required this.userCount,
      required this.deviceState});

  final Stream<List<QueryDocumentSnapshot<Map<String, dynamic>>>> candidateData;
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
              margin: EdgeInsets.symmetric(
                  horizontal: context.getScreenWidth() * 10 / 100),
              width: context.getScreenWidth() * 90 / 100,
              alignment: Alignment.center,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buidFormField()),
            )),
      ),
    );
  }

  List<Widget> _buidFormField() {
    return [
      _buildTitle(),
      SizedBox(height: context.getScreenHeight() * 5 / 100),
      TextFormField(
        decoration: const InputDecoration(
            labelText: "First Name",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))),
        onChanged: (String value) {
          setState(() {
            firstNameValue = value;
          });
        },
      ),
      SizedBox(height: context.getScreenHeight() * 2 / 100),
      TextFormField(
        decoration: const InputDecoration(
            labelText: "Last Name",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))),
        onChanged: (String value) {
          setState(() {
            lastNameValue = value;
          });
        },
      ),
      SizedBox(height: context.getScreenHeight() * 2 / 100),
      TextFormField(
        decoration: const InputDecoration(
            labelText: "Grade",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))),
        onChanged: (String value) {
          setState(() {
            gradeValue = value;
          });
        },
      ),
      SizedBox(height: context.getScreenHeight() * 2 / 100),
      TextFormField(
        decoration: const InputDecoration(
            labelText: "Area of Study",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))),
        onChanged: (String value) {
          setState(() {
            areaOfStudyValue = value;
          });
        },
      ),
      SizedBox(height: context.getScreenHeight() * 2 / 100),
      TextFormField(
        decoration: const InputDecoration(
            labelText: "Phone number",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))),
        obscureText: false,
        onChanged: (String value) {
          setState(() {
            phoneNumberValue = value;
          });
        },
      ),
      SizedBox(height: context.getScreenHeight() * 2 / 100),
      TextFormField(
        decoration: const InputDecoration(
            labelText: "Speetch",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))),
        obscureText: false,
        onChanged: (String value) {
          setState(() {
            speetchValue = value;
          });
        },
      ),
      SizedBox(
        height: context.getScreenHeight() * 5 / 100,
      ),
      _buildElevateButton(context)
    ];
  }

  Widget _buildElevateButton(context) {
    return ElevatedButton(
        style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(const Size(310, 70)),
            backgroundColor: MaterialStateProperty.all(AppColors.black),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.0)))),
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
        child: "Login".getWidget(
            fontColor: AppColors.white,
            fontSize: 30,
            fontWeight: FontWeight.w600));
  }

  int randomColors() {
    return math.Random().nextInt(1000000000) + 1000000000;
  }

  Widget _buildTitle() {
    return Container(
      alignment: Alignment.topLeft,
      child: "Candidate".getWidget(
          fontColor: AppColors.black,
          fontSize: 44,
          fontWeight: FontWeight.w600),
    );
  }
}
