import 'package:flutter/material.dart';
import 'package:royal_shop/constants/colors.dart';
import 'package:royal_shop/widgets/banner_slider.dart';
import 'package:royal_shop/widgets/category_item.dart';

import '../widgets/product_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Scaffold(
            backgroundColor: CustomColors.backgroundScreenColor,
            body: CustomScrollView(
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
                              'جستجوی محصولات',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontFamily: 'sb',
                                color: CustomColors.gery,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Image.asset('assets/images/icon_search.png'),
                          const SizedBox(
                            width: 16.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 32),
                    child: BannerSlider(),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(right: 44, left: 44, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'دسته بندی ها',
                          style: TextStyle(
                            fontFamily: 'sb',
                            color: CustomColors.gery,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 44, bottom: 20),
                    child: SizedBox(
                      height: 88,
                      child: ListView.builder(
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        reverse: true,
                        itemBuilder: (context, index) {
                          return const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: CategoryItem(),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(right: 44, left: 44, bottom: 20),
                    child: Row(
                      children: [
                        Image.asset('assets/images/icon_left_categroy.png'),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'مشاهده همه',
                          style: TextStyle(
                            fontFamily: 'sb',
                            color: CustomColors.blue,
                          ),
                        ),
                        const Spacer(),
                        const Text(
                          'پرفروش ترین ها',
                          style: TextStyle(
                            fontFamily: 'sb',
                            color: CustomColors.gery,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 44.0),
                    child: SizedBox(
                      height: 200,
                      child: ListView.builder(
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        reverse: true,
                        itemBuilder: (context, index) {
                          return const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: ProductItem(),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: 44, left: 44, bottom: 20, top: 32),
                    child: Row(
                      children: [
                        Image.asset('assets/images/icon_left_categroy.png'),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'مشاهده همه',
                          style: TextStyle(
                            fontFamily: 'sb',
                            color: CustomColors.blue,
                          ),
                        ),
                        const Spacer(),
                        const Text(
                          'پربازدید ترین ها',
                          style: TextStyle(
                            fontFamily: 'sb',
                            color: CustomColors.gery,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 44.0),
                    child: SizedBox(
                      height: 200,
                      child: ListView.builder(
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        reverse: true,
                        itemBuilder: (context, index) {
                          return const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: ProductItem(),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }

  ListView getListCategory() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      reverse: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.only(left: 20),
          child: CategoryItem(),
        );
      },
    );
  }
}
