import 'package:flutter/material.dart' hide BackButton;
import 'package:laza/common/index.dart'
    show AppBackButton, AppButton, AppColors, AppTextStyles;
import 'package:laza/features/authentication/index.dart' show AuthTextField;

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

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
              Text('New Password', style: AppTextStyles.s28W600),

              Spacer(),

              AuthTextField(
                controller: TextEditingController(),
                title: 'Password',
                subtitle: '******',
              ),
              const SizedBox(height: 20),
              AuthTextField(
                controller: TextEditingController(),
                title: 'Confirm Password',
                subtitle: '******',
              ),

              Spacer(),

              Text(
                'Please write your new password.',
                style: AppTextStyles.s15W400.copyWith(
                  color: AppColors.coolSteel,
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: AppButton(label: 'Reset Password'),
    );
  }
}
