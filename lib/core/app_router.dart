import 'package:go_router/go_router.dart';
import 'package:test_firebase/features/auth/presentation/view/home_auth_view.dart';
import 'package:test_firebase/features/auth/presentation/view/login_view.dart';
import 'package:test_firebase/features/auth/presentation/view/register_view.dart';
import 'package:test_firebase/features/chat/presentation/view/home_view.dart';
import 'package:test_firebase/features/splash/presentation/view/splash_view.dart';

class AppRouter {
  static String kLoginView = '/LoginView';
  static String kRegisterView = '/RegisterView';
  static String kHomeView = '/HomeView';
  static String kHomeAuthView = '/HomeAuthView';
  static String kSplashView = '/';

  static final router = GoRouter(
    initialLocation: kSplashView,
    routes: [
      GoRoute(
        path: kSplashView,
        name: 'SplashView',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kLoginView,
        name: 'LoginView',
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: kHomeAuthView,
        name: 'HomeAuthView',
        builder: (context, state) => const HomeAuthView(),
      ),
      GoRoute(
        path: kHomeView,
        name: 'HomeView',
        builder: (context, state) => HomeView(
          email: state.extra != null ? state.extra as String : '',
        ),
      ),
      GoRoute(
        path: kRegisterView,
        name: 'RegisterView',
        builder: (context, state) => const RegisterView(),
      ),
    ],
  );
}
