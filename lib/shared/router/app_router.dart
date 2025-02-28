import 'package:go_router/go_router.dart';

import '../../feature/home/home_page.dart';
import '../../feature/login/login_page.dart';

mixin AppRouter {
  static final config = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
  ]);
}
