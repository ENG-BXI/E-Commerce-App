
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Cubit/cubit_Ecommerce/ecommerce_app_cubit.dart';
import '../Cubit/cubit_newProduct/new_product_cubit.dart';
import '../modules/AppPage.dart';
import '../modules/HomePage.dart';
import '../modules/viewProductPage.dart';

Map<String, WidgetBuilder> routes = {
  Routes_StringPath.appPage: (context) => MultiBlocProvider(
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
  Routes_StringPath.homePage: (context) => HomePage(),
  Routes_StringPath.viewproductpage: (context) => Viewproductpage(),
};

class Routes_StringPath {
  static const appPage = "appPage";
  static const homePage = "homePage";
  static const viewproductpage = "viewproductpage";
}
