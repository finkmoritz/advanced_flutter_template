import 'package:advanced_flutter_template/pages/home_page.dart';
import 'package:advanced_flutter_template/pages/settings_page.dart';
import 'package:go_router/go_router.dart';

final myRouterConfig = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => const HomePage(),
    ),
    GoRoute(
      path: '/settings',
      builder: (_, __) => const SettingsPage(),
    ),
  ],
);
