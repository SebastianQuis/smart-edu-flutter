import 'package:flutter/material.dart';

import 'package:smart_edu_app/screens/screens.dart';

class EjerciciosScreen extends StatelessWidget {
  static const nombre = 'EjerciciosScreen';
  const EjerciciosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

      appBar: AppBar(),

      body: Column(
        children: [
      
          const Text('Ejercicios', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),   
          
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return _Ejercicio();
              },
            ),
          ),

          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
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
                  onPressed: (){
                    Navigator.pushNamed(context, TemaCursoScreen.nombre);
                  }, 
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
                  onPressed: (){
                    Navigator.pushNamed(context, ResultScreen.nombre);
                  }, 
                  child: const Text('Enviar', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),)
                ),
          
              ],
            ),
          )

        ],
      ),

    );
  }
}

class _Ejercicio extends StatefulWidget {
  @override
  State<_Ejercicio> createState() => _EjercicioState();
}

class _EjercicioState extends State<_Ejercicio> {
  int selectedCheckBox = -1;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Text('Ejercicio 01', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
          
          const Text('De cinco futbolistas, donde ninguno tiene la misma cantidad de goles convertidos, se sabe que Claudio tiene dos goles más que Abel, Flavio tiene dos goles más que Roberto, pero uno menos que Abel y Andrés más goles que Roberto, pero menos que Abel. ¿Cuántos goles menos que Claudio tiene Andrés?',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 16),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 120,
                child: CheckboxListTile(
                  title: const Text('1'),
                  value: selectedCheckBox == 0,
                  onChanged: (value) {
                    selectedCheckBox = 0;
                    setState(() {});
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),
              ),
              SizedBox(
                width: 120,
                child: CheckboxListTile(
                  title: const Text('2'),
                  value: selectedCheckBox == 1,
                  onChanged: (value) {
                    selectedCheckBox = 1;
                    setState(() {});
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),
              ),
              SizedBox(
                width: 120,
                child: CheckboxListTile(
                  title: const Text('3'),
                  value: selectedCheckBox == 2,
                  onChanged: (value) {
                    selectedCheckBox = 2;
                    setState(() {});
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),
              ),
            ],
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 120,
                child: CheckboxListTile(
                  title: const Text('4'),
                  value: selectedCheckBox == 3,
                  onChanged: (value) {
                    selectedCheckBox = 3;
                    setState(() {});
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),
              ),
              SizedBox(
                width: 120,
                child: CheckboxListTile(
                  title: const Text('5'),
                  value: selectedCheckBox == 4,
                  onChanged: (value) {
                    selectedCheckBox = 4;
                    setState(() {});
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),
              ),
            ],
          ),


        ],
      ),
    );
  }
}