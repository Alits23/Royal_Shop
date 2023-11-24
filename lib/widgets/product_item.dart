import 'package:flutter/material.dart';
import 'package:royal_shop/data/model/product.dart';
import 'package:royal_shop/view/product_detail_screen.dart';
import 'package:royal_shop/widgets/cashed_image.dart';

import '../constants/colors.dart';

class ProductItem extends StatelessWidget {
  Product product;
  ProductItem(
    this.product, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(),
          ),
        );
      },
      child: Container(
        height: 216.0,
        width: 160.0,
        decoration: BoxDecoration(
          color: CustomColors.white,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 10.0,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                const SizedBox(
                  width: double.infinity,
                ),
                SizedBox(
                  height: 98.0,
                  width: 98.0,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: CashedImage(
                      imageUrl: product.thumbnail,
                    ),
                  ),
                ),
                Positioned(
                  top: 0.0,
                  right: 10.0,
                  child: Image.asset(
                    'assets/images/active_fav_product.png',
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  left: 5.0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: CustomColors.red,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 2,
                        horizontal: 5,
                      ),
                      child: Text(
                        '%${product.persent!.round()}',
                        style: const TextStyle(
                          fontFamily: 'sb',
                          fontSize: 12,
                          color: CustomColors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0, right: 10.0),
                  child: Text(
                    product.name,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontFamily: 'sm',
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Container(
                  height: 53.0,
                  decoration: const BoxDecoration(
                    color: CustomColors.blue,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: CustomColors.blue,
                        blurRadius: 25.0,
                        spreadRadius: -12.0,
                        offset: Offset(0.0, 15.0),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      children: [
                        const Text(
                          'تومان',
                          style: TextStyle(
                            color: CustomColors.white,
                            fontFamily: 'sm',
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.price.toString(),
                              style: const TextStyle(
                                color: CustomColors.white,
                                fontFamily: 'sm',
                                fontSize: 12,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            Text(
                              product.realPrice.toString(),
                              style: const TextStyle(
                                color: CustomColors.white,
                                fontFamily: 'sm',
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        SizedBox(
                          width: 24,
                          child: Image.asset(
                            'assets/images/icon_right_arrow_cricle.png',
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
