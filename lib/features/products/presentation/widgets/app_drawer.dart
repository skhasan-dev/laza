import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:laza/common/index.dart';
import 'package:laza/core/index.dart'
    show AppStateProvider, KeysRepository, RouteNames, getIt;
import 'package:laza/gen/assets.gen.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({super.key});

  final appStateProvider = getIt<AppStateProvider>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  getIt<KeysRepository>().homeScaffoldKey.currentState
                      ?.openDrawer();
                },
                child: Container(
                  height: 45,
                  width: 45,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.platinum,
                  ),
                  child: Transform.rotate(
                    angle: pi / 2,
                    child: SvgPicture.asset(
                      Assets.icons.openMenu.path,
                      height: 25,
                      width: 25,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () => context.pushNamed(RouteNames.profile),
                child: Row(
                  spacing: 15,
                  children: [
                    CircleAvatar(
                      radius: 22,
                      backgroundImage: NetworkImage(
                        'https://picsum.photos/100',
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          appStateProvider.user?.username ?? '-',
                          style: AppTextStyles.s17W500.copyWith(
                            color: AppColors.carbonBlack,
                          ),
                        ),
                        Text(
                          appStateProvider.emailVerified
                              ? 'Profile verified'
                              : 'Not verified',
                          style: AppTextStyles.s13W400.copyWith(
                            color: AppColors.coolSteel,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              _buildRow(
                Assets.icons.bag.path,
                'Order',
                () => navigate(context, RouteNames.checkout),
              ),
              _buildRow(
                Assets.icons.wallet.path,
                'My Cards',
                () => navigate(context, RouteNames.addCard),
              ),
              _buildRow(
                Assets.icons.heart.path,
                'Wishlist',
                () => navigate(context, RouteNames.wishlist),
              ),
              Spacer(),
              _buildRow(
                Assets.icons.logout.path,
                'Logout',
                titleColor: AppColors.cinnabar,
                () async {
                  await getIt<FirebaseAuth>().signOut();
                  context.goNamed(RouteNames.login);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void navigate(BuildContext context, String path) {
    getIt<KeysRepository>().homeScaffoldKey.currentState?.closeDrawer();
    context.goNamed(path);
  }

  Widget _buildRow(
    String path,
    String title,
    VoidCallback onTap, {
    Color? titleColor,
  }) {
    return ListTile(
      leading: SvgPicture.asset(path),
      contentPadding: EdgeInsets.zero,
      onTap: onTap,
      title: Text(
        title,
        style: AppTextStyles.s15W400.copyWith(
          color: titleColor ?? AppColors.carbonBlack,
        ),
      ),
    );
  }
}
