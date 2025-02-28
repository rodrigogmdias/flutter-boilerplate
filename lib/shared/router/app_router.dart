import 'package:go_router/go_router.dart';

import '../../feature/forget_password/forget_password_page.dart';
import '../../feature/home/home_page.dart';
import '../../feature/login/login_page.dart';
import '../../feature/sign_up/sign_up_page.dart';

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
    GoRoute(
      path: '/forget-password',
      builder: (context, state) => const ForgetPasswordPage(),
    ),
    GoRoute(
      path: '/sign-up',
      builder: (context, state) => const SignUpPage(),
    ),
  ]);
}
