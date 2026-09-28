import 'package:flutter/material.dart';
import 'package:laza/common/index.dart';

class AddReview extends StatefulWidget {
  const AddReview({super.key});

  @override
  State<AddReview> createState() => _AddReviewState();
}

class _AddReviewState extends State<AddReview> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(hideCart: true),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          spacing: 20,
          children: [
            AppTextField(
              controller: nameController,
              title: 'Name',
              subtitle: 'Type your name',
            ),
            AppTextField(
              controller: commentController,
              title: 'How was your experience ?',
              subtitle: 'Describe your experience?',
              maxLines: 5,
            ),
          ],
        ),
      ),

      bottomNavigationBar: AppButton(label: 'Submit Review'),
    );
  }
}
