import 'package:flutter/material.dart';

import 'package:smart_edu_app/drawer/drawer_menu.dart';
import 'package:smart_edu_app/screens/contenido_screen.dart';
import 'package:smart_edu_app/widgets/widgets.dart';
 
class CursosScreen extends StatelessWidget {
  static const nombre = 'CursosScreen';
  const CursosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(),
      
      drawer: const DrawerMenu(),

      body: const SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
        
            SafeArea(child: TitleSubTitle(title: 'Cursos',fontiSize: 26,)),
        
            LogoImage(
              height: 190,
            ),

            CursosBody(),

          ],
        ),
      ),
    );
  }
}

class CursosBody extends StatelessWidget {
  const CursosBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          _BlocCurso(
            colors: const [
              Color.fromARGB(255, 169, 212, 14),
              Color.fromARGB(255, 117, 171, 25),
              Color.fromARGB(255, 64, 130, 60),
            ], 
            sizeWidth: 0.9, 
            title: 'Razonamiento Matemático',
            onTap: () { 
              Navigator.pushNamed(context, ContenidoScreen.nombre);
            }, 
          ),
          
          _BlocCurso(
            colors: const [
              Color.fromARGB(255, 234, 177, 251),
              Color.fromARGB(255, 196, 116, 247),
              Color.fromARGB(255, 187, 100, 247),
            ], 
            sizeWidth: 0.85, 
            title: 'Literatura española',
            onTap: () { 

            }, 
          ),
          
          _BlocCurso(
            colors: const [
              Color.fromARGB(255, 255, 166, 130),
              Color.fromARGB(255, 201, 143, 92),
              Color.fromARGB(255, 170, 130, 67),
            ], 
            sizeWidth: 0.8, 
            title: 'Biologia',
            onTap: () { 

            }, 
          ),

          

        ],
      ),
    );
  }
}

class _BlocCurso extends StatelessWidget {
  final Function() onTap;
  final double sizeWidth;
  final String title;
  final List<Color> colors;

  const _BlocCurso({
    required this.onTap,
    required this.sizeWidth,
    required this.title,
    required this.colors
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(right: 10),
        alignment: Alignment.centerRight,
        width: size.width * sizeWidth,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
          gradient: LinearGradient(
            colors: colors,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          )
        ),
        child: Text(title, style: const TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.w600),),
      ),
    );
  }
}