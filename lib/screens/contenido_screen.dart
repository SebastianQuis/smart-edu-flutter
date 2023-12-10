import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:smart_edu_app/helpers/helpers.dart';
import 'package:smart_edu_app/screens/screens.dart';
import 'package:smart_edu_app/services/services.dart';
import 'package:smart_edu_app/widgets/widgets.dart';
 
class ContenidoScreen extends StatelessWidget {
  static const nombre = 'ContenidoScreen';
  const ContenidoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final email = authService.loginResponse!.email;

    return Scaffold(
      appBar: AppBar(
        title: Text('Contenido', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.blue[900])),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
        
            const LogoImage(
              height: 190,
            ),
            
            TitleSubTitle(
              title: '¡Hola!, ${getNameEmail(email)} ¿Listo para aprender?',
              fontiSize: 26,
              subtitle: 'Escoge de qué manera quieres aprender hoy',
            ),

            const SizedBox(height: 10,),
        
            const ButtonsBody(),

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
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
          
        ],
      ),
    );
  }
}