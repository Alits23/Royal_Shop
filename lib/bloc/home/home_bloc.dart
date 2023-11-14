import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:royal_shop/bloc/home/home_event.dart';
import 'package:royal_shop/bloc/home/home_state.dart';
import 'package:royal_shop/data/repository/banner_repository.dart';
import 'package:royal_shop/data/repository/category_repository.dart';
import 'package:royal_shop/di/di.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IBannerRepository _bannerRepository = locator.get();
  final ICategoryRepository _categoryRepository = locator.get();
  HomeBloc() : super(HomeInitialState()) {
    on<HomeRequestData>((event, emit) async {
      emit(HomeLoadingState());
      var bannerList = await _bannerRepository.getBanners();
      var categoryList = await _categoryRepository.getCategories();
      emit(
        HomeResponseState(
          bannerList: bannerList,
          categoryList: categoryList,
        ),
      );
    });
  }
}
