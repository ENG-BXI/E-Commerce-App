// ignore_for_file: camel_case_types, must_be_immutable

import 'package:e_commerce_app/models/NavigatorTItleAndLIstProductModel.dart';
import 'package:e_commerce_app/models/productModel.dart';
import 'package:e_commerce_app/shared/Routes.dart';
import 'package:e_commerce_app/shared/constant.dart';
import 'package:e_commerce_app/shared/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ViewALLProductPage extends StatelessWidget {
  const ViewALLProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    NavigatorTitleAndListProductModel titleAndList = ModalRoute.of(context)!
        .settings
        .arguments as NavigatorTitleAndListProductModel;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(titleAndList.title),
        centerTitle: true,
      ),
      body: MasonryGridView.builder(
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        itemBuilder: (context, index) {
          return customItemViewProduct(model: titleAndList.listProduct[index]);
        },
        itemCount: titleAndList.listProduct.length,
      ),
    );
  }
}

class customItemViewProduct extends StatelessWidget {
  customItemViewProduct({
    super.key,
    required this.model,
    this.height,
    this.width,
    this.maxLines,
    this.isPadding = true,
  });

  final ProductModel model;
  double? height;
  double? width;
  int? maxLines;
  bool isPadding;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes_StringPath.viewProductPage,
            arguments: model);
      },
      child: Padding(
        padding: EdgeInsets.all(isPadding ? kPadding * 0.8 : 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image(
                  image: NetworkImage(model.image),
                  fit: BoxFit.contain,
                  height: height,
                  width: width,
                )),
            const SizedBox(
              height: 5,
            ),
            Container(
              color: Colors.white,
              width: width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.name,
                      style: textStyle.regular_16(context: context),
                      maxLines: maxLines,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Row(
                        children: [
                          Text(
                            "\$${model.price.toString()} \t\t",
                            style: textStyle
                                .regular_16(context: context)
                                .copyWith(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                          ),
                          model.price != model.oldPrice
                              ? Text(
                                  "\$${model.oldPrice.toString()}",
                                  style: textStyle
                                      .regular_16(context: context)
                                      .copyWith(
                                          color: const Color(0xff6E6E70),
                                          fontWeight: FontWeight.bold,
                                          decoration:
                                              TextDecoration.lineThrough),
                                )
                              : const SizedBox()
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
