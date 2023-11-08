import 'package:flutter/material.dart';
import 'package:royal_shop/util/auth_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/repository/authentication_repository.dart';
import '../di/di.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () async {
                  var either = await AuthenticationRepository()
                      .login('alits23', '12345678');
                },
                child: Text('login'),
              ),
              ElevatedButton(
                onPressed: () async {
                  AuthManager.logout();
                },
                child: Text('logout'),
              ),
              ValueListenableBuilder(
                valueListenable: AuthManager.authChangeNotifire,
                builder: (context, value, child) {
                  if (value == null || value.isEmpty) {
                    return Text('خارج از حساب کاربری');
                  } else {
                    return Text('شما وارد شدید');
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
