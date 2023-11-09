import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:royal_shop/bloc/authentication/auth.state.dart';
import 'package:royal_shop/bloc/authentication/auth_block.dart';
import 'package:royal_shop/bloc/authentication/auth_event.dart';
import 'package:royal_shop/constants/colors.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _usernameTextController = TextEditingController(text: 'alits23');
  final _passwordTextController = TextEditingController(text: '12345678');
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: CustomColors.blue,
        body: BlocProvider(
          create: ((context) => AuthBloc()),
          child: SafeArea(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/icon_application.png',
                            width: 100.0,
                            height: 100.0,
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          const Text(
                            'رویال شاپ',
                            style: TextStyle(
                              fontFamily: 'sb',
                              fontSize: 24.0,
                              color: CustomColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: CustomColors.blue,
                      ),
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.all(20.0),
                  padding: const EdgeInsets.all(20.0),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                    color: CustomColors.backgroundScreenColor,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: _usernameTextController,
                        decoration: InputDecoration(
                          labelText: 'نام کابری',
                          labelStyle: const TextStyle(
                            fontFamily: 'sm',
                            fontSize: 18.0,
                            color: Colors.black,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 2.0, color: Colors.black),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3.0, color: Colors.blue),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: _passwordTextController,
                        decoration: InputDecoration(
                          labelText: 'رمز عبور',
                          labelStyle: const TextStyle(
                            fontFamily: 'sm',
                            fontSize: 18.0,
                            color: Colors.black,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 2.0, color: Colors.black),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3.0, color: Colors.blue),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          if (state is AuthInitiatState) {
                            return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                textStyle: const TextStyle(
                                  fontFamily: 'sb',
                                  fontSize: 20.0,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                minimumSize: const Size(200, 48),
                              ),
                              onPressed: () {
                                BlocProvider.of<AuthBloc>(context).add(
                                  AuthLoginRequest(_usernameTextController.text,
                                      _passwordTextController.text),
                                );
                              },
                              child: const Text(' ورود'),
                            );
                          }

                          if (state is AuthLoadingState) {
                            return const CircularProgressIndicator();
                          }
                          if (state is AuthReponseState) {
                            Text text = const Text('');
                            state.response.fold((l) {
                              text = Text(l);
                            }, (r) {
                              text = Text(r);
                            });
                            return text;
                          }

                          return const Text('! خطای نا مشخص');
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
