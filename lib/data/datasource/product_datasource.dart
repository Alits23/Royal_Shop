import 'package:dio/dio.dart';
import 'package:royal_shop/data/model/product.dart';
import 'package:royal_shop/di/di.dart';
import 'package:royal_shop/util/api_exception.dart';

abstract class IProductDatasource {
  Future<List<Product>> getProducts();
  Future<List<Product>> getHotest();
  Future<List<Product>> getBestSeller();
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

  @override
  Future<List<Product>> getBestSeller() async {
    Map<String, String> qParams = {'filter': 'popularity="Best Seller"'};
    try {
      var response = await _dio.get(
        'collections/products/records',
        queryParameters: qParams,
      );
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

  @override
  Future<List<Product>> getHotest() async {
    Map<String, String> qParams = {'filter': 'popularity="Hotest"'};
    try {
      var response = await _dio.get(
        'collections/products/records',
        queryParameters: qParams,
      );
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
