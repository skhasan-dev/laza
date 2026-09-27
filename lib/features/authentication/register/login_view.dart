import 'package:flutter/material.dart' hide BackButton;
import 'package:go_router/go_router.dart';
import 'package:laza/common/index.dart'
    show AppBackButton, AppButton, AppColors, AppTextStyles;
import 'package:laza/core/index.dart' show RouteNames;
import 'package:laza/features/authentication/index.dart' show AuthTextField;

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
              Text('Welcome', style: AppTextStyles.s28W600),
              const SizedBox(height: 4),
              Text(
                'Please enter your data to continue',
                style: AppTextStyles.s15W400.copyWith(
                  color: AppColors.coolSteel,
                ),
              ),

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
                  const SizedBox(height: 30),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () => context.pushNamed(RouteNames.forgotPassword),
                      child: Text(
                        'Forgot Password?',
                        style: AppTextStyles.s15W400.copyWith(
                          color: AppColors.cinnabar,
                        ),
                      ),
                    ),
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

              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'By connecting your account confirm that you agree with our ',
                      style: AppTextStyles.s15W400.copyWith(
                        color: AppColors.coolSteel,
                      ),
                    ),
                    TextSpan(
                      text: 'Term and Condition',
                      style: AppTextStyles.s15W500.copyWith(
                        color: AppColors.carbonBlack,
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
        label: 'Login',
        onPressed: () => context.pushNamed(RouteNames.home),
      ),
    );
  }
}
