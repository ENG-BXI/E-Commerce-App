import 'package:device_preview/device_preview.dart';
import 'package:e_commerce_app/cubit/ecommerce_app_cubit.dart';
import 'package:e_commerce_app/shared/dioHelper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './modules/AppPage.dart';

import './shared/theme.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Diohelper.init();
  runApp(DevicePreview(
      builder: (context) => const MyApp(), enabled: !kReleaseMode));
}

late EcommerceAppCubit myCubit;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme(),
      home: BlocProvider(
        create: (context) => EcommerceAppCubit(),
        child: AppPage(),
      ),
    );
  }
}
