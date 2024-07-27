import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Cubit/cubit_newProduct/new_product_cubit.dart';
import '../../models/NavigatorTItleAndLIstProductModel.dart';
import '../../modules/viewAllProductPage.dart';
import '../../shared/Routes.dart';
import '../../shared/components.dart';



class customBuildSectionNewProductItem extends StatelessWidget {
  const customBuildSectionNewProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                      context, Routes_StringPath.viewALLProductPage,
                      arguments: NavigatorTitleAndListProductModel(
                          title: "New Product",
                          listProduct: BlocProvider.of<NewProductCubit>(context)
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
                      child: customItemViewProduct(
                        model: BlocProvider.of<NewProductCubit>(context)
                            .ListNewProduct[index],
                        height: 128,
                        width:215,
                        maxLines: 1,
                        isPadding: false,
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
    );
  }
}
