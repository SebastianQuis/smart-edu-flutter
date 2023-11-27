import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:smart_edu_app/helpers/helpers.dart';
import 'package:smart_edu_app/routes/app_routes.dart';
import 'package:smart_edu_app/services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Preferences.init();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService(),),
        ChangeNotifierProvider(create: (context) => CourseService(),),
        ChangeNotifierProvider(create: (context) => CourseService(),),
        ChangeNotifierProvider(create: (context) => UserService(),),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: NotificacionService.messengerKey,
      debugShowCheckedModeBanner: false,
      title: 'Smart Edu App',
      theme: ThemeData(
        useMaterial3: true,
      ),
      routes: AppRoutes.getAppRoutes(),
      initialRoute: AppRoutes.initialRoute,
      // home: NewPasswordScreen(),
    );
  }
}