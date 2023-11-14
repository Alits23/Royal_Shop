import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:royal_shop/bloc/catrgory/category_state.dart';
import 'package:royal_shop/bloc/catrgory/catrgory_event.dart';
import 'package:royal_shop/data/repository/category_repository.dart';
import 'package:royal_shop/di/di.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final ICategoryRepository _repository = locator.get();

  CategoryBloc() : super(CategoryInitiatState()) {
    on<CategoryRequestList>((event, emit) async {
      emit(CategoryLoadingState());
      var response = await _repository.getCategories();
      emit(CategoryResponseState(response));
    });
  }
}
