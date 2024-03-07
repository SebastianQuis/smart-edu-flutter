import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:smart_edu_app/drawer/drawer_menu.dart';
import 'package:smart_edu_app/services/services.dart';
import 'package:smart_edu_app/widgets/widgets.dart';
import 'package:smart_edu_app/screens/screens.dart';
 
class CursosScreen extends StatelessWidget {
  static const nombre = 'CursosScreen';
  const CursosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xfff7f7f7),

      appBar: AppBar(
        title: const Text('Cursos', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      
      drawer: const DrawerMenu(),

      body: const SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
              
            SizedBox(
              height: 20,
            ),

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
    final courseService = Provider.of<CourseService>(context);

    return Container(
      // ignore: prefer_const_constructors
      padding: EdgeInsets.only(top: 20),
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
              courseService.course = 'razonamientoMatematico';
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
              courseService.course = 'literatura';
              Navigator.pushNamed(context, ContenidoScreen.nombre);
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
              courseService.course = 'biologia';
              Navigator.pushNamed(context, ContenidoScreen.nombre);
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