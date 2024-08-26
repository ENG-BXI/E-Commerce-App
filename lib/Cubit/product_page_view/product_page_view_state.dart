part of 'product_page_view_cubit.dart';

@immutable
sealed class ProductPageViewState {}

final class ProductPageViewInitial extends ProductPageViewState {}
class changeImagePreviewProductState extends ProductPageViewState {}
