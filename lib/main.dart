import 'package:flutter/material.dart';
import 'package:poll_power/di.dart';
import './root.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupDependencies();

  runApp(const Root());
}
