import 'package:dartz/dartz.dart';

abstract class AuthState {}

class AuthInitiatState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthReponseState extends AuthState {
  Either<String, String> response;
  AuthReponseState(this.response);
}
