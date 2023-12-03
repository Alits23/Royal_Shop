import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:royal_shop/bloc/product_detil/product_event.dart';
import 'package:royal_shop/bloc/product_detil/product_state.dart';
import 'package:royal_shop/data/repository/product_detail_repository.dart';
import 'package:royal_shop/di/di.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final IProductDetailRepository _productDetailRepository = locator.get();
  ProductBloc() : super(ProductInitState()) {
    on<ProductRequestData>((event, emit) async {
      emit(ProductDetailLoadingState());
      var productImage =
          await _productDetailRepository.getProductImage(event.productId);

      var productVariant = await _productDetailRepository.getproductVariants();

      var productCategory =
          await _productDetailRepository.getProductCategory(event.categoryId);

      emit(ProductDetailResponseState(
          productImage, productVariant, productCategory));
    });
  }
}
