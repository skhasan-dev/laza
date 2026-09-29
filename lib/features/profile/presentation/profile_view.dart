import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/common/index.dart'
    show AppButton, AppColors, AppTextField, AppTextStyles, CustomAppBar;
import 'package:laza/core/index.dart' show getIt, AuthUser;
import 'package:laza/features/profile/index.dart'
    show
        ProfileBloc,
        ProfileFetched,
        ProfileLoading,
        ProfileState,
        ProfileSubmitted,
        ProfileSuccess;

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final ProfileBloc _profileBloc = getIt();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _profileBloc.add(ProfileFetched());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _profileBloc,
      child: Scaffold(
        appBar: CustomAppBar(
          title: Text(
            'Profile',
            style: AppTextStyles.s17W600.copyWith(color: AppColors.carbonBlack),
          ),
          hideCart: true,
        ),

        body: BlocConsumer<ProfileBloc, ProfileState>(
          listener: (context, state) {
            if (state is ProfileSuccess) {
              final user = state.user;

              _nameController.text = user.username ?? '';
              _emailController.text = user.email ?? '';
              _numberController.text = user.phone ?? '';
              _genderController.text = user.gender ?? '';
              _dobController.text = user.dob?.toIso8601String() ?? '';
            }
          },
          builder: (context, state) {
            if (state is ProfileLoading) {
              return Center(child: CircularProgressIndicator());
            }

            if (state is ProfileSuccess) {
              return SingleChildScrollView(
                padding: EdgeInsets.all(20),
                child: Column(
                  spacing: 16,
                  children: [
                    AppTextField(
                      controller: _nameController,
                      title: 'Username',
                      subtitle: 'Enter your name',
                      enable: false,
                    ),
                    AppTextField(
                      controller: _emailController,
                      title: 'Email',
                      subtitle: 'Enter your email',
                      enable: false,
                    ),
                    AppTextField(
                      controller: _numberController,
                      title: 'Phone Number',
                      subtitle: '+91923749238',
                    ),
                    AppTextField(
                      controller: _genderController,
                      title: 'Gender',
                      subtitle: 'Enter Gender (Male/Female)',
                    ),
                    AppTextField(
                      controller: _dobController,
                      subtitle: 'DOB - 23/4/2023',
                      title: 'Date of Birth',
                    ),
                  ],
                ),
              );
            }

            return SizedBox.shrink();
          },
        ),

        bottomNavigationBar: BlocSelector<ProfileBloc, ProfileState, bool>(
          selector: (state) => state is ProfileLoading,
          builder: (context, isLoading) {
            return AppButton(
              label: 'Save Profile',
              isLoading: isLoading,
              onPressed: () {
                _profileBloc.add(
                  ProfileSubmitted(
                    user: AuthUser(
                      username: _nameController.text.trim(),
                      email: _emailController.text.trim(),
                      phone: _numberController.text.trim(),
                      gender: _genderController.text.trim(),
                      dob: DateTime.now(),
                      updatedAt: DateTime.now(),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
