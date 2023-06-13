import 'package:flutter/material.dart';
import 'package:poll_power/core/extensions/extension_on_strings.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/registerCandidate');
                  },
                  child: "Candidate".getWidget()),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/registerVoter');
                  },
                  child: "Voter".getWidget())
            ],
          ),
        ),
        onWillPop: () async {
          return false;
        });
  }
}
