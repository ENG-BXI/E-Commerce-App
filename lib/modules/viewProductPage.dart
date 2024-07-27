import 'package:e_commerce_app/models/productModel.dart';
import 'package:e_commerce_app/shared/textStyle.dart';
import 'package:flutter/material.dart';

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
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: NetworkImage(model.image),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 64,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: FittedBox(
                    alignment: AlignmentDirectional.centerStart,
                    fit: BoxFit.scaleDown,
                    child: Text(model.name),
                  ),
                ),
                const Icon(
                  Icons.verified,
                  color: Colors.green,
                  size: 30,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 13,
          ),
          Text(
            "\$${model.price}",
            style: textStyle.semibold_16(context: context),
          ),
          const SizedBox(
            height: 13,
          ),
          SizedBox(
            height: 88,
            child: ListView.separated(
              itemCount: model.images.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 88,
                  child: Image(image: NetworkImage(model.images[index])),
                );
              },separatorBuilder: (context, index) {
                return const SizedBox(width: 10,);
              },
            ),
          )
        ],
      ),
    );
  }
}
