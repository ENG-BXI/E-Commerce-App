// ignore_for_file: must_be_immutable, camel_case_types

import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/cubit/ecommerce_app_cubit.dart';
import 'package:e_commerce_app/layouts/customBottomNavBar.dart';
import 'package:e_commerce_app/main.dart';
import 'package:e_commerce_app/shared/imagePath.dart';
import 'package:e_commerce_app/shared/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    myCubit.getAllProduct(lang: "en");
    return Scaffold(
      bottomNavigationBar: const customBottomNavBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
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
              subtitleAndIconBack(
                title: "New Product",
                fun: () {},
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 128 + 12 + 52 + 20,
                child: BlocBuilder<EcommerceAppCubit, EcommerceAppState>(
                  builder: (context, state) {
                    if (myCubit.ListNewProduct.isNotEmpty) {
                      return ListView.separated(
                        itemCount: myCubit.ListNewProduct.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            width: 215,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AspectRatio(
                                  aspectRatio: 215 / 120,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image(
                                        image: NetworkImage(myCubit
                                            .ListNewProduct[index].image)),
                                  ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  myCubit.ListNewProduct[index].name,
                                  style: textStyle.regular_16(context: context),
                                  maxLines: 1,
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  "Price : ${myCubit.ListNewProduct[index].price.toString()}",
                                  style: textStyle
                                      .regular_16(context: context)
                                      .copyWith(color: const Color(0xff6D6D6F)),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            width: 8,
                          );
                        },
                      );
                    } else if (state is getProductLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return const Text("error");
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              subtitleAndIconBack(
                title: "All Products",
                fun: () {},
              ),
              SizedBox(
                height: 128 + 12 + 52 + 20,
                child: BlocBuilder<EcommerceAppCubit, EcommerceAppState>(
                  builder: (context, state) {
                    if (myCubit.ListAllProduct.isNotEmpty) {
                      return ListView.separated(
                        itemCount: myCubit.ListAllProduct.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            width: 215,
                            child: customItemProductHomePage(index: index,),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            width: 8,
                          );
                        },
                      );
                    } else if (state is getProductLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return const Text("error");
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class customItemProductHomePage extends StatelessWidget {
  customItemProductHomePage({super.key, required this.index});
  int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 215 / 130,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image(
              image: NetworkImage(myCubit.ListAllProduct[index].image),
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          myCubit.ListAllProduct[index].name,
          style: textStyle.regular_16(context: context),
          maxLines: 1,
        ),
        const SizedBox(
          height: 2,
        ),
        Text(
          "Price : ${myCubit.ListAllProduct[index].price.toString()}",
          style: textStyle
              .regular_16(context: context)
              .copyWith(color: const Color(0xff6D6D6F)),
        ),
      ],
    );
  }
}

class customBannerSlider extends StatelessWidget {
  const customBannerSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 310 / 170,
      child: BlocBuilder<EcommerceAppCubit, EcommerceAppState>(
        builder: (context, state) {
          if (myCubit.banners.isNotEmpty) {
            return CarouselSlider(
              items: myCubit.banners.map((element) {
                return AspectRatio(
                  aspectRatio: 310 / 170,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image(
                      image: NetworkImage(element),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                autoPlay: true,
                viewportFraction: 1,
              ),
            );
          } else if (state is getBannersErrorState) {
            return const Text("Error");
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class customListCategory extends StatelessWidget {
  const customListCategory({
    super.key,
    required this.listViewText,
  });

  final List listViewText;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EcommerceAppCubit, EcommerceAppState>(
      builder: (context, state) {
        if (state is getCategotyLoadingState) {
          return const LinearProgressIndicator();
        } else if (myCubit.category.isNotEmpty) {
          return SizedBox(
            height: 42,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: myCubit.category.length,
              itemBuilder: (context, index) {
                return TextButton(
                    style: const ButtonStyle(
                      elevation: WidgetStatePropertyAll(3),
                      // backgroundColor: WidgetStatePropertyAll(Colors.grey)
                    ),
                    onPressed: () {},
                    child: Text(
                      myCubit.category[index],
                      style: textStyle.semibold_16(context: context),
                    ));
              },
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

class subtitleAndIconBack extends StatelessWidget {
  subtitleAndIconBack({super.key, required this.title, required this.fun});
  String title;
  VoidCallback fun;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Row(
        children: [
          Expanded(
              child: Text(
            title,
            style: textStyle.semibold_18(context: context),
          )),
          Transform.rotate(
              angle: -3.15,
              child: IconButton(
                  color: Colors.black,
                  onPressed: fun,
                  icon: const Icon(Icons.arrow_back_sharp)))
        ],
      ),
    );
  }
}

class customTextFormField extends StatelessWidget {
  customTextFormField({super.key, this.hintText = ""});
  String hintText;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SizedBox(
      height: 48,
      child: TextFormField(
        decoration: InputDecoration(
            suffixIcon: const Icon(
              Icons.search,
              size: 30,
              color: Color(0xff868687),
            ),
            border: customBorderTextFormFeild(),
            enabledBorder: customBorderTextFormFeild(),
            filled: true,
            fillColor: const Color(0xffF3F3F3),
            focusedBorder: customBorderTextFormFeild(),
            contentPadding: const EdgeInsetsDirectional.only(start: 16),
            hintText: hintText,
            hintStyle: const TextStyle(
                fontSize: 20,
                color: Color(0xff6E6E70),
                fontWeight: FontWeight.w500)),
      ),
    ));
  }

  OutlineInputBorder customBorderTextFormFeild() => OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xffF3F3F3)));
}
