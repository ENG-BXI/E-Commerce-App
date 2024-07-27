// ignore_for_file: must_be_immutable, camel_case_types

import 'package:e_commerce_app/Cubit/cubit_Ecommerce/ecommerce_app_cubit.dart';
import 'package:e_commerce_app/Cubit/cubit_newProduct/new_product_cubit.dart';
import 'package:e_commerce_app/layouts/customBottomNavBar.dart';
import 'package:e_commerce_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'HomePage.dart';

class AppPage extends StatelessWidget {
  AppPage({super.key});
  List listViewText = [
    "Featured",
    "Collection",
    "Stores",
    "Tags",
  ];
  @override
  Widget build(BuildContext context) {
    myCubit = EcommerceAppCubit.get(context);
    myCubit.getCategory(lang: "ar");
    myCubit.getBannerImage();
    BlocProvider.of<NewProductCubit>(context).getAllProduct(lang: "en");
    return const Scaffold(
      bottomNavigationBar: customBottomNavBar(),
      body: HomePage(),
    );
  }
}
