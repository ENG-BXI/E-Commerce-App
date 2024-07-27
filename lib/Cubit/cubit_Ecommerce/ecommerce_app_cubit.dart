import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/shared/dioHelper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';


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


}
