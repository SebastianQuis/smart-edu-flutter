import 'package:flutter/material.dart';
import 'package:smart_edu_app/drawer/drawer_menu.dart';

import 'package:smart_edu_app/widgets/widgets.dart';
 
class PerfilScreen extends StatelessWidget {
  static const nombre = 'PerfilScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(),

      drawer: DrawerMenu(),

      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
        
            SafeArea(child: TitleSubTitle(title: 'Perfil',fontiSize: 26,)),
            
            Container(
              height: 190,
              decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icon_child.png'),
                fit: BoxFit.fitWidth
              )),
              child: Container(),
            ),
        
            TitleSubTitle(
              title: 'Jonathan R',
            ),
            
            Text('Estudiante', style: TextStyle(fontSize: 18),),
            
            SizedBox(height: 10,),
            
            LogoImage(
              height: 180,
            ),

            ButtonCustom(
              paddingH: 20,
              onPressed: () {

              }, 
              nombre: 'Atrás'
            ),

          ],
        ),
      ),
    );
  }
}