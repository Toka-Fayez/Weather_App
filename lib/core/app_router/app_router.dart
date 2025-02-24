import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/views/auth_choice_view.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/sign_up_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kMain = '/';

  static const kAuthChoiceView = '/AuthChoiceView';
  static const kLoginView = '/LoginView';
  static const kSignUpView = '/SignUpView';
  static const kHomeView = '/HomeView';

  

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kMain,
        builder: (context, state) => SplashView(),
      ),
      GoRoute(
        path: kAuthChoiceView,
        builder: (context, state) => AuthChoiceView(),
      ),
      GoRoute(
        path: kLoginView,
        builder: (context, state) => LoginView(),
      ),
      GoRoute(
        path: kSignUpView,
        builder: (context, state) => SignUpView(),
      ),
        GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
    ],
  );
}
