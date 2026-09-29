import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:laza/common/index.dart' show AppColors;
import 'package:laza/core/index.dart' show AppStateProvider, RouteNames, getIt;
import 'package:laza/gen/assets.gen.dart' show Assets;

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () async {
      final (isLoggedIn, isProfileCompleted) = await getIt<AppStateProvider>()
          .init();
      if (isLoggedIn) {
        if (isProfileCompleted) {
          context.goNamed(RouteNames.home);
        } else {
          context.goNamed(RouteNames.profile);
        }
      } else {
        context.goNamed(RouteNames.onboarding);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.softPeriWinkle,
      body: Center(child: SvgPicture.asset(Assets.images.logo.path, width: 60)),
    );
  }
}
