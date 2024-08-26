// ignore_for_file: camel_case_types

import 'package:e_commerce_app/shared/constant.dart';
import 'package:flutter/material.dart';

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
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 70),
          // Text("Market", style: textStyle.extrabold_32(context: context)),
          // const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kPadding),
            child: Row(
              children: [
                Expanded(
                    child: customTextFormField(hintText: "Search on Sala")),
                const SizedBox(width: 10),
                GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.notifications_active_outlined,
                      size: 35,
                    ))
              ],
            ),
          ),
          const SizedBox(height: 30),
          // customListCategory(listViewText: listViewText),
          // const SizedBox(height: 24),
          const customBannerSlider(),
          const SizedBox(height: 24),
          const Padding(
            
            padding: EdgeInsets.symmetric(horizontal: kPadding),
            child: Column(
              children: [
                customBuildSectionNewProductItem(),
                SizedBox(
                  height: 24,
                ),
                customBuildSectionALLProductItem(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
