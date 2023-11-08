import 'package:dio/dio.dart';
import 'package:royal_shop/di/di.dart';
import 'package:royal_shop/util/api_exception.dart';

abstract class IAuthenticaionDataSource {
  Future<void> register(
      String username, String password, String passwordConfirm);

  Future<String> login(String identity, String password);
}

class AuthenticationRemote implements IAuthenticaionDataSource {
  final Dio _dio = locator.get();

  //register
  @override
  Future<void> register(
      String username, String password, String passwordConfirm) async {
    try {
      final response = await _dio.post('collections/users/records', data: {
        'username': username,
        'password': password,
        'passwordConfirm': passwordConfirm,
      });
    } on DioException catch (ex) {
      throw ApiException(
        ex.response?.statusCode,
        ex.response?.data['data']['username']['message'],
      );
    } catch (ex) {
      throw ApiException(0, 'unknow error');
    }
  }

  //login
  @override
  Future<String> login(String identity, String password) async {
    try {
      final response =
          await _dio.post('collections/users/auth-with-password', data: {
        'identity': identity,
        'password': password,
      });
      if (response.statusCode == 200) {
        return response.data?['token'];
      }
    } on DioException catch (ex) {
      throw ApiException(
        ex.response?.statusCode,
        ex.response?.data['message'],
      );
    } catch (ex) {
      throw ApiException(0, 'unknow error');
    }
    return '';
  }
}
