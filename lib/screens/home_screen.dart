import 'package:flutter/material.dart';
import 'package:smart_edu_app/drawer/drawer_menu.dart';

import 'package:smart_edu_app/widgets/widgets.dart';
 
class HomeScreen extends StatelessWidget {
 
  static const nombre = 'HomeScreenScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),

      drawer: DrawerMenu(),

      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
        
            SafeArea(child: LogoImage(height: 220,)),
        
            TitleSubTitle(
              title: 'Bienvenido Jonathan',
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