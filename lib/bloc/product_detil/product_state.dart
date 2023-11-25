import 'package:dartz/dartz.dart';
import 'package:royal_shop/data/model/product_image.dart';

abstract class ProductState {}

class ProductInitState extends ProductState {}

class ProductDetailLoadingState extends ProductState {}

class ProductDetailResponseState extends ProductState {
  Either<String, List<ProductImage>> getProductimage;
  ProductDetailResponseState(this.getProductimage);
}
