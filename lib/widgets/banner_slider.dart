import 'package:flutter/material.dart';
import 'package:royal_shop/constants/colors.dart';
import 'package:royal_shop/data/model/banner.dart';
import 'package:royal_shop/widgets/cashed_image.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerSlider extends StatelessWidget {
  List<BannerCampaign> bannerList;
  BannerSlider(this.bannerList, {super.key});

  @override
  Widget build(BuildContext context) {
    PageController pageIndicatorController =
        PageController(viewportFraction: 0.9);
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: 177.0,
          child: PageView.builder(
            controller: pageIndicatorController,
            itemCount: bannerList.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 6.0),
                child: CashedImage(
                  imageUrl: bannerList[index].thumbnail,
                  radius: 15.0,
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
              dotHeight: 7.0,
              dotWidth: 7.0,
            ),
          ),
        ),
      ],
    );
  }
}
