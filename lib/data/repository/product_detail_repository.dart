import 'package:dartz/dartz.dart';
import 'package:royal_shop/data/datasource/product_detail_datasource.dart';
import 'package:royal_shop/data/model/product_image.dart';
import 'package:royal_shop/di/di.dart';

import '../../util/api_exception.dart';

abstract class IProductDetailRepository {
  Future<Either<String, List<ProductImage>>> getProductImage();
}

class ProductDetailRepository extends IProductDetailRepository {
  final IProductDetailDataSource _dataSource = locator.get();
  @override
  Future<Either<String, List<ProductImage>>> getProductImage() async {
    try {
      var response = await _dataSource.getGallery();
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطای ناشناخته');
    }
  }
}
