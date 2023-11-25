import 'package:dio/dio.dart';
import 'package:royal_shop/data/model/product_image.dart';
import 'package:royal_shop/di/di.dart';

import '../../util/api_exception.dart';

abstract class IProductDetailDataSource {
  Future<List<ProductImage>> getGallery();
}

class ProductDetailDataSourceRemote extends IProductDetailDataSource {
  final Dio _dio = locator.get();
  @override
  Future<List<ProductImage>> getGallery() async {
    try {
      var response = await _dio.get('collections/gallery/records');
      return response.data['items']
          .map<ProductImage>((jsonObject) => ProductImage.fromJson(jsonObject))
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
