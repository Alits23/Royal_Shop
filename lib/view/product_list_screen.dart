import 'package:flutter/material.dart';
import 'package:royal_shop/widgets/product_item.dart';

import '../constants/colors.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundScreenColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                    right: 44.0, left: 44.0, bottom: 32.0, top: 5.0),
                child: Container(
                  height: 56.0,
                  decoration: BoxDecoration(
                    color: CustomColors.white,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 16.0,
                      ),
                      Image.asset('assets/images/icon_apple_blue.png'),
                      const Expanded(
                        child: Text(
                          'پرفروش ترین ها',
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
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
              ),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  childCount: 20,
                  (context, index) {
                    // return const ProductItem();
                    return Text('');
                  },
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 2 / 2.8,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
