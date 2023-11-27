import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:smart_edu_app/drawer/drawer_menu.dart';
import 'package:smart_edu_app/screens/screens.dart';
import 'package:smart_edu_app/services/services.dart';
import 'package:smart_edu_app/widgets/widgets.dart';
 
class ContenidoScreen extends StatelessWidget {
  static const nombre = 'ContenidoScreen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(

      // appBar: AppBar(),
      
      drawer: DrawerMenu(),

      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
        
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
    final courseService = Provider.of<CourseService>(context);

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      // color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          const Text('Contenido', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),

          ButtonCustom(
            onPressed: () {
              courseService.topic = 'tema1';
              Navigator.pushNamed(context, TemaCursoScreen.nombre);
            }, 
            nombre: 'Tema 1'
          ),

          ButtonCustom(
            onPressed: () {
              courseService.topic = 'tema2';
              Navigator.pushNamed(context, TemaCursoScreen.nombre);
            }, 
            nombre: 'Tema 2'
          ),
          
          ButtonCustom(
            onPressed: () {
              courseService.topic = 'tema3';
              Navigator.pushNamed(context, TemaCursoScreen.nombre);
            }, 
            nombre: 'Tema 3'
          ),
          
          ButtonCustom(
            onPressed: () {
              courseService.topic = 'tema4';
              Navigator.pushNamed(context, TemaCursoScreen.nombre);
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