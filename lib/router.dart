import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:streage/features/age/presentation/screens/age_form.dart';
import 'package:streage/features/age/presentation/screens/home_screen.dart';

final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

class AppRouter {
  static final GoRouter router =
      GoRouter(navigatorKey: navKey, initialLocation: AppRoutes.home, routes: [
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: AppRoutes.form,
      builder: (context, state) => const AgeForm(),
    )
  ]);
}

class AppRoutes {
  static const home = "/";
  static const form = "/new";
}
