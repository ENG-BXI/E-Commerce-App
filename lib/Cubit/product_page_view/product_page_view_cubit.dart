import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'product_page_view_state.dart';

class ProductPageViewCubit extends Cubit<ProductPageViewState> {
  ProductPageViewCubit() : super(ProductPageViewInitial());

  bool isSelectedImagePreview = false;
  late int indexSelectedImagePreview;
  changeImagePreviewProduct({required int index}) {
    isSelectedImagePreview = true;
    indexSelectedImagePreview = index;
    emit(changeImagePreviewProductState());
  }
}
