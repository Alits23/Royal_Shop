import 'package:dio/dio.dart';
import 'package:royal_shop/data/model/product.dart';
import 'package:royal_shop/di/di.dart';
import 'package:royal_shop/util/api_exception.dart';

abstract class IProductDatasource {
  Future<List<Product>> getProducts();
}

class ProductDatasourceRemote extends IProductDatasource {
  final Dio _dio = locator.get();
  @override
  Future<List<Product>> getProducts() async {
    try {
      var response = await _dio.get('collections/products/records');
      return response.data['items']
          .map<Product>((jsonObject) => Product.fromJson(jsonObject))
          .toList();
    } on DioException catch (ex) {
      throw ApiException(
        ex.response?.statusCode,
        ex.response?.data['message'],
      );
    } catch (ex) {
      throw ApiException(0, 'unknow error');
    }
  }
}
