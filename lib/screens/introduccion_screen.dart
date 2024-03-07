import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:smart_edu_app/models/models.dart';
import 'package:smart_edu_app/screens/screens.dart';
import 'package:smart_edu_app/services/services.dart';
import 'package:smart_edu_app/widgets/button_custom.dart';


class IntroduccionScreen extends StatelessWidget {
  static const nombre = 'TemaCursoScreen';
  const IntroduccionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final courseService = Provider.of<CourseService>(context);

    return Scaffold(

      body: FutureBuilder(
        future: courseService.getCourseTopic(courseService.course!, courseService.topic!),
        builder: (context, snapshot) {
          if ( snapshot.hasError) return const Center( child: CircularProgressIndicator.adaptive()); 
          if ( !snapshot.hasData ) return const Center( child: CircularProgressIndicator.adaptive());
          return TemaCursoBody(temaResponse: snapshot.data!);
        },
      ),
    );
  }
}

 
class TemaCursoBody extends StatelessWidget {
  final TemaResponse temaResponse;
  const TemaCursoBody({super.key, required this.temaResponse});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Introducción', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          
              Text('${temaResponse.titulo}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700), maxLines: 2),

              Text(temaResponse.introduccion!,
                textAlign: TextAlign.justify,
                style: const TextStyle(fontSize: 16),
              ),
              
              _ImageBodyButton(temaResponse: temaResponse),
        
            ],
          ),
        ),
      ),
    );
  }
}

class _ImageBodyButton extends StatelessWidget {
  final TemaResponse temaResponse;
  const _ImageBodyButton({required this.temaResponse});

  @override
  Widget build(BuildContext context) {
    final courseService = Provider.of<CourseService>(context);
    
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [

          Container(
            height: 250,
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: FadeInImage(
                placeholder: const AssetImage('assets/loading.gif'),
                image: NetworkImage(temaResponse.fotoUrl!),
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover,
              ),
            ),
          ),


          ButtonCustom(
            onPressed: () {
              courseService.temaResponse = temaResponse;
              Navigator.pushNamed(context, EjerciciosScreen.nombre);
            }, 
            nombre: 'Siguiente',
          ),

          const SizedBox(height: 20,)

        ],
      ),
    );
  }
}