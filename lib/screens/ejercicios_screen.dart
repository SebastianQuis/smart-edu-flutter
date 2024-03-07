import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:smart_edu_app/models/models.dart';
import 'package:smart_edu_app/screens/screens.dart';
import 'package:smart_edu_app/services/services.dart';
import 'package:smart_edu_app/theme/app_theme.dart';
import 'package:smart_edu_app/widgets/widgets.dart';

class EjerciciosScreen extends StatelessWidget {
  static const nombre = 'EjerciciosScreen';
  const EjerciciosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final courseService = Provider.of<CourseService>(context);
    final listEjercicios = courseService.temaResponse?.obtenerEjerciciosAleatorios();
    
    if (listEjercicios == null) return const CircularProgressIndicator.adaptive();   
    List<int> answersCounts = List<int>.filled(4, 0);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicios', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      
      body: Column(
        children: [

          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return _OneExercise(
                  ejercicio: listEjercicios[index],
                  index: index,
                  onAnswerChanged: (int count) {
                    answersCounts[index] = count; 
                    courseService.answersCount = answersCounts.reduce((valor1, valor2) => valor1 + valor2);
                  },
                );
              },
            ),
          ),

          ButtonCustom(
            paddingH: 20,
            onPressed: () => Navigator.pushNamed(context,ResultScreen.nombre),  
            nombre: 'Enviar'
          ),

        ],
      ),
    );
  }
}

class _OneExercise extends StatefulWidget {
  final Ejercicio ejercicio;
  final int index;
  final ValueChanged<int> onAnswerChanged;

  const _OneExercise({
    required this.ejercicio,
    required this.index,
    required this.onAnswerChanged,
  });
  
  @override
  State<_OneExercise> createState() => _OneExerciseState();
}

class _OneExerciseState extends State<_OneExercise> {
  int selectedCheckBox = -1;
  int answersCount = 0;

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
              children: [
                TextSpan(
                  text: '${widget.index + 1} ',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                TextSpan(
                  text: widget.ejercicio.enunciado,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ],
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (var i = 0; i < widget.ejercicio.opciones.length; i++)
                CheckboxListTile(
                  title: Text(
                    widget.ejercicio.opciones[i].texto, 
                    style: TextStyle(
                      color: selectedCheckBox == i 
                        ? Colors.black87
                        : Colors.black45, 
                      fontWeight:selectedCheckBox == i 
                        ? FontWeight.w600 
                        : FontWeight.normal  
                    ),
                  ),
                  value: selectedCheckBox == i,
                  onChanged: (value) {
                    if (value == null) return;
                    selectedCheckBox = i;
                    int correctIndex = widget.ejercicio.opciones.indexWhere((opcion) => opcion.respuesta);

                    if (selectedCheckBox == correctIndex && value == true) {
                      ++answersCount;
                    } else if ( answersCount == 0) {
                      answersCount = 0;
                    } else {
                      --answersCount;
                    }
                    widget.onAnswerChanged(answersCount);
                    selectedCheckBox = value ? i : -1;
                    setState(() {});
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                  activeColor: AppTheme.color4,
                ),
            ],
          ),      
        ],
      ),
    );
  }
}