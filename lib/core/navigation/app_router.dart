import 'package:go_router/go_router.dart';
import 'package:laza/core/index.dart';
import 'package:laza/features/authentication/index.dart'
    show
        AuthView,
        ForgotPasswordView,
        LoginView,
        SignupView,
        OtpView,
        ResetPasswordView;
import 'package:laza/features/onboarding/index.dart'
    show SplashView, OnboardingView;
import 'package:laza/features/products/index.dart' show ProductsView;
import 'package:laza/features/reviews/index.dart' show AddReview;
import 'package:laza/features/wishlist/index.dart' show WishlistView;

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
        customTransitionGoRoute(
          path: '/forgot-password',
          name: RouteNames.forgotPassword,
          pageBuilder: (_, _) => ForgotPasswordView(),
        ),
        customTransitionGoRoute(
          path: '/otp-screen',
          name: RouteNames.otpScreen,
          pageBuilder: (_, _) => OtpView(),
        ),
        customTransitionGoRoute(
          path: '/reset-password',
          name: RouteNames.resetPassword,
          pageBuilder: (_, _) => ResetPasswordView(),
        ),

        customTransitionGoRoute(
          path: '/add-review',
          name: RouteNames.addReview,
          pageBuilder: (_, _) => AddReview(),
        ),

        ///TODO: Change the view names once built
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) =>
              ScaffoldWithNavbar(navigationShell: navigationShell),
          branches: [
            StatefulShellBranch(
              routes: [
                customTransitionGoRoute(
                  path: '/home',
                  name: RouteNames.home,
                  pageBuilder: (_, _) => ProductsView(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                customTransitionGoRoute(
                  path: '/wishlist',
                  name: RouteNames.wishlist,
                  pageBuilder: (_, _) => WishlistView(),
                ),
              ],
            ),
          ],
        ),
        customTransitionGoRoute(
          path: '/checkout',
          name: RouteNames.checkout,
          pageBuilder: (_, _) => LoginView(),
        ),
        customTransitionGoRoute(
          path: '/cards',
          name: RouteNames.addCard,
          pageBuilder: (_, _) => SignupView(),
        ),
      ],
    ),
  ],
);
