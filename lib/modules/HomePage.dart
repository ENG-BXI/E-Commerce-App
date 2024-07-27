// ignore_for_file: camel_case_types

import 'package:e_commerce_app/Cubit/cubit_newProduct/new_product_cubit.dart';
import 'package:e_commerce_app/models/NavigatorTItleAndLIstProductModel.dart';
import 'package:e_commerce_app/modules/viewAllProductPage.dart';
import 'package:e_commerce_app/shared/Routes.dart';
import 'package:e_commerce_app/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../layouts/HomePageLayout/customBuildSectionALLProductItem.dart';
import '../layouts/HomePageLayout/customBuildSectionNewProductItem.dart';
import '../shared/components.dart';
import '../shared/textStyle.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Text("Market", style: textStyle.extrabold_32(context: context)),
            const SizedBox(height: 40),
            Row(
              children: [
                customTextFormField(hintText: "Search on Tassel"),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: const Color(0xffF3F3F3), width: 3)),
                    child: const Center(
                      child: Text("W",
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight: FontWeight.w800)),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 19),
            // customListCategory(listViewText: listViewText),
            // const SizedBox(height: 24),
            const customBannerSlider(),
            const SizedBox(height: 24),
            const customBuildSectionNewProductItem(),
            const SizedBox(
              height: 24,
            ),
            const customBuildSectionALLProductItem(),
          ],
        ),
      ),
    );
  }
}
