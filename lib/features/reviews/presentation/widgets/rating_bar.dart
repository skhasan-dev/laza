import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:laza/gen/assets.gen.dart';

class RatingBar extends StatelessWidget {
  const RatingBar({required this.rating, super.key});

  final int rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 2,
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < 5; i++)
          SvgPicture.asset(
            i < rating ? Assets.icons.starFilled.path : Assets.icons.star.path,
            height: 13,
            width: 13,
          ),
      ],
    );
  }
}
