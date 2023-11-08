import 'package:flutter/material.dart';
import 'package:royal_shop/data/datasource/authentication_datasource.dart';
import 'package:royal_shop/data/repository/authentication_repository.dart';
import 'package:royal_shop/di/di.dart';
import 'package:royal_shop/view/product_detail_screen.dart';
import 'package:royal_shop/widgets/bottom_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getItInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavigation(),
    );
  }
}
