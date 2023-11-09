import 'package:flutter/material.dart';
import 'package:smart_edu_app/drawer/drawer_menu.dart';
import 'package:smart_edu_app/screens/screens.dart';
import 'package:smart_edu_app/widgets/widgets.dart';
 
class ContenidoScreen extends StatelessWidget {
  static const nombre = 'ContenidoScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(),
      
      drawer: DrawerMenu(),

      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
        
            LogoImage(
              height: 190,
            ),
            
            TitleSubTitle(
              title: '¡Hola!, Jonathan ¿Listo para aprender?',
              fontiSize: 26,
              subtitle: 'Escoge de qué manera quieres aprender hoy',
            ),

            SizedBox(height: 10,),
        
            ButtonsBody(),

          ],
        ),
      ),
    );
  }
}

class ButtonsBody extends StatelessWidget {
  const ButtonsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20),
      // color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Text('Contenido', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),

          ButtonCustom(
            onPressed: () {
              Navigator.pushNamed(context, TemaCursoScreen.nombre);
            }, 
            nombre: 'Tema 1'
          ),

          ButtonCustom(
            onPressed: () {
              
            }, 
            nombre: 'Tema 2'
          ),
          
          ButtonCustom(
            onPressed: () {
              
            }, 
            nombre: 'Tema 3'
          ),
          
          ButtonCustom(
            onPressed: () {
              
            }, 
            nombre: 'Tema 4'
          ),
          
          
          ButtonCustom(
            paddingH: 100,
            onPressed: () {
              
            }, 
            nombre: 'Atrás'
          ),
          
        ],
      ),
    );
  }
}