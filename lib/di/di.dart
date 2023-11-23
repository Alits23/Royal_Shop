import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:royal_shop/data/datasource/authentication_datasource.dart';
import 'package:royal_shop/data/datasource/banner_datasource.dart';
import 'package:royal_shop/data/datasource/category_datasource.dart';
import 'package:royal_shop/data/datasource/product_datasource.dart';
import 'package:royal_shop/data/repository/authentication_repository.dart';
import 'package:royal_shop/data/repository/banner_repository.dart';
import 'package:royal_shop/data/repository/category_repository.dart';
import 'package:royal_shop/data/repository/product_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

var locator = GetIt.instance;
Future<void> getItInit() async {
  locator.registerSingleton<Dio>(
    Dio(
      BaseOptions(baseUrl: 'http://startflutter.ir/api/'),
    ),
  );

  locator.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());

  //datasources
  locator
      .registerFactory<IAuthenticaionDataSource>(() => AuthenticationRemote());
  locator
      .registerFactory<ICategoryDatasource>(() => CategoryDataSourceRemote());

  locator.registerFactory<IBannerDatasource>(() => BannerDatasourceRemote());
  locator.registerFactory<IProductDatasource>(() => ProductDatasourceRemote());

  //repositories
  locator.registerFactory<IAuthRepository>(() => AuthenticationRepository());
  locator.registerFactory<ICategoryRepository>(() => CategoryRepository());
  locator.registerFactory<IBannerRepository>(() => BannerRepository());
  locator.registerFactory<IProductRepository>(() => ProductRepository());
}
