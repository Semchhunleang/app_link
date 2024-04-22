import 'package:go_router/go_router.dart';
import 'package:real_estate/presentation/screens/authentication/login_screen.dart';
import 'package:real_estate/presentation/screens/authentication/sing_up_screen.dart';
import 'package:real_estate/presentation/screens/splash/splash_screen.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const SingUpScreen(),
    ),
  ],
);
