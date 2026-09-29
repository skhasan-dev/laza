import 'package:flutter/material.dart' hide BackButton;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:laza/common/index.dart'
    show AppBackButton, AppButton, AppColors, AppTextStyles;
import 'package:laza/core/index.dart' show Toasts, getIt;
import 'package:laza/features/authentication/index.dart'
    show
        AuthTextField,
        ForgotPasswordBloc,
        ForgotPasswordState,
        ForgotPasswordSuccess,
        ForgotPasswordLoading,
        ForgotPasswordLinkSent;
import 'package:laza/gen/assets.gen.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final ForgotPasswordBloc _forgotPasswordBloc = getIt();

  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _forgotPasswordBloc,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
            listener: (context, state) {
              if (state is ForgotPasswordSuccess) {
                Toasts.showSuccessToast(
                  context,
                  message: 'Password reset link sent!!',
                );
                context.pop();
              }
            },
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: AppBackButton(),
                  ),
                  const SizedBox(height: 16),
                  Text('Forgot Password', style: AppTextStyles.s28W600),
                  const SizedBox(height: 60),
                  SvgPicture.asset(Assets.images.forgotPassword.path),

                  const SizedBox(height: 60),

                  AuthTextField(
                    controller: _emailController,
                    title: 'Email Address',
                    subtitle: 'bill.sanders@example.com',
                  ),

                  const SizedBox(height: 220),

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
        ),

        bottomNavigationBar:
            BlocSelector<ForgotPasswordBloc, ForgotPasswordState, bool>(
              selector: (state) {
                return state is ForgotPasswordLoading;
              },
              builder: (context, isLoading) {
                return AppButton(
                  label: 'Confirm Mail',
                  isLoading: isLoading,
                  onPressed: () => _forgotPasswordBloc.add(
                    ForgotPasswordLinkSent(_emailController.text.trim()),
                  ),
                );
              },
            ),
      ),
    );
  }
}
