import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:smart_edu_app/drawer/drawer_menu.dart';
import 'package:smart_edu_app/widgets/title_subtitle.dart';
 
class AvanceScreen extends StatelessWidget {
  static const nombre = 'AvanceScreen';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(),

      drawer: const DrawerMenu(),

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          
              const SafeArea(child: TitleSubTitle(title: 'Avance', fontiSize: 26,)),
        
              const Text('Rendimiento de los cursos', style: TextStyle(fontSize: 18, color: Colors.grey),),

              Column(
                children: [
                  _Grafico(advance: 64,course: 'Razonamiento Matemático', color: Colors.green,),
                  const Divider(),
                  _Grafico(advance: 40,course: 'Literatura Española', color: Colors.red),
                  const Divider(),
                  _Grafico(advance: 90,course: 'Biologia', color: Colors.indigo),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}


class _Grafico extends StatelessWidget {
  final String course;
  final double advance;
  final Color color;

  _Grafico({super.key, required this.course, required this.advance, required this.color});

  @override
  Widget build(BuildContext context) {
    
    double falta = 100 - advance;
    
    final dataMap = <String, double>{
      course: advance,
      "Falta": falta,
      // "Historia": 2,
    };

    final List<Color> colorList = [
      color,
      Colors.grey
    ];

    return Container(
      // color: Colors.red,
      // margin: EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      height: 200,
      child: PieChart(
        colorList: colorList,
        dataMap:dataMap,
        animationDuration: const Duration(seconds: 2),
        chartRadius: MediaQuery.of(context).size.width / 2,
        // chartType: ChartType.,
        legendOptions: const LegendOptions(
          showLegendsInRow: true,
          legendPosition: LegendPosition.top,
          // showLegends: true,
          legendTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14
          ),
          // showLegends: true,
        ),
        chartValuesOptions: const ChartValuesOptions(
              showChartValueBackground: false,
              showChartValues: true,
              showChartValuesInPercentage: false,
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