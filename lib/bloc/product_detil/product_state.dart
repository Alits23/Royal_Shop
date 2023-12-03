import 'package:dartz/dartz.dart';
import 'package:royal_shop/data/model/category.dart';
import 'package:royal_shop/data/model/product_image.dart';
import 'package:royal_shop/data/model/product_variant.dart';
import 'package:royal_shop/data/model/variant_type.dart';

abstract class ProductState {}

class ProductInitState extends ProductState {}

class ProductDetailLoadingState extends ProductState {}

class ProductDetailResponseState extends ProductState {
  Either<String, List<ProductImage>> productImages;
  Either<String, List<ProductVariant>> productVariant;
  Either<String, Category> productCategory;
  ProductDetailResponseState(
      this.productImages, this.productVariant, this.productCategory);
}
