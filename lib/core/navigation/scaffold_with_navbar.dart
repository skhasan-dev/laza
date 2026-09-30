import 'package:flutter/material.dart';
import 'package:laza/core/index.dart'
    show BottomNavBar, RouteNames, NavItem, getIt, KeysRepository;
import 'package:go_router/go_router.dart';
import 'package:laza/features/products/index.dart' show AppDrawer;

class ScaffoldWithNavbar extends StatefulWidget {
  const ScaffoldWithNavbar({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  State<ScaffoldWithNavbar> createState() => _ScaffoldWithNavbarState();
}

class _ScaffoldWithNavbarState extends State<ScaffoldWithNavbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: getIt<KeysRepository>().homeScaffoldKey,
      drawer: AppDrawer(),
      body: widget.navigationShell,
      bottomNavigationBar: BottomNavBar(
        currentIndex: widget.navigationShell.currentIndex,
        onTap: (tab) {
          switch (tab) {
            case NavItem.home:
              context.goNamed(RouteNames.home);
              break;
            case NavItem.wishlist:
              context.goNamed(RouteNames.wishlist);
              break;
            case NavItem.orders:
              context.goNamed(RouteNames.orders);
              break;
            case NavItem.cart:
              context.pushNamed(RouteNames.checkout);
              break;
          }
        },
      ),
    );
  }
}
