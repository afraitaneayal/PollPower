import 'package:flutter/material.dart';
import 'package:poll_power/core/extensions/extension_on_strings.dart';

import '../../../services/firebase/firebase_service.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({super.key});

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

var startStatus = false;

class _StatusScreenState extends State<StatusScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [_buildButtonText()],
          ),
        ),
        onWillPop: () async {
          Future.delayed(const Duration(microseconds: 0), () async {
            setState(() async {
              startStatus = await FirebaseService().getStartStatus();
            });
          });
          return false;
        });
  }

  Widget _buildButtonText() {
    if (startStatus) {
      return ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, "/registerCandidate");
          },
          child: "Candidate".getWidget());
    } else {
      return ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, "/registerVoter");
          },
          child: "Voter".getWidget());
    }
  }
}
