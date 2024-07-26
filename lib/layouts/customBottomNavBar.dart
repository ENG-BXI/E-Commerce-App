// ignore_for_file: must_be_immutable, camel_case_types

import 'package:e_commerce_app/shared/constant.dart';
import 'package:e_commerce_app/shared/imagePath.dart';
import 'package:e_commerce_app/shared/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class customBottomNavBar extends StatelessWidget {
  const customBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            itemBottomNav(imagePath: Assets.imagesHomeIconNav, title: "Feed"),
            itemBottomNav(
                imagePath: Assets.imagesMarketIconNav,
                title: "Market",
                isActive: true),
            itemBottomNav(
                imagePath: Assets.imagesProfileIconNav, title: "Profile"),
          ],
        ),
      ),
    );
  }
}

class itemBottomNav extends StatelessWidget {
  itemBottomNav(
      {super.key,
      required this.imagePath,
      required this.title,
      this.isActive = false});
  String imagePath, title;
  bool isActive;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            imagePath,
            height: 30,
            color: isActive ? myColor.activeColor : Colors.grey,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: textStyle
                .reqular_12(context: context)
                .copyWith(color: isActive ? myColor.activeColor : null),
          )
        ],
      ),
    );
  }
}
