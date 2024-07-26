import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';

import './modules/AppPage.dart';

import './shared/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DevicePreview(
      builder: (context) => const MyApp(), enabled: !kReleaseMode));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme(),
      home: AppPage(),
    );
  }
}
