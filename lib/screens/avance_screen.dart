import 'package:flutter/material.dart';

import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';

import 'package:smart_edu_app/drawer/drawer_menu.dart';
import 'package:smart_edu_app/models/models.dart';
import 'package:smart_edu_app/services/services.dart';
import 'package:smart_edu_app/widgets/widgets.dart';


class AvanceScreen extends StatelessWidget {
  static const nombre = 'AvanceScreen';
  const AvanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UserService>(context);
    final email = Provider.of<AuthService>(context).loginResponse!.email;
    
    return Scaffold(
    
      appBar: AppBar(
        title: const Text('Avance', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),

      drawer: const DrawerMenu(),

      body: SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder(
            future: userService.getUserByEmail(email),
            builder: (context, snapshot) {
              if ( snapshot.hasError) return const LoadingWidget();
              if ( !snapshot.hasData ) return const LoadingWidget();              
              return _AvanceScreenBody(user: userService.userLogged!);
            },
          ),
        ),
      ),
      
    );
  }
}


 
class _AvanceScreenBody extends StatelessWidget {
  final UserModel user;
  const _AvanceScreenBody({
    required this.user
  });
  
  @override
  Widget build(BuildContext context) {
    final cursos = user.avanceCursos;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      
          TitleSubTitle(title: 'Rendimiento de los cursos'),
          
          Column(
            children: [
              _Grafico(advance: cursos.razonamientoMatematico.nota!.toDouble(),course: 'Razonamiento Matemático', color: Colors.green,),
              const Divider(),
              _Grafico(advance: cursos.literatura.nota!.toDouble(),course: 'Literatura Española', color: Colors.red),
              const Divider(),
              _Grafico(advance: cursos.biologia.nota!.toDouble(),course: 'Biologia', color: Colors.indigo),
            ],
          ),

        ],
      ),
    );
  }
}


class _Grafico extends StatelessWidget {
  final String course;
  final double advance;
  final Color color;

  const _Grafico({required this.course, required this.advance, required this.color});

  @override
  Widget build(BuildContext context) {
    double notaFinal = advance / 16 * 100;

    final dataMap = <String, double>{
      course: notaFinal,
      "Falta": 100 - notaFinal,
    };

    final List<Color> colorList = [
      color,
      Colors.grey
    ];

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      height: 200,
      child: PieChart(
        colorList: colorList,
        dataMap:dataMap,
        animationDuration: const Duration(seconds: 2),
        // chartRadius: MediaQuery.of(context).size.width / 2,
        legendOptions: const LegendOptions(
          showLegendsInRow: true,
          legendPosition: LegendPosition.top,
          legendTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14
          ),
        ),
        chartValuesOptions: const ChartValuesOptions(
          showChartValueBackground: false,
          showChartValues: true,
          showChartValuesInPercentage: true,
          showChartValuesOutside: false,
          decimalPlaces: 0,
          chartValueStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          )
        ),
      ),
      
    );
  }
}