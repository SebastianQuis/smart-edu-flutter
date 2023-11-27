import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:smart_edu_app/screens/contenido_screen.dart';
import 'package:smart_edu_app/services/course_service.dart';
import 'package:smart_edu_app/widgets/button_custom.dart';
 
class ResultScreen extends StatelessWidget {
  static const nombre = 'ResultScreen';
  const ResultScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    final courseService = Provider.of<CourseService>(context);

    return Scaffold(
      // appBar: AppBar(),

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Container(
            width: double.infinity,
            // color: Colors.red,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.end,
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [

                Text(
                  courseService.answersCount <= 1
                    ? 'Lo hiciste bien, el esfuerzo trae recompensas'
                    :  courseService.answersCount <= 3
                      ? 'Lo hiciste bien, pero puede ser mejor'
                      : 'Lo lograste', 
                  style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w600,)
                ),
          
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 10),
                  height: 300,
                  child: Image(
                    image: AssetImage(
                      courseService.answersCount <= 1
                        ? 'assets/nota_mala.jpg'
                        :  courseService.answersCount <= 3
                          ? 'assets/nota_media.jpg'
                          : 'assets/nota_buena.jpg'                       
                      ),
                    fit: BoxFit.fill,
                    filterQuality: FilterQuality.high,
                  ),
                ),
          
                Text('${courseService.answersCount}/4', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w400)),

                const SizedBox(height: 30,),
          
                ButtonCustom(
                  onPressed: () => Navigator.pushReplacementNamed(context, ContenidoScreen.nombre),
                  nombre: 'Cerrar'
                ),
                  
              ],
            ),
          ),
        ),
      ),
    );
  }
}