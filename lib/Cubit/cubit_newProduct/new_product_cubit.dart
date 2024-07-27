// ignore_for_file: non_constant_identifier_names

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../models/productModel.dart';
import '../../shared/dioHelper.dart';

part 'new_product_state.dart';

class NewProductCubit extends Cubit<NewProductState> {
  NewProductCubit() : super(NewProductInitial());
  List<ProductModel> ListAllProduct = [];
  List<ProductModel> ListNewProduct = [];
  getAllProduct({required String lang}) async {
    ListAllProduct = [];
    ListNewProduct = [];
    emit(getProductLoadingState());

    try {
      Response response = await Diohelper.getData(path: "home", lang: lang);
      response.data["data"]["products"].forEach((element) {
        ListAllProduct.add(ProductModel.fromJson(element));
      });
      await getNewProduct(ListAllProduct);
      emit(getProductLoadedState());
    } catch (e) {
      print("error =====${e.toString()}");
      emit(getProductErrorState());
    }
  }

  getNewProduct(List AllProduct) {
    if (AllProduct.length > 5) {
      for (var i = AllProduct.length - 2; i > AllProduct.length - 7; i--) {
        ListNewProduct.add(AllProduct[i]);
      }
    }
  }
}
