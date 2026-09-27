import 'package:flutter/material.dart' hide BackButton;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:laza/common/index.dart'
    show AppBackButton, AppButton, AppColors, AppTextStyles;
import 'package:laza/core/index.dart' show RouteNames;
import 'package:laza/features/authentication/index.dart' show AuthTextField;
import 'package:laza/gen/assets.gen.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(alignment: Alignment.centerLeft, child: AppBackButton()),
              const SizedBox(height: 16),
              Text('Forgot Password', style: AppTextStyles.s28W600),
              const SizedBox(height: 60),
              SvgPicture.asset(Assets.images.forgotPassword.path),

              const SizedBox(height: 60),

              AuthTextField(
                controller: TextEditingController(),
                title: 'Email Address',
                subtitle: 'bill.sanders@example.com',
              ),

              Spacer(),

              Text(
                'Please write your email to receive a confirmation code to set a new password.',
                textAlign: TextAlign.center,
                style: AppTextStyles.s15W400.copyWith(
                  color: AppColors.coolSteel,
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: AppButton(
        label: 'Confirm Mail',
        onPressed: () => context.pushNamed(RouteNames.otpScreen),
      ),
    );
  }
}
