import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:smart_edu_app/drawer/drawer_menu.dart';
import 'package:smart_edu_app/helpers/helpers.dart';
import 'package:smart_edu_app/services/services.dart';
import 'package:smart_edu_app/widgets/widgets.dart';
 
class HomeScreen extends StatelessWidget {
  static const nombre = 'HomeScreenScreen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final email = authService.loginResponse!.email;
    
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),

      drawer: const DrawerMenu(),

      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
        
            SafeArea(child: LogoImage(height: 220,)),
        
            TitleSubTitle(
              title: 'Bienvenido ${getNameEmail(email)}',
            ),
            
            Text('¿Listo para aprender?'),

            // _FormBody(),

            // SignUpForgotPassword(),

          ],
        ),
      ),
    );
  }
}