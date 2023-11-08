import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:royal_shop/constants/colors.dart';
import 'package:royal_shop/view/card_screen.dart';
import 'package:royal_shop/view/category_screen.dart';
import 'package:royal_shop/view/home_screen.dart';
import 'package:royal_shop/view/product_list_screen.dart';
import 'package:royal_shop/view/profile_screen.dart';
import 'package:royal_shop/view/register_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedBottomNavigationItem = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedBottomNavigationItem,
        children: _getScreens(),
      ),
      bottomNavigationBar: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            onTap: (int index) {
              setState(() {
                _selectedBottomNavigationItem = index;
              });
            },
            currentIndex: _selectedBottomNavigationItem,
            selectedLabelStyle: const TextStyle(
              fontFamily: 'sb',
              fontSize: 10.0,
              color: CustomColors.blue,
            ),
            unselectedLabelStyle: const TextStyle(
              fontFamily: 'sb',
              fontSize: 10.0,
              color: Colors.black,
            ),
            items: [
              // 1
              BottomNavigationBarItem(
                icon: Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: CustomColors.blue,
                        blurRadius: 20.0,
                        spreadRadius: -7.0,
                        offset: Offset(0.0, 10.0),
                      ),
                    ],
                  ),
                  child: Image.asset('assets/images/icon_profile.png'),
                ),
                activeIcon: Padding(
                  padding: const EdgeInsets.only(bottom: 3.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: CustomColors.blue,
                          blurRadius: 20.0,
                          spreadRadius: -7.0,
                          offset: Offset(0.0, 10.0),
                        ),
                      ],
                    ),
                    child: Image.asset('assets/images/icon_profile_active.png'),
                  ),
                ),
                label: 'حساب کاربری',
              ),
              // 2
              BottomNavigationBarItem(
                icon: Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: CustomColors.blue,
                        blurRadius: 20.0,
                        spreadRadius: -7.0,
                        offset: Offset(0.0, 10.0),
                      ),
                    ],
                  ),
                  child: Image.asset('assets/images/icon_basket.png'),
                ),
                activeIcon: Padding(
                  padding: const EdgeInsets.only(bottom: 3.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: CustomColors.blue,
                          blurRadius: 20.0,
                          spreadRadius: -7.0,
                          offset: Offset(0.0, 10.0),
                        ),
                      ],
                    ),
                    child: Image.asset('assets/images/icon_basket_active.png'),
                  ),
                ),
                label: 'سبد خرید',
              ),
              // 3
              BottomNavigationBarItem(
                icon: Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: CustomColors.blue,
                        blurRadius: 20.0,
                        spreadRadius: -7.0,
                        offset: Offset(0.0, 10.0),
                      ),
                    ],
                  ),
                  child: Image.asset('assets/images/icon_category.png'),
                ),
                activeIcon: Padding(
                  padding: const EdgeInsets.only(bottom: 3.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: CustomColors.blue,
                          blurRadius: 20.0,
                          spreadRadius: -7.0,
                          offset: Offset(0.0, 10.0),
                        ),
                      ],
                    ),
                    child:
                        Image.asset('assets/images/icon_category_active.png'),
                  ),
                ),
                label: 'دسته بندی',
              ),
              // 4
              BottomNavigationBarItem(
                icon: Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: CustomColors.blue,
                        blurRadius: 20.0,
                        spreadRadius: -7.0,
                        offset: Offset(0.0, 10.0),
                      ),
                    ],
                  ),
                  child: Image.asset('assets/images/icon_home.png'),
                ),
                activeIcon: Padding(
                  padding: const EdgeInsets.only(bottom: 3.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: CustomColors.blue,
                          blurRadius: 20.0,
                          spreadRadius: -7.0,
                          offset: Offset(0.0, 10.0),
                        ),
                      ],
                    ),
                    child: Image.asset('assets/images/icon_home_active.png'),
                  ),
                ),
                label: 'صفحه اصلی',
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _getScreens() {
    return <Widget>[
      const RegisterScreen(),
      const CardScreen(),
      const CategoryScreen(),
      const HomeScreen(),
    ];
  }
}
