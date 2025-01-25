import 'package:go_router/go_router.dart';
import 'package:test_firebase/features/auth/presentation/view/home_auth_view.dart';
import 'package:test_firebase/features/auth/presentation/view/login_view.dart';
import 'package:test_firebase/features/splash/presentation/view/splash_view.dart';

import '../features/auth/presentation/view/register_view.dart';
import '../features/chat/presentation/view/home_view.dart';

class AppRouter {
  static String kLoginView = '/LoginView';
  static String kRegisterView = '/RegisterView';
  static String kHomeView = '/HomeView';
  static String kHomeAuthView = '/HomeAuthView';
  static String kSplashView = '/';
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      name: kSplashView,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: '/LoginView',
      name: kLoginView,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: '/HomeAuthView',
      name: kHomeAuthView,
      builder: (context, state) => const HomeAuthView(),
    ),
    GoRoute(
      name: "HomeView",
      path: kHomeView,
      builder: (context, state) => HomeView(
        email: state.extra != null ? state.extra as String : '',
      ),
    ),
    GoRoute(
      name: "RegisterView",
      path: kRegisterView,
      builder: (context, state) => const RegisterView(),
    ),
  ]);
}
