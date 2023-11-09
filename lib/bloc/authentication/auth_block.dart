import 'package:bloc/bloc.dart';
import 'package:royal_shop/bloc/authentication/auth.state.dart';
import 'package:royal_shop/bloc/authentication/auth_event.dart';
import 'package:royal_shop/data/repository/authentication_repository.dart';
import 'package:royal_shop/di/di.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepository _repository = locator.get();
  AuthBloc() : super(AuthInitiatState()) {
    on<AuthLoginRequest>((event, emit) async {
      emit(AuthLoadingState());
      var response = await _repository.login(event.username, event.password);
      emit(AuthReponseState(response));
    });
  }
}
