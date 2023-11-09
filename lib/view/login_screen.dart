import 'package:flutter/material.dart';
import 'package:royal_shop/constants/colors.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _usernameTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: CustomColors.blue,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                  margin: const EdgeInsets.all(20.0),
                  padding: const EdgeInsets.all(20.0),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                    color: CustomColors.backgroundScreenColor,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
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
                                  width: 3.0, color: Colors.black),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 2.0, color: Colors.blue),
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
                                  width: 3.0, color: Colors.black),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 2.0, color: Colors.blue),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            textStyle: TextStyle(
                              fontFamily: 'sb',
                              fontSize: 20.0,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            minimumSize: Size(200, 48),
                          ),
                          onPressed: () {},
                          child: const Text(' ورود'),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
