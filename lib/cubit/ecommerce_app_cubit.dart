import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/shared/dioHelper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../models/productModel.dart';

part 'ecommerce_app_state.dart';

class EcommerceAppCubit extends Cubit<EcommerceAppState> {
  static EcommerceAppCubit get(context) =>
      BlocProvider.of<EcommerceAppCubit>(context);
  EcommerceAppCubit() : super(EcommerceAppInitial());
  List<String> category = [];
  getCategory({required String lang}) async {
    emit(getCategotyLoadingState());
    try {
      Response response =
          await Diohelper.getData(path: "categories", lang: lang);
      category = [];
      response.data["data"]["data"].forEach((element) {
        category.add(element["name"]);
      });
      emit(getCategotyLoadedState());
    } catch (e) {
      print("error ==== ${e.toString()}");
      emit(getCategotyErrorState());
    }
  }

  List<String> banners = [];
  getBannerImage() async {
    banners = [];
    emit(getBannersLoadingState());
    try {
      Response response = await Diohelper.getData(path: "banners");
      response.data["data"].forEach((element) {
        banners.add(element["image"]);
      });
      emit(getBannersLoadedState());
    } catch (e) {
      emit(getBannersErrorState());
      print("Error ========${e.toString()}");
    }
  }

  List<Productmodel> ListAllProduct = [];
  List<Productmodel> ListNewProduct = [];
  getAllProduct({required String lang}) async {
    emit(getProductLoadingState());
    ListAllProduct = [];
    ListNewProduct = [];
    try {
      Response response = await Diohelper.getData(path: "home", lang: lang);
      response.data["data"]["products"].forEach((element) {
        ListAllProduct.add(Productmodel.fromJson(element));
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
      for (var i = AllProduct.length - 1; i > AllProduct.length - 6; i--) {
        ListNewProduct.add(AllProduct[i]);
      }
    }
  }
}
