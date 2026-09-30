import 'package:flutter/material.dart' hide BackButton;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:laza/common/index.dart'
    show AppColors, AppTextStyles, AppBackButton, AppButton;
import 'package:laza/core/index.dart' show RouteNames, Toasts, getIt;
import 'package:laza/features/authentication/index.dart';
import 'package:laza/features/authentication/widgets/social_button.dart';
import 'package:laza/gen/assets.gen.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  final AuthBloc _authBloc = getIt();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _authBloc,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(alignment: Alignment.centerLeft, child: AppBackButton()),
                const SizedBox(height: 16),
                Text('Let’s Get Started', style: AppTextStyles.s28W600),

                Spacer(),

                Column(
                  spacing: 16,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SocialButton(
                      icon: Assets.images.facebook.path,
                      label: 'Facebook',
                      onPressed: () {},
                      backgroundColor: AppColors.smartBlue,
                    ),
                    SocialButton(
                      icon: Assets.images.twitter.path,
                      label: 'Twitter',
                      onPressed: () {},
                      backgroundColor: AppColors.blueBell,
                    ),
                    BlocConsumer<AuthBloc, AuthState>(
                      listener: (context, state) {
                        if (state is AuthSuccess) {
                          context.goNamed(RouteNames.profile);
                        }

                        if (state is AuthFailure) {
                          Toasts.showErrorToast(
                            context,
                            message: state.failure?.message,
                          );
                        }
                      },
                      builder: (context, state) {
                        return SocialButton(
                          icon: Assets.images.google.path,
                          label: 'Google',
                          isLoading: state is AuthLoading,
                          onPressed: () {
                            _authBloc.add(AuthSubmitted());
                          },
                          backgroundColor: AppColors.cinnabar,
                        );
                      },
                    ),
                  ],
                ),

                Spacer(),

                GestureDetector(
                  onTap: () => context.pushNamed(RouteNames.login),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Already have an account? ',
                          style: AppTextStyles.s15W400.copyWith(
                            color: AppColors.coolSteel,
                          ),
                        ),
                        TextSpan(
                          text: 'Signin',
                          style: AppTextStyles.s15W500.copyWith(
                            color: AppColors.carbonBlack,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        bottomNavigationBar: AppButton(
          label: 'Create an Account',
          onPressed: () => context.pushNamed(RouteNames.signup),
        ),
      ),
    );
  }
}
