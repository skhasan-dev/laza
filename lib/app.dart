import 'package:flutter/material.dart';
import 'package:laza/common/index.dart';
import 'package:laza/core/index.dart'
    show KeysRepository, appRouterConfig, getIt;

class LazaApp extends StatelessWidget {
  const LazaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouterConfig,
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context)
          .copyWith(scaffoldBackgroundColor: AppColors.white),
      title: 'Laza',
      builder: (context, child) {
        return Overlay(
          key: getIt<KeysRepository>().overlayKey,
          initialEntries: [OverlayEntry(builder: (ctx) => child!)],
        );
      },
    );
  }
}
