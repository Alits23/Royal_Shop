import 'package:dartz/dartz.dart';
import 'package:royal_shop/data/datasource/product_datasource.dart';
import 'package:royal_shop/data/model/product.dart';
import 'package:royal_shop/di/di.dart';
import '../../util/api_exception.dart';

abstract class IProductRepository {
  Future<Either<String, List<Product>>> getProducts();
}

class ProductRepository extends IProductRepository {
  final IProductDatasource _datasource = locator.get();
  @override
  Future<Either<String, List<Product>>> getProducts() async {
    try {
      var response = await _datasource.getProducts();
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطای ناشناخته');
    }
  }
}
