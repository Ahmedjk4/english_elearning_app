import 'package:ealamuni/screens/home_screen/home_screen.dart';
import 'package:ealamuni/screens/learning_screen/learning_screen.dart';
import 'package:ealamuni/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:turn_page_transition/turn_page_transition.dart';

abstract class AppRouter {
  static const String homePath = '/home';
  static const String learningPath = '/learning';

  static final router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: homePath,
        pageBuilder: (context, state) => buildPageWithFadeTransition(
          context: context,
          state: state,
          child: const HomeScreen(),
        ),
      ),
      GoRoute(
        path: homePath,
        pageBuilder: (context, state) => buildPageWithFadeTransition(
          context: context,
          state: state,
          child: const HomeScreen(),
        ),
      ),
      GoRoute(
        path: learningPath,
        pageBuilder: (context, state) => buildPageWithTurnTransition(
          context: context,
          state: state,
          child: LearningScreen(
            items: (state.extra! as Map<String, dynamic>)["items"],
            categoryName:
                (state.extra! as Map<String, dynamic>)["categoryName"],
          ),
        ),
      ),
    ],
  );
}

CustomTransitionPage buildPageWithFadeTransition({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}

CustomTransitionPage buildPageWithTurnTransition({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        TurnPageTransition(
      animation: animation,
      overleafColor: Colors.green,
      child: child,
    ),
  );
}
