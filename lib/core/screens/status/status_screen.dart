import 'package:flutter/material.dart';
import 'package:poll_power/core/extensions/extension_on_strings.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({super.key, required this.status});

  final bool status;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [_buildButtonText(context)],
          ),
        ),
        onWillPop: () async {
          return false;
        });
  }

  Widget _buildButtonText(context) {
    if (status) {
      return ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, "/registerVoter");
          },
          child: "Voter".getWidget());
    } else {
      return ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, "/registerCandidate");
          },
          child: "Candidate".getWidget());
    }
  }
}
