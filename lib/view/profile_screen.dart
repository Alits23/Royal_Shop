import 'package:flutter/material.dart';
import 'package:royal_shop/constants/colors.dart';
import 'package:royal_shop/widgets/category_icon_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundScreenColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  right: 44.0, left: 44.0, bottom: 32.0, top: 5.0),
              child: Container(
                height: 56.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    Image.asset('assets/images/icon_apple_blue.png'),
                    const Expanded(
                      child: Text(
                        'حساب کاربری',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'sb',
                          color: CustomColors.blue,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 38.0,
                    ),
                  ],
                ),
              ),
            ),
            const Text(
              'علی تشکری صباغ',
              style: TextStyle(
                fontFamily: 'sb',
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              '09123456789',
              style: TextStyle(
                fontFamily: 'sm',
                fontSize: 14,
                color: CustomColors.gery,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Wrap(
              spacing: 20.0,
              runSpacing: 20.0,
              alignment: WrapAlignment.end,
              children: [
                // CategoryItem(),
                // CategoryItem(),
                // CategoryItem(),
                // CategoryItem(),
                // CategoryItem(),
                // CategoryItem(),
                // CategoryItem(),
                // CategoryItem(),
                // CategoryItem(),
                // CategoryItem(),
              ],
            ),
            const Spacer(),
            const Text(
              'Royal Shop',
              style: TextStyle(
                fontFamily: 'sm',
                fontSize: 12.0,
                color: CustomColors.gery,
              ),
            ),
            const Text(
              'v - 2.2.04',
              style: TextStyle(
                fontFamily: 'sm',
                fontSize: 12.0,
                color: CustomColors.gery,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
