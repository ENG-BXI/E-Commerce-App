// ignore_for_file: camel_case_types, must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/Cubit/cubit_newProduct/new_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Cubit/cubit_Ecommerce/ecommerce_app_cubit.dart';
import '../main.dart';
import 'textStyle.dart';

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


class customListCategory extends StatelessWidget {
  const customListCategory({
    super.key,
  });


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
              image: NetworkImage(BlocProvider.of<NewProductCubit>(context).ListAllProduct[index].image),
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          BlocProvider.of<NewProductCubit>(context).ListAllProduct[index].name,
          style: textStyle.regular_16(context: context),
          maxLines: 1,
        ),
        const SizedBox(
          height: 2,
        ),
        Text(
          "Price : ${BlocProvider.of<NewProductCubit>(context).ListAllProduct[index].price.toString()}",
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
