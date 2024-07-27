import 'package:e_commerce_app/Cubit/cubit_newProduct/new_product_cubit.dart';
import 'package:e_commerce_app/models/NavigatorTItleAndLIstProductModel.dart';
import 'package:e_commerce_app/shared/Routes.dart';
import 'package:e_commerce_app/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/componets.dart';
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
            //New Product title
            BlocBuilder<NewProductCubit, NewProductState>(
              builder: (context, state) {
                if (BlocProvider.of<NewProductCubit>(context)
                    .ListNewProduct
                    .isNotEmpty) {
                  return subtitleAndIconBack(
                    title: "New Product",
                    fun: () {
                      Navigator.pushNamed(
                          context, Routes_StringPath.viewproductpage,
                          arguments: NavigatorTitleAndListProductModel(
                              title: "New Product",
                              listProduct:
                                  BlocProvider.of<NewProductCubit>(context)
                                      .ListNewProduct));
                    },
                  );
                } else if (state is getProductLoadingState) {
                  return const LinearProgressIndicator();
                } else {
                  return const Text("error");
                }
              },
            ),
            const SizedBox(height: 8),
            //new product list view
            SizedBox(
              height: 128 + 12 + 52 + 20,
              child: BlocBuilder<NewProductCubit, NewProductState>(
                builder: (context, state) {
                  if (BlocProvider.of<NewProductCubit>(context)
                      .ListNewProduct
                      .isNotEmpty) {
                    return ListView.separated(
                      itemCount: BlocProvider.of<NewProductCubit>(context)
                          .ListNewProduct
                          .length,
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
                                      image: NetworkImage(
                                          BlocProvider.of<NewProductCubit>(
                                                  context)
                                              .ListNewProduct[index]
                                              .image)),
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Text(
                                BlocProvider.of<NewProductCubit>(context)
                                    .ListNewProduct[index]
                                    .name,
                                style: textStyle.regular_16(context: context),
                                maxLines: 1,
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                "Price : ${BlocProvider.of<NewProductCubit>(context).ListNewProduct[index].price.toString()}",
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
            //All Product title
            BlocBuilder<NewProductCubit, NewProductState>(
              builder: (context, state) {
                if (BlocProvider.of<NewProductCubit>(context)
                    .ListAllProduct
                    .isNotEmpty) {
                  return subtitleAndIconBack(
                    title: "All Products",
                    fun: () {
                      Navigator.pushNamed(
                          context, Routes_StringPath.viewproductpage,
                          arguments: NavigatorTitleAndListProductModel(
                              title: "All Products",
                              listProduct:
                                  BlocProvider.of<NewProductCubit>(context)
                                      .ListAllProduct));
                    },
                  );
                } else if (state is getProductLoadingState) {
                  return const LinearProgressIndicator();
                } else {
                  return const Text("error");
                }
              },
            ),
            //All product list view
            SizedBox(
              height: 128 + 12 + 52 + /* this 20 is increment for heigh ok*/ 20,
              child: BlocBuilder<NewProductCubit, NewProductState>(
                builder: (context, state) {
                  if (BlocProvider.of<NewProductCubit>(context)
                      .ListAllProduct
                      .isNotEmpty) {
                    return ListView.separated(
                      itemCount: BlocProvider.of<NewProductCubit>(context)
                          .ListAllProduct
                          .length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 215,
                          child: customItemProductHomePage(
                            index: index,
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
          ],
        ),
      ),
    );
  }
}
