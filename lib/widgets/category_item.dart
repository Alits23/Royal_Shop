import 'package:flutter/material.dart';
import 'package:royal_shop/data/model/category.dart';
import 'package:royal_shop/widgets/cashed_image.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  CategoryItem(
    this.category, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String categoryColor = 'ff${category.color}';
    int hexColorCategories = int.parse(categoryColor, radix: 16);
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 56,
              width: 56,
              decoration: ShapeDecoration(
                color: Color(hexColorCategories),
                shadows: [
                  BoxShadow(
                    color: Color(hexColorCategories),
                    blurRadius: 25.0,
                    spreadRadius: -12.0,
                    offset: const Offset(0.0, 15.0),
                  ),
                ],
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ),
            SizedBox(
              width: 24,
              height: 24,
              child: FittedBox(
                fit: BoxFit.cover,
                child: CashedImage(
                  imageUrl: category.icon,
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          '${category.title}',
          style: TextStyle(
            fontFamily: 'SB',
          ),
        ),
      ],
    );
  }
}
