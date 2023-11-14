import 'package:dartz/dartz.dart';
import 'package:royal_shop/data/model/banner.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeResponseState extends HomeState {
  Either<String, List<BannerCampaign>> bannerList;
  HomeResponseState(this.bannerList);
}
