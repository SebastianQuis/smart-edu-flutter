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
        title: const Text('Inicio', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),

      drawer: const DrawerMenu(),

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            
            const SizedBox(height: 10,),

            const LogoImage(height: 220,),
        
            TitleSubTitle(
              title: 'Bienvenido ${getNameEmail(email)}',
            ),
            
            const Text('¿Listo para aprender?'),
            
          ],
        ),
      ),
    );
  }
}