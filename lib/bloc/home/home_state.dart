import 'package:dartz/dartz.dart';
import 'package:royal_shop/data/model/banner.dart';
import 'package:royal_shop/data/model/category.dart';
import 'package:royal_shop/data/model/product.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeRequestSuccessState extends HomeState {
  Either<String, List<BannerCampaign>> bannerList;
  Either<String, List<Category>> categoryList;
  Either<String, List<Product>> productList;
  Either<String, List<Product>> hotestProductList;
  Either<String, List<Product>> bestSellerProductList;
  HomeRequestSuccessState({
    required this.bannerList,
    required this.categoryList,
    required this.productList,
    required this.hotestProductList,
    required this.bestSellerProductList,
  });
}
