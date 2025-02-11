
import 'package:go_router/go_router.dart';

import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
 static const kMain = '/';

 // static const kHomeView = '/LoginView';


  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kMain,
        builder: (context, state) => const SplashView(),
      ),
    /*  GoRoute(
        path: kSearchView,
        builder: (context, state) => const LoginView(),
      ),*/
     
    ],
  );
}