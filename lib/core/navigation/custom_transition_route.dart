import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

GoRoute customTransitionGoRoute({
  GlobalKey<NavigatorState>? parentNavigatorKey,
  String? name,
  required String path,
  required Widget Function(BuildContext context, GoRouterState state)
  pageBuilder,
  List<RouteBase> routes = const [],
}) {
  return GoRoute(
    name: name,
    path: path,
    parentNavigatorKey: parentNavigatorKey,
    pageBuilder: (context, state) => CustomTransitionPage<void>(
      key: state.pageKey,
      child: pageBuilder(context, state),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeOut).animate(animation),
          child: child,
        );
      },
    ),
    routes: routes,
  );
}
