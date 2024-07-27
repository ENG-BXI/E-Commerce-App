import 'package:device_preview/device_preview.dart';
import 'package:e_commerce_app/Cubit/cubit_Ecommerce/ecommerce_app_cubit.dart';
import 'package:e_commerce_app/shared/dioHelper.dart';
import 'package:flutter/foundation.dart';


import './shared/theme.dart';
import 'package:flutter/material.dart';

import 'shared/Routes.dart';

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
      initialRoute: Routes_StringPath.appPage,
      routes: routes, 
      debugShowCheckedModeBanner: false,
      theme: lightTheme(),
    );
  }
}

/*
 MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => EcommerceAppCubit(),
          ),
          BlocProvider(
            create: (context) => NewProductCubit(),
          ),
        ],
        child: AppPage(),
      ),
*/