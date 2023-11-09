
import 'package:flutter/material.dart';

import 'package:smart_edu_app/screens/screens.dart';

class AppRoutes {
  static String initialRoute = LoginScreen.nombre;

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};

    appRoutes.addAll( { AvanceScreen.nombre          : ( _ ) => AvanceScreen()} );
    appRoutes.addAll( { ContenidoScreen.nombre       : ( _ ) => ContenidoScreen()} );
    appRoutes.addAll( { CursosScreen.nombre          : ( _ ) => CursosScreen()});
    appRoutes.addAll( { EjerciciosScreen.nombre      : ( _ ) => EjerciciosScreen()});
    appRoutes.addAll( { ForgotPasswordScreen.nombre  : ( _ ) => ForgotPasswordScreen()});
    appRoutes.addAll( { LoginScreen.nombre           : ( _ ) => LoginScreen()});
    appRoutes.addAll( { NewPasswordScreen.nombre     : ( _ ) => NewPasswordScreen()});
    appRoutes.addAll( { PerfilScreen.nombre          : ( _ ) => PerfilScreen()});
    appRoutes.addAll( { ResultScreen.nombre          : ( _ ) => ResultScreen()});
    appRoutes.addAll( { SignUpScreen.nombre          : ( _ ) => SignUpScreen()});
    appRoutes.addAll( { TemaCursoScreen.nombre       : ( _ ) => TemaCursoScreen()});
    appRoutes.addAll( { TermsConditionScreen.nombre  : ( _ ) => TermsConditionScreen()});
    appRoutes.addAll( { HomeScreen.nombre            : ( _ ) => HomeScreen()});

    return appRoutes;
  }

}