import 'package:dartz/dartz.dart';
import 'package:royal_shop/data/datasource/authentication_datasource.dart';
import 'package:royal_shop/di/di.dart';
import 'package:royal_shop/util/api_exception.dart';
import 'package:royal_shop/util/auth_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

//مسئول گرفتن ارور یا دیتا

abstract class IAuthRepository {
  Future<Either<String, String>> register(
      String username, String password, String passwordConfirm);
  Future<Either<String, String>> login(String identity, String password);
}

class AuthenticationRepository extends IAuthRepository {
  final IAuthenticaionDataSource _datasource = locator.get();
  final SharedPreferences _sharedPref = locator.get();

  @override
  Future<Either<String, String>> register(
      String username, String password, String passwordConfirm) async {
    try {
      await _datasource.register(username, password, passwordConfirm);
      return right('ثبت نام انجام شد');
    } on ApiException catch (ex) {
      return left(ex.message ?? ' خطای ناشناخته ');
    }
  }

  //login
  @override
  Future<Either<String, String>> login(String identity, String password) async {
    try {
      String token = await _datasource.login(identity, password);
      if (token.isNotEmpty) {
        AuthManager.saveToken(token);
        return right('شما وارد شدید');
      } else {
        return left('خطایی در ورود رخ داده است');
      }
    } on ApiException {
      return left('نام کاربری یا رمز عبور اشتباه است');
    }
  }
}
