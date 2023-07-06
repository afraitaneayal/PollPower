import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:poll_power/core/app_colors/app_colors.dart';
import 'package:poll_power/core/extensions/extension_on_screen_size.dart';
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

  final Stream<List<QueryDocumentSnapshot<Map<String, dynamic>>>> candidateData;
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
      backgroundColor: AppColors.background,
      body: Form(
          key: _formKey,
          child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: context.getScreenWidth() * 10 / 100),
            width: context.getScreenWidth() * 90 / 100,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buidFormField()),
          )),
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
        await isarService.createDevice(DeviceState()..voted = false);
        await isarService.createUser(User()
          ..fistName = firstNameValue
          ..lastName = lastNameValue
          ..grade = gradeValue
          ..arreaOfStudy = areaOfStudyValue
          ..voted = false
          ..status = true);

        final user = await isarService.getUser();
        final deviceState = await IsarServices().getDeviceState();

        FirebaseService().addUserCount();
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return HomeScreen(
              deviceState: deviceState,
              candidateData: widget.candidateData,
              userCount: widget.userCount,
              user: user);
        }));
      },
      child: "Register".getWidget(
          fontColor: AppColors.white,
          fontSize: 30,
          fontWeight: FontWeight.w600),
    );
  }

  Widget _buildTitle() {
    return Container(
      alignment: Alignment.topLeft,
      child: "Voter".getWidget(
          fontColor: AppColors.black,
          fontSize: 44,
          fontWeight: FontWeight.w600),
    );
  }
}
