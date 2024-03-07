import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:smart_edu_app/helpers/helpers.dart';
import 'package:smart_edu_app/screens/screens.dart';
import 'package:smart_edu_app/services/services.dart';
import 'package:smart_edu_app/widgets/widgets.dart';
 

class ResultScreen extends StatelessWidget {
  static const nombre = 'ResultScreen';
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UserService>(context);
    final email = Provider.of<AuthService>(context).loginResponse!.email; 

    return Scaffold(

      appBar: AppBar(),

      body: SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder(
            future: userService.getUserByEmail(email),
            builder: (context, snapshot) {
              if ( snapshot.hasError) return const LoadingWidget(); 
              if ( !snapshot.hasData ) return const LoadingWidget();
              String id = snapshot.data!;
              
              return ResultScreenBody(id: id);
            },
          ),
        ),
      ),

    );
  }
}


class ResultScreenBody extends StatelessWidget {
  final String id;
  const ResultScreenBody({super.key, required this.id});
  
  @override
  Widget build(BuildContext context) {
    final courseService = Provider.of<CourseService>(context);
    final userService = Provider.of<UserService>(context);

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
    
          Text(
            courseService.answersCount <= 1
              ? 'Lo hiciste bien, el esfuerzo trae recompensas'
              :  courseService.answersCount <= 3
                ? 'Lo hiciste bien, pero puede ser mejor'
                : 'Lo lograste', 
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w600,)
          ),

          // SizedBox(height: 20,),
    
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 10, top: 20),
            height: 300,
            child: Image(
              image: AssetImage(
                courseService.answersCount <= 1
                  ? 'assets/nota_mala.png'
                  :  courseService.answersCount <= 3
                    ? 'assets/nota_media.png'
                    : 'assets/nota_buena.png'                       
                ),
              fit: BoxFit.fill,
              filterQuality: FilterQuality.high,
            ),
          ),
    
          Text('${courseService.answersCount}/4', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w400)),
    
          const SizedBox(height: 30,),
    
          ButtonCustom(
            onPressed: userService.isLoading
              ? null
              :  () async {
                final rspt = await userService.updatedNotaTema(id: id, course: courseService.course!, topic: courseService.topic!,nota: courseService.answersCount );
                await userService.updatedNotasTotales(id: id, course: courseService.course!);
                if (rspt == 'ok') {
                  NotificacionService.showSnackBar('Notas publicadas', Colors.black45);
                  Navigator.pushReplacementNamed(context, CursosScreen.nombre);
                } else {
                  NotificacionService.showSnackBar('Error al publicar notas', Colors.redAccent);
                }
              },
            nombre: 'Publicar notas'
          ),
            
        ],
      ),
    );
    
  }
}