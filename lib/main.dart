import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:poll_power/di.dart';
import './root.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupDependencies();

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const Root(), // Wrap your app
    ),
  );
}
