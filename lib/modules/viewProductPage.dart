import 'package:e_commerce_app/models/NavigatorTItleAndLIstProductModel.dart';
import 'package:e_commerce_app/models/productModel.dart';
import 'package:e_commerce_app/shared/constant.dart';
import 'package:e_commerce_app/shared/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Viewproductpage extends StatelessWidget {
  const Viewproductpage({super.key});

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
  const customItemViewProduct({
    super.key,
    required this.model,
  });

  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kPadding * 0.8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image(
                image: NetworkImage(model.image),
                fit: BoxFit.contain,
              )),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.name,
                  style: textStyle.regular_16(context: context),
                ),
                const SizedBox(
                  height: 5,
                ),
                FittedBox(
                  child: Row(
                    children: [
                      Text(
                        "\$${model.price.toString()} \t\t",
                        style: textStyle.regular_16(context: context).copyWith(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                      model.price != model.oldPrice
                          ? Text(
                              "\$${model.oldPrice.toString()}",
                              style: textStyle
                                  .regular_16(context: context)
                                  .copyWith(
                                      color: const Color(0xff6E6E70),
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.lineThrough),
                            )
                          : const SizedBox()
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/*


*/