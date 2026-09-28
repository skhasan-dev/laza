import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:laza/common/index.dart';
import 'package:laza/core/index.dart';
import 'package:laza/features/reviews/index.dart';
import 'package:laza/gen/assets.gen.dart';

class ReviewsView extends StatefulWidget {
  const ReviewsView({required this.id, required this.reviews, super.key});
  final String id;
  final List<Review> reviews;

  @override
  State<ReviewsView> createState() => _ReviewsViewState();
}

class _ReviewsViewState extends State<ReviewsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        hideCart: true,
        title: Text('Reviews', style: AppTextStyles.s17W600),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.reviews.length} Reviews',
                      style: AppTextStyles.s15W500.copyWith(
                        color: AppColors.carbonBlack,
                      ),
                    ),
                    Row(
                      spacing: 4,
                      children: [
                        Text(
                          rating,
                          style: AppTextStyles.s15W500.copyWith(
                            color: AppColors.carbonBlack,
                          ),
                        ),
                        RatingBar(rating: 4),
                      ],
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () => context.pushNamed(RouteNames.addReview),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.coralGlow,
                    ),
                    child: Row(
                      spacing: 8,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          Assets.icons.editSquare.path,
                          colorFilter: ColorFilter.mode(
                            AppColors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                        Text(
                          'Add Review',
                          style: AppTextStyles.s13W500.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Expanded(
              child: ListView.separated(
                itemCount: widget.reviews.length,
                separatorBuilder: (_, _) => const SizedBox(height: 20),
                itemBuilder: (_, index) {
                  return ReviewCard(review: widget.reviews[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String get rating {
    double sum = 0;
    for (final review in widget.reviews) {
      sum += review.rating ?? 0;
    }

    return (sum / widget.reviews.length).toStringAsFixed(1);
  }
}
