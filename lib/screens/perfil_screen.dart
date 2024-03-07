import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:smart_edu_app/drawer/drawer_menu.dart';
import 'package:smart_edu_app/helpers/helpers.dart';
import 'package:smart_edu_app/services/services.dart';
import 'package:smart_edu_app/widgets/widgets.dart';


class PerfilScreen extends StatelessWidget {
  static const nombre = 'PerfilScreen';
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final email = authService.loginResponse!.email;

    return Scaffold(

      appBar: AppBar(
        title: const Text('Perfil', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),

      drawer: const DrawerMenu(),

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            
            const SizedBox(height: 20,),
        
            Container(
              height: 190,
              decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icon_child.png'),
                fit: BoxFit.fitWidth,
                // colorFilter:  Color(0xfff7f7f7f)
              )),
              child: Container(),
            ),
        
            TitleSubTitle(
              title: getNameEmail(email),
            ),
            
            const Text('Estudiante', style: TextStyle(fontSize: 18),),
            
            const SizedBox(height: 10,),
            
            const LogoImage(
              height: 400,
            ),
        
          ],
        ),
      ),
    );
  }
}