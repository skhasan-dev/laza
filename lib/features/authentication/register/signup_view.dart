import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart' hide BackButton;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:laza/common/index.dart'
    show AppBackButton, AppButton, AppColors, AppTextStyles;
import 'package:laza/core/index.dart' show RouteNames;
import 'package:laza/core/services/index.dart';
import 'package:laza/features/authentication/index.dart'
    show
        AuthTextField,
        CheckedUsername,
        RegisterBloc,
        RegisterFailure,
        RegisterLoading,
        RegisterState,
        RegisterSubmitted,
        RegisterSuccess,
        RegisterUsernameCheckedSuccess;

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  bool value = true;

  final GlobalKey<FormState> _formKey = GlobalKey();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final registerBloc = getIt<RegisterBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: registerBloc,
      child: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            context.goNamed(RouteNames.home);
          }

          if (state is RegisterFailure) {}
        },
        child: Scaffold(
          backgroundColor: AppColors.white,
          body: SafeArea(
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
                  Text('Sign Up', style: AppTextStyles.s28W600),
                  const SizedBox(height: 80),
                  Form(
                    key: _formKey,
                    child: Column(
                      spacing: 16,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BlocSelector<RegisterBloc, RegisterState, bool>(
                          selector: (state) =>
                              state is RegisterUsernameCheckedSuccess
                              ? state.notAvailable
                              : false,
                          builder: (context, notAvailable) {
                            return AuthTextField(
                              controller: _usernameController,
                              title: 'Username',
                              subtitle: 'John Doe',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Username is required';
                                }

                                if (value.length < 5) {
                                  return 'Username should be more than 5 characters';
                                }

                                if (notAvailable) {
                                  return 'Username already taken';
                                }

                                return null;
                              },
                              onChanged: (value) {
                                EasyDebounce.debounce(
                                  'check-username',
                                  Duration(milliseconds: 400),
                                  () {
                                    registerBloc.add(
                                      CheckedUsername(
                                        username: (value ?? '').trim(),
                                      ),
                                    );
                                  },
                                );
                              },
                            );
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

                            final passwordRegex = RegExp(
                              r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
                            );

                            if (!passwordRegex.hasMatch(value)) {
                              return 'Password must contain 8+ characters, uppercase, lowercase, number and special character';
                            }

                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        AuthTextField(
                          controller: _emailController,
                          title: 'Email Address',
                          subtitle: 'bill.sanders@example.com',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Email is required';
                            }

                            final emailRegex = RegExp(
                              r'^[\w\.-]+@[\w\.-]+\.\w+$',
                            );

                            if (!emailRegex.hasMatch(value.trim())) {
                              return 'Enter a valid email address';
                            }

                            return null;
                          },
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
                  ),
                ],
              ),
            ),
          ),

          resizeToAvoidBottomInset: true,
          bottomNavigationBar: BlocSelector<RegisterBloc, RegisterState, bool>(
            selector: (state) => state is RegisterLoading,
            builder: (BuildContext context, bool state) {
              return AppButton(
                label: 'Sign Up',
                isLoading: state,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    registerBloc.add(
                      RegisterSubmitted(
                        username: _usernameController.text.trim(),
                        email: _emailController.text.trim(),
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
