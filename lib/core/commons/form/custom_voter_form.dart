import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:poll_power/core/extensions/extension_on_strings.dart';
import 'package:poll_power/features/auth/device_state.dart';
import 'package:poll_power/services/firebase/firebase_service.dart';
import '../../../features/auth/user_entity.dart';
import '../../../services/user/isar_services.dart';
import '../../screens/home/home_screen.dart';

class CustomVoterForm extends StatefulWidget {
  const CustomVoterForm(
      {super.key,
      required this.deviceState,
      required this.candidateData,
      required this.userCount});

  final Stream<List<QueryDocumentSnapshot<Map<String, dynamic>>>>?
      candidateData;
  final int userCount;
  final DeviceState? deviceState;

  @override
  State<CustomVoterForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomVoterForm> {
  final _formKey = GlobalKey<FormState>();

  late String firstNameValue;
  late String lastNameValue;
  late String gradeValue;
  late String areaOfStudyValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(children: _buidFormField()),
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
      _buildElevateButton(context)
    ];
  }

  Widget _buildElevateButton(context) {
    return ElevatedButton(
        onPressed: () async {
          final isarService = IsarServices();
          await isarService.createDevice(DeviceState()..voted = false);
          await isarService.createUser(User()
            ..fistName = firstNameValue
            ..lastName = lastNameValue
            ..grade = gradeValue
            ..arreaOfStudy = areaOfStudyValue
            ..voted = false
            ..status = true);

          final user = await isarService.getUser();

          FirebaseService().addUserCount();
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return HomeScreen(
                deviceState: widget.deviceState,
                candidateData: widget.candidateData,
                userCount: widget.userCount,
                user: user);
          }));
        },
        child: "Register".getWidget());
  }
}
