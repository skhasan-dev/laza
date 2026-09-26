import 'package:flutter/material.dart';
import 'package:laza/core/index.dart' show appRouterConfig;

class LazaApp extends StatelessWidget {
  const LazaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouterConfig,
      debugShowCheckedModeBanner: false,
      title: 'Laza',
    );
  }
}
