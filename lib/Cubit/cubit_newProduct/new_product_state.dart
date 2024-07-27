part of 'new_product_cubit.dart';

@immutable
sealed class NewProductState {}

final class NewProductInitial extends NewProductState {}

class getProductLoadingState extends NewProductState {}

class getProductLoadedState extends NewProductState {}

class getProductErrorState extends NewProductState {}
