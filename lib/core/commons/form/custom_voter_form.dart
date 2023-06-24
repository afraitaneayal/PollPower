import 'package:flutter/material.dart';
import 'package:poll_power/core/extensions/extension_on_strings.dart';
import 'package:poll_power/services/firebase/firebase_service.dart';
import '../../../features/auth/user_entity.dart';
import '../../../services/user/isar_services.dart';

class CustomVoterForm extends StatefulWidget {
  const CustomVoterForm({super.key});

  @override
  State<CustomVoterForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomVoterForm> {
  final _formKey = GlobalKey<FormState>();

  String? firstNameValue;
  String? lastNameValue;
  String? gradeValue;
  String? areaOfStudyValue;

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
      _buildElevateButton(context)
    ];
  }

  Widget _buildElevateButton(context) {
    return ElevatedButton(
        onPressed: () async {
          final isarService = IsarServices();
          await isarService.createUser(User()
            ..fistName = firstNameValue
            ..lastName = lastNameValue
            ..grade = gradeValue
            ..arreaOfStudy = areaOfStudyValue
            ..status = true);

          Future.delayed(const Duration(seconds: 0), () async {
            final oldCount = await FirebaseService().getUserCount();
            final newCount = {"users": oldCount + 1};
            FirebaseService().addUserCount(newCount);
            switchToHome(context);
          });
        },
        child: "Register".getWidget());
  }

  void switchToHome(context) {
    Navigator.pushNamed(context, "/home");
  }
}
