import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import 'package:smart_edu_app/helpers/helpers.dart';
import 'package:smart_edu_app/routes/app_routes.dart';
import 'package:smart_edu_app/services/services.dart';
import 'package:smart_edu_app/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  
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
      theme: AppTheme.lightTheme,
      routes: AppRoutes.getAppRoutes(),
      initialRoute: AppRoutes.initialRoute,
      // home: NewPasswordScreen(),
    );
  }
}
