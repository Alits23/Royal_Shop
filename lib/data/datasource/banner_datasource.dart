import 'package:dio/dio.dart';
import 'package:royal_shop/data/model/banner.dart';
import 'package:royal_shop/di/di.dart';

import '../../util/api_exception.dart';

abstract class IBannerDatasource {
  Future<List<Banner>> getBanners();
}

class BannerDatasourceRemote extends IBannerDatasource {
  final Dio _dio = locator.get();

  @override
  Future<List<Banner>> getBanners() async {
    try {
      var response = await _dio.get('collections/banner/records');
      return response.data['items']
          .map<Banner>((jsonObject) => Banner.fromJson(jsonObject))
          .toList();
    } on DioException catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknow error');
    }
  }
}
