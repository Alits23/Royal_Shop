import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:royal_shop/constants/colors.dart';

class CashedImage extends StatelessWidget {
  CashedImage({super.key, this.imageUrl, this.radius = 0});
  String? imageUrl;
  double radius;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: imageUrl ??
            'http://startflutter.ir/api/files/f5pm8kntkfuwbn1/78q8w901e6iipuk/rectangle_63_7kADbEzuEo.png',
        errorWidget: (context, url, error) => Container(
          color: CustomColors.red,
        ),
        placeholder: (context, url) => Container(
          color: CustomColors.gery,
        ),
      ),
    );
  }
}
