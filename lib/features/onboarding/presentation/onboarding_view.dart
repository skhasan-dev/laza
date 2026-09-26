import 'package:flutter/material.dart';
import 'package:laza/common/index.dart' show AppColors, AppTextStyles;
import 'package:laza/features/onboarding/index.dart' show AppButton;
import 'package:laza/gen/assets.gen.dart' show Assets;

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.softPeriWinkle,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.wisteria, AppColors.softPeriWinkle],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Image.asset(Assets.images.youngMan.path, fit: BoxFit.cover),
          ),
          Positioned(
            right: 15,
            left: 15,
            bottom: 15,
            child: Container(
              padding: EdgeInsets.fromLTRB(16, 25, 16, 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Look Good, Feel Good',
                    style: AppTextStyles.s25W600.copyWith(
                      color: AppColors.carbonBlack,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Create your individual & unique style and look amazing everyday.',
                    style: AppTextStyles.s15W400.copyWith(
                      color: AppColors.coolSteel,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    spacing: 10,
                    children: [
                      AppButton(
                        label: Text(
                          'Men',
                          style: AppTextStyles.s17W500.copyWith(
                            color: AppColors.coolSteel,
                          ),
                        ),
                        onPressed: () {},
                        backgroundColor: AppColors.platinum,
                      ),
                      AppButton(
                        label: Text(
                          'Women',
                          style: AppTextStyles.s17W500.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                        onPressed: () {},
                        backgroundColor: AppColors.softPeriWinkle,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Skip',
                      style: AppTextStyles.s17W500.copyWith(
                        color: AppColors.coolSteel,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
