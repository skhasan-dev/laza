import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:laza/common/index.dart';
import 'package:laza/core/index.dart';
import 'package:laza/features/reviews/index.dart';

class AddReview extends StatefulWidget {
  const AddReview({required this.productId, super.key});
  final String productId;

  @override
  State<AddReview> createState() => _AddReviewState();
}

class _AddReviewState extends State<AddReview> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController commentController = TextEditingController();

  final ReviewBloc _reviewBloc = getIt();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _reviewBloc,
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: CustomAppBar(
          hideCart: true,
          title: Text('Add Review', style: AppTextStyles.s17W600),
        ),

        body: BlocListener<ReviewBloc, ReviewState>(
          listener: (context, state) {
            if (state is ReviewAddedSuccess) {
              context.pop(true);
            }
          },
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                spacing: 20,
                children: [
                  AppTextField(
                    controller: nameController,
                    title: 'Name',
                    subtitle: 'Type your name',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Name is required';
                      }
                      return null;
                    },
                  ),
                  AppTextField(
                    controller: commentController,
                    title: 'How was your experience ?',
                    subtitle: 'Describe your experience?',
                    maxLines: 5,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Comment is required';
                      }

                      if (value.split(' ').length < 5) {
                        return 'Comment should be more than equal to 5 words';
                      }

                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
        ),

        bottomNavigationBar: BlocSelector<ReviewBloc, ReviewState, bool>(
          selector: (state) => state is ReviewLoading,
          builder: (context, isLoading) {
            return AppButton(
              label: 'Submit Review',
              isLoading: isLoading,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _reviewBloc.add(
                    ReviewSubmitted(
                      review: Review(
                        comment: commentController.text.trim(),
                        reviewerName: nameController.text.trim(),
                        rating: 5,
                        date: DateTime.now(),
                      ),
                      productId: widget.productId,
                    ),
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }
}
