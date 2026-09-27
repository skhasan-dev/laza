import 'package:go_router/go_router.dart';
import 'package:laza/core/index.dart';
import 'package:laza/features/authentication/index.dart'
    show AuthView, LoginView, SignupView;
import 'package:laza/features/onboarding/index.dart'
    show SplashView, OnboardingView;

final appRouterConfig = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: RouteNames.splash,
      builder: (_, _) {
        return SplashView();
      },
      routes: [
        customTransitionGoRoute(
          path: '/onboarding',
          name: RouteNames.onboarding,
          pageBuilder: (_, _) => OnboardingView(),
        ),
        customTransitionGoRoute(
          path: '/auth',
          name: RouteNames.auth,
          pageBuilder: (_, _) => AuthView(),
        ),
        customTransitionGoRoute(
          path: '/login',
          name: RouteNames.login,
          pageBuilder: (_, _) => LoginView(),
        ),
        customTransitionGoRoute(
          path: '/signup',
          name: RouteNames.signup,
          pageBuilder: (_, _) => SignupView(),
        ),
      ],
    ),
  ],
);
