import 'package:flutter/material.dart' hide BackButton;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:laza/common/index.dart'
    show AppBackButton, AppButton, AppColors, AppTextStyles;
import 'package:laza/core/index.dart' show RouteNames;
import 'package:laza/features/authentication/index.dart' show OtpInputField;
import 'package:laza/gen/assets.gen.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});

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
              Text('Verification Code', style: AppTextStyles.s28W600),
              const SizedBox(height: 60),
              SvgPicture.asset(Assets.images.forgotPassword.path),

              const SizedBox(height: 60),

              OtpInputField(),

              Spacer(),

              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '00:20 ',
                      style: AppTextStyles.s15W500.copyWith(
                        color: AppColors.carbonBlack,
                      ),
                    ),
                    TextSpan(
                      text: 'resend confirmation code.',
                      style: AppTextStyles.s15W400.copyWith(
                        color: AppColors.coolSteel,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: AppButton(
        label: 'Confirm Code',
        onPressed: () => context.pushNamed(RouteNames.resetPassword),
      ),
    );
  }
}
