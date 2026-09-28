import 'package:flutter/material.dart';
import 'package:laza/common/index.dart';
import 'package:laza/features/reviews/index.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({required this.review, super.key});
  final Review review;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          spacing: 10,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.coolSteel,
              ),
              child: Text(
                review.reviewerName?.split('').first.toUpperCase() ?? '-',
                style: AppTextStyles.s22W600.copyWith(
                  color: AppColors.carbonBlack,
                ),
              ),
            ),
            Expanded(
              child: Column(
                spacing: 4,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    review.reviewerName ?? '-',
                    style: AppTextStyles.s15W500.copyWith(
                      color: AppColors.carbonBlack,
                    ),
                  ),
                  Text(
                    review.date?.toIso8601String() ?? '-',
                    style: AppTextStyles.s11W500.copyWith(
                      color: AppColors.coolSteel,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              spacing: 4,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${review.rating} ',
                      style: AppTextStyles.s15W500.copyWith(
                        color: AppColors.carbonBlack,
                      ),
                    ),
                    Text(
                      'rating',
                      style: AppTextStyles.s11W400.copyWith(
                        color: AppColors.coolSteel,
                      ),
                    ),
                  ],
                ),
                RatingBar(rating: review.rating ?? 0),
              ],
            ),
          ],
        ),
        Text(
          review.comment ?? '-',
          textAlign: TextAlign.start,
          maxLines: 3,
          style: AppTextStyles.s15W400.copyWith(
            color: AppColors.coolSteel,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
