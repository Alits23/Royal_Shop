import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 56,
              width: 56,
              decoration: ShapeDecoration(
                color: Colors.red,
                shadows: const [
                  BoxShadow(
                    color: Colors.red,
                    blurRadius: 25.0,
                    spreadRadius: -12.0,
                    offset: Offset(0.0, 15.0),
                  ),
                ],
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ),
            const Icon(
              Icons.apple,
              color: Colors.white,
              size: 36,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Apple',
          style: TextStyle(
            fontFamily: 'SB',
          ),
        ),
      ],
    );
  }
}
