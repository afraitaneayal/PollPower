import 'package:flutter/material.dart';
import 'package:poll_power/core/commons/form/custom_voter_form.dart';

class RegisterVoterScreen extends StatelessWidget {
  const RegisterVoterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomForm(),
    );
  }
}
