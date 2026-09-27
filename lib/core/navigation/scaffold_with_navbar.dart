import 'package:flutter/material.dart';
import 'package:laza/core/index.dart' show BottomNavBar, RouteNames, NavItem;
import 'package:go_router/go_router.dart';

class ScaffoldWithNavbar extends StatefulWidget {
  const ScaffoldWithNavbar({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  State<ScaffoldWithNavbar> createState() => _ScaffoldWithNavbarState();
}

class _ScaffoldWithNavbarState extends State<ScaffoldWithNavbar> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
            case NavItem.cart:
              context.pushNamed(RouteNames.checkout);
              break;
            case NavItem.cards:
              context.pushNamed(RouteNames.payment);
              break;
          }
        },
      ),
    );
  }
}
