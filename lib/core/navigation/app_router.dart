import 'package:flutter/material.dart';
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
import 'package:laza/features/cart/index.dart'
    show AddressView, CheckoutSuccessfulView, CheckoutView, PaymentCardView;
import 'package:laza/features/onboarding/index.dart'
    show SplashView, OnboardingView;
import 'package:laza/features/products/index.dart'
    show
        Category,
        ProductsDetailView,
        ProductsView,
        CategoryProductsView,
        ProductsSearchView;
import 'package:laza/features/reviews/index.dart' show AddReview, ReviewsView;
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
          path: '/review',
          name: RouteNames.review,
          pageBuilder: (_, state) {
            final args = state.extra as Map<String, dynamic>?;
            if (args == null) return SizedBox();

            return ReviewsView(id: args['id'], reviews: args['reviews']);
          },
        ),

        customTransitionGoRoute(
          path: '/add-review',
          name: RouteNames.addReview,
          pageBuilder: (_, _) => AddReview(),
        ),

        customTransitionGoRoute(
          path: '/product-detail',
          name: RouteNames.productDetail,
          pageBuilder: (_, state) {
            final id = state.extra as String?;
            if (id == null) return SizedBox();
            return ProductsDetailView(uid: id);
          },
        ),

        customTransitionGoRoute(
          path: '/product-by-category',
          name: RouteNames.productByCategory,
          pageBuilder: (_, state) {
            final category = state.extra as Category?;
            if (category == null) return SizedBox();
            return CategoryProductsView(category: category);
          },
        ),

        customTransitionGoRoute(
          path: '/search-products',
          name: RouteNames.searchProducts,
          pageBuilder: (_, _) => ProductsSearchView(),
        ),

        customTransitionGoRoute(
          path: '/address',
          name: RouteNames.address,
          pageBuilder: (_, _) => AddressView(),
        ),

        customTransitionGoRoute(
          path: '/add-card',
          name: RouteNames.addCard,
          pageBuilder: (_, _) => PaymentCardView(),
        ),

        customTransitionGoRoute(
          path: '/order-confirmed',
          name: RouteNames.orderConfirmed,
          pageBuilder: (_, _) => CheckoutSuccessfulView(),
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
          pageBuilder: (_, _) => CheckoutView(),
        ),
        customTransitionGoRoute(
          path: '/cards',
          name: RouteNames.payment,
          pageBuilder: (_, _) => SignupView(),
        ),
      ],
    ),
  ],
);
