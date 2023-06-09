import 'package:flutter/material.dart';
import 'package:poll_power/core/extensions/extension_on_strings.dart';
import 'package:poll_power/features/auth/user_entity.dart';
import 'package:poll_power/services/user/isar_services.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextButton(
              onPressed: () {
                final isarService = IsarServices();
                isarService.createUser(User()..fistName = "Yaya Hc");
              },
              child: "Register".getWidget())
        ],
      ),
    );
  }
}
