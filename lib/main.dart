import 'package:flutter/material.dart';

import 'core/app_router/app_router.dart';
import 'core/presentation/app_roote.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Weather_App());
}

class Weather_App extends StatelessWidget {
  const Weather_App({super.key});

  @override
  Widget build(BuildContext context) {
    return AppRoot(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.transparent, // شفافية الخلفية
        ),
      ),
    );
  }
}
