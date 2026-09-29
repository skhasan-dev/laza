import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  final ReviewBloc _reviewBloc = getIt();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _reviewBloc.add(ReviewsFetched(widget.id));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _reviewBloc,
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: CustomAppBar(
          hideCart: true,
          title: Text('Reviews', style: AppTextStyles.s17W600),
        ),

        body: BlocSelector<ReviewBloc, ReviewState, ReviewState>(
          selector: (state) => state,
          builder: (context, state) {
            if (state is ReviewLoading) {
              return Center(child: CircularProgressIndicator());
            }

            if (state is ReviewSuccess) {
              final reviews = [...state.reviews, ...widget.reviews];
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
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
                              '${reviews.length} Reviews',
                              style: AppTextStyles.s15W500.copyWith(
                                color: AppColors.carbonBlack,
                              ),
                            ),
                            Row(
                              spacing: 4,
                              children: [
                                Text(
                                  rating(reviews).toStringAsFixed(1),
                                  style: AppTextStyles.s15W500.copyWith(
                                    color: AppColors.carbonBlack,
                                  ),
                                ),
                                RatingBar(rating: rating(reviews).round()),
                              ],
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () async {
                            final res = await context.pushNamed(
                              RouteNames.addReview,
                              extra: widget.id.toString(),
                            );

                            if (res == true) {
                              _reviewBloc.add(ReviewsFetched(widget.id));
                            }
                          },
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
                        itemCount: reviews.length,
                        separatorBuilder: (_, _) => const SizedBox(height: 20),
                        itemBuilder: (_, index) {
                          return ReviewCard(review: reviews[index]);
                        },
                      ),
                    ),
                  ],
                ),
              );
            }

            return SizedBox.shrink();
          },
        ),
      ),
    );
  }

  double rating(List<Review> reviews) {
    double sum = 0;
    for (final review in reviews) {
      sum += review.rating ?? 0;
    }

    return sum / reviews.length;
  }
}
