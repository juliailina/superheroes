import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationTransitions {
  static CustomTransitionPage<void> bottomToTopTransition(
    BuildContext context,
    GoRouterState state,
    Widget Function(BuildContext, GoRouterState) routeBuilder,
  ) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      child: routeBuilder(context, state),
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          SlideTransition(
        position: animation.drive(
          Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero).chain(
            CurveTween(
              curve: Curves.easeIn,
            ),
          ),
        ),
        child: child,
      ),
    );
  }
}
