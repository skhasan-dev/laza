import 'package:flutter/material.dart' hide BackButton;
import 'package:laza/common/index.dart'
    show AppBackButton, AppButton, AppColors, AppTextStyles;
import 'package:laza/features/authentication/index.dart' show AuthTextField;

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  bool value = true;

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
              Text('Sign Up', style: AppTextStyles.s28W600),

              Spacer(),

              Column(
                spacing: 16,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AuthTextField(
                    controller: TextEditingController(),
                    title: 'Username',
                    subtitle: 'John Doe',
                  ),
                  const SizedBox(height: 20),
                  AuthTextField(
                    controller: TextEditingController(),
                    title: 'Password',
                    subtitle: '*******',
                  ),
                  const SizedBox(height: 20),
                  AuthTextField(
                    controller: TextEditingController(),
                    title: 'Email Address',
                    subtitle: 'bill.sanders@example.com',
                  ),
                  const SizedBox(height: 40),
                  SwitchListTile.adaptive(
                    value: value,
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                    minVerticalPadding: 0,
                    title: Text(
                      'Remember me',
                      style: AppTextStyles.s13W500.copyWith(
                        color: AppColors.carbonBlack,
                      ),
                    ),
                    activeTrackColor: AppColors.jadeGreen,
                    onChanged: (newValue) {
                      setState(() {
                        value = newValue;
                      });
                    },
                  ),
                ],
              ),

              Spacer(),
            ],
          ),
        ),
      ),

      bottomNavigationBar: AppButton(label: 'Sign Up'),
    );
  }
}
