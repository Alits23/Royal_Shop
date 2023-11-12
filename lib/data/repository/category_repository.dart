import 'package:dartz/dartz.dart';
import 'package:royal_shop/data/datasource/category_datasource.dart';
import 'package:royal_shop/data/model/category.dart';
import 'package:royal_shop/di/di.dart';
import 'package:royal_shop/util/api_exception.dart';

abstract class ICategoryRepository {
  Future<Either<String, List<Category>>> getCategories();
}

class CategoryRepository extends ICategoryRepository {
  final ICategoryDatasource _datasource = locator.get();
  @override
  Future<Either<String, List<Category>>> getCategories() async {
    try {
      var response = await _datasource.getCategories();
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطای ناشناخته');
    }
  }
}
