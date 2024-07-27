import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Cubit/cubit_newProduct/new_product_cubit.dart';
import '../../models/NavigatorTItleAndLIstProductModel.dart';
import '../../modules/viewAllProductPage.dart';
import '../../shared/Routes.dart';
import '../../shared/components.dart';

class customBuildSectionALLProductItem extends StatelessWidget {
  const customBuildSectionALLProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                      context, Routes_StringPath.viewALLProductPage,
                      arguments: NavigatorTitleAndListProductModel(
                          title: "All Products",
                          listProduct: BlocProvider.of<NewProductCubit>(context)
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
                      child: customItemViewProduct(
                        model: BlocProvider.of<NewProductCubit>(context)
                            .ListAllProduct[index],
                        height: 128,
                        maxLines: 1,
                        isPadding: false,
                      ),
                      // child: customItemProductHomePage(
                      //   index: index,
                      // ),
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
