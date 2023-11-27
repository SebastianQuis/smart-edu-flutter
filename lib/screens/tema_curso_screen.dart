import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_edu_app/models/tema_response.dart';

import 'package:smart_edu_app/screens/screens.dart';
import 'package:smart_edu_app/services/services.dart';
import 'package:smart_edu_app/widgets/widgets.dart';


class TemaCursoScreen extends StatelessWidget {
  static const nombre = 'TemaCursoScreen';
  const TemaCursoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final courseService = Provider.of<CourseService>(context);

    return Scaffold(
      body: FutureBuilder(
        future: courseService.getCourseTopic(courseService.course!, courseService.topic!),
        builder: (context, snapshot) {
          if ( snapshot.hasError) return const Text('Cargando..'); 
          if ( !snapshot.hasData ) return const Text('Cargando..');
          
          // return TemaCursoBody(listCitas: snapshot.data!);
          // return Text(snapshot.data?.titulo ?? 'ss');
          return TemaCursoBody(temaResponse: snapshot.data!);
        },
      ),
    );
  }
}

 
class TemaCursoBody extends StatelessWidget {
  final TemaResponse temaResponse;

  const TemaCursoBody({required this.temaResponse});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
          
              TitleSubTitle(title: temaResponse.titulo!),
        
              Text(temaResponse.introduccion!,
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16),
              ),

              // SizedBox(height: 10,),

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


          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(150, 40),
                  backgroundColor: Colors.blue[800],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  )
                ),
                onPressed: (){}, 
                child: const Text('Atrás', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),)
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(150, 40),
                  backgroundColor: Colors.blue[800],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  )
                ),
                onPressed: () {
                  courseService.temaResponse = temaResponse;
                  Navigator.pushNamed(context, EjerciciosScreen.nombre);
                }, 
                child: const Text('Siguiente', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),)
              ),

            ],
          ),

          const SizedBox(height: 20,)

        ],
      ),
    );
  }
}