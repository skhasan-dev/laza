import 'package:flutter/material.dart' hide BackButton;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:laza/common/index.dart'
    show AppBackButton, AppButton, AppColors, AppTextStyles;
import 'package:laza/core/index.dart' show RouteNames, getIt, Toasts;
import 'package:laza/features/authentication/index.dart'
    show
        AuthTextField,
        LoginBloc,
        LoginLoading,
        LoginState,
        LoginSuccess,
        LoginSubmitted,
        LoginFailure;

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool value = true;

  final GlobalKey<FormState> _formKey = GlobalKey();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final loginBloc = getIt<LoginBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: loginBloc,
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            context.goNamed(RouteNames.home);
          }

          if (state is LoginFailure) {
            Toasts.showErrorToast(
              context,
              message: state.failure?.message ?? '',
            );
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.white,
          body: SafeArea(
            child: Stack(
              children: [
                SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: AppBackButton(),
                      ),
                      const SizedBox(height: 16),
                      Text('Welcome', style: AppTextStyles.s28W600),
                      const SizedBox(height: 4),
                      Text(
                        'Please enter your data to continue',
                        style: AppTextStyles.s15W400.copyWith(
                          color: AppColors.coolSteel,
                        ),
                      ),

                      const SizedBox(height: 120),

                      Form(
                        key: _formKey,
                        child: Column(
                          spacing: 16,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AuthTextField(
                              controller: _usernameController,
                              title: 'Username',
                              subtitle: 'John Doe',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Username is required';
                                }

                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            AuthTextField(
                              controller: _passwordController,
                              title: 'Password',
                              subtitle: '*******',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Password is required';
                                }

                                return null;
                              },
                            ),
                            const SizedBox(height: 30),
                            Align(
                              alignment: Alignment.centerRight,
                              child: InkWell(
                                onTap: () => context.pushNamed(
                                  RouteNames.forgotPassword,
                                ),
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
                            const SizedBox(height: 60),
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
                    ],
                  ),
                ),
              ],
            ),
          ),

          bottomNavigationBar: BlocSelector<LoginBloc, LoginState, bool>(
            selector: (state) => state is LoginLoading,
            builder: (context, state) {
              return AppButton(
                label: 'Login',
                isLoading: state,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    loginBloc.add(
                      LoginSubmitted(
                        username: _usernameController.text.trim(),
                        password: _passwordController.text.trim(),
                      ),
                    );
                  }
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
