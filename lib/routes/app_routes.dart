
import 'package:flutter/material.dart';

import 'package:smart_edu_app/screens/screens.dart';

class AppRoutes {
  static String initialRoute = LoginScreen.nombre;

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};

    appRoutes.addAll( { AvanceScreen.nombre          : ( _ ) => const AvanceScreen()} );
    appRoutes.addAll( { ContenidoScreen.nombre       : ( _ ) => const ContenidoScreen()} );
    appRoutes.addAll( { CursosScreen.nombre          : ( _ ) => const CursosScreen()});
    appRoutes.addAll( { EjerciciosScreen.nombre      : ( _ ) => const EjerciciosScreen()});
    appRoutes.addAll( { ForgotPasswordScreen.nombre  : ( _ ) => const ForgotPasswordScreen()});
    appRoutes.addAll( { LoginScreen.nombre           : ( _ ) => const LoginScreen()});
    appRoutes.addAll( { PerfilScreen.nombre          : ( _ ) => const PerfilScreen()});
    appRoutes.addAll( { ResultScreen.nombre          : ( _ ) => const ResultScreen()});
    appRoutes.addAll( { SignUpScreen.nombre          : ( _ ) => const SignUpScreen()});
    appRoutes.addAll( { IntroduccionScreen.nombre       : ( _ ) => const IntroduccionScreen()});
    appRoutes.addAll( { HomeScreen.nombre            : ( _ ) => const HomeScreen()});

    return appRoutes;
  }

}