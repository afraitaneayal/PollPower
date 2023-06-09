import 'package:flutter/material.dart';
import 'package:poll_power/core/commons/form/custom_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomForm(),
    );
  }
}
