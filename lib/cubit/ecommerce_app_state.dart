part of 'ecommerce_app_cubit.dart';

@immutable
sealed class EcommerceAppState {}

final class EcommerceAppInitial extends EcommerceAppState {}

class getCategotyLoadingState extends EcommerceAppState {}

class getCategotyLoadedState extends EcommerceAppState {}

class getCategotyErrorState extends EcommerceAppState {}


class getBannersLoadingState extends EcommerceAppState {}

class getBannersLoadedState extends EcommerceAppState {}

class getBannersErrorState extends EcommerceAppState {}


class getProductLoadingState extends EcommerceAppState {}

class getProductLoadedState extends EcommerceAppState {}

class getProductErrorState extends EcommerceAppState {}
