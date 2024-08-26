import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/Cubit/cubit_Ecommerce/ecommerce_app_cubit.dart';
import 'package:e_commerce_app/main.dart';
import 'package:e_commerce_app/models/productModel.dart';
import 'package:e_commerce_app/shared/constant.dart';
import 'package:e_commerce_app/shared/textStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Cubit/product_page_view/product_page_view_cubit.dart';

class Viewproductpage extends StatelessWidget {
  const Viewproductpage({super.key});
  @override
  Widget build(BuildContext context) {
    ProductModel model =
        ModalRoute.of(context)!.settings.arguments as ProductModel;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
      ),
      body: SingleChildScrollView(
        child: BlocProvider(
          create: (context) => ProductPageViewCubit(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxHeight: 300,
                    ),
                    child:
                        BlocBuilder<ProductPageViewCubit, ProductPageViewState>(
                      builder: (context, state) {
                        return Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 70.0),
                            child: CachedNetworkImage(
                                imageUrl: BlocProvider.of<ProductPageViewCubit>(
                                            context)
                                        .isSelectedImagePreview
                                    ? model.images[
                                        BlocProvider.of<ProductPageViewCubit>(
                                                context)
                                            .indexSelectedImagePreview]
                                    : model.image),
                          ),
                        );
                      },
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: SizedBox(
                      width: 90,
                      height: 300,
                      child: ListView.separated(
                        itemCount: model.images.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              BlocProvider.of<ProductPageViewCubit>(context)
                                  .changeImagePreviewProduct(index: index);
                            },
                            child: SizedBox(
                              height: 50,
                              // child: Image(image: NetworkImage(model.images[index])),
                              child: CachedNetworkImage(
                                imageUrl: model.images[index],
                                placeholder: (context, url) => const SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 10,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.name,
                      textAlign: TextAlign.start,
                      style: textStyle
                          .extrabold_32(context: context)
                          .copyWith(fontSize: 25),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 25,
                        ),
                        Text(
                          "4.7 Rating",
                          style:
                              textStyle.semibold_16(context: context).copyWith(
                                    color: const Color(0xffABADB3),
                                  ),
                        ),
                        const customDotAndSizedBoxRow(),
                        Text(
                          "2.7K Review",
                          style:
                              textStyle.semibold_16(context: context).copyWith(
                                    color: const Color(0xffABADB3),
                                  ),
                        ),
                        const customDotAndSizedBoxRow(),
                        Text(
                          "400 ",
                          style:
                              textStyle.semibold_16(context: context).copyWith(
                                    color: const Color(0xffABADB3),
                                  ),
                        ),
                        Text(
                          "Sales",
                          style:
                              textStyle.semibold_16(context: context).copyWith(
                                    color: const Color(0xffABADB3),
                                  ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    Text(
                      model.description,
                      textAlign: TextAlign.start,
                      style: textStyle.semibold_18(context: context),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: customBottomNavgatorProductView(model: model),
    );
  }
}

class customBottomNavgatorProductView extends StatelessWidget {
  const customBottomNavgatorProductView({
    super.key,
    required this.model,
  });

  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      //for Shadow
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.grey, offset: Offset(0, -1), blurRadius: 10)
      ]),

      child: Container(
        height: 100,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Salary",
                    style: textStyle.semibold_16(context: context).copyWith(
                          color: const Color(0xffABADB3),
                        ),
                  ),
                  Text(
                    "\$${model.price}",
                    style: textStyle
                        .extrabold_32(context: context)
                        .copyWith(color: const Color(0xff4BB198), fontSize: 23),
                  ),
                ],
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: ClipRRect(
                  borderRadius:
                      const BorderRadiusDirectional.all(Radius.circular(10)),
                  child: SizedBox(
                    height: 50,
                    child: Row(
                      children: [
                        Container(
                          width: 70,
                          color: const Color(0xff4BB198),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.shopping_bag_outlined,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                Text(
                                  "5",
                                  style: textStyle
                                      .semibold_18(context: context)
                                      .copyWith(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 120,
                          color: Colors.black,
                          child: Center(
                            child: Text(
                              "Buy Now",
                              style: textStyle
                                  .semibold_18(context: context)
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class customDotAndSizedBoxRow extends StatelessWidget {
  const customDotAndSizedBoxRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        SizedBox(
          width: 7,
        ),
        customDot(),
        SizedBox(
          width: 7,
        ),
      ],
    );
  }
}

class customDot extends StatelessWidget {
  const customDot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundColor: Color(0xffABADB3),
      maxRadius: 3,
    );
  }
}
