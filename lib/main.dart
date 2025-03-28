import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'core/app_router/app_router.dart';
import 'core/utilies/app_roote.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/services/custom_bloc_observer.dart';
import 'core/services/get_it_service.dart';
import 'firebase_options.dart';

//test link 'video' task1
//https://drive.google.com/file/d/1CpBDlx7RxJnkLIwUKRX7lXBk0CmI0SUi/view?usp=sharing
//test link task2 
//https://drive.google.com/file/d/1CpBDlx7RxJnkLIwUKRX7lXBk0CmI0SUi/view?usp=sharing
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer= CustomBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupGetit();
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
