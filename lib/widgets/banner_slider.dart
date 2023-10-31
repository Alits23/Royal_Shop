import 'package:flutter/material.dart';
import 'package:royal_shop/constants/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerSlider extends StatelessWidget {
  const BannerSlider({super.key});

  @override
  Widget build(BuildContext context) {
    PageController pageIndicatorController =
        PageController(viewportFraction: 0.8);
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            controller: pageIndicatorController,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Container(
                  height: 200,
                  color: CustomColors.gery,
                ),
              );
            },
          ),
        ),
        Positioned(
          bottom: 10,
          child: SmoothPageIndicator(
            controller: pageIndicatorController,
            count: 3,
            effect: const ExpandingDotsEffect(
              activeDotColor: CustomColors.blueIndicator,
              dotColor: Colors.white,
              expansionFactor: 4.0,
              dotHeight: 10.0,
              dotWidth: 10.0,
            ),
          ),
        ),
      ],
    );
  }
}
