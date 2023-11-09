import 'package:flutter/material.dart';
import 'package:smart_edu_app/screens/contenido_screen.dart';
import 'package:smart_edu_app/widgets/button_custom.dart';
 
class ResultScreen extends StatelessWidget {
  static const nombre = 'ResultScreen';
  const ResultScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            child: Column(
              children: [

                
            
                const Text('Lo lograste', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600,)),
                // Lo hiciste bien, pero puedes ser mejor
                // Sigue intentando, el esfuerzo trae recompensa
          
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 10),
                  height: 300,
                  child: const Image(
                    image: AssetImage('assets/nota_buena.jpg'),
                    // image: AssetImage('assets/nota_mala.jpg'),
                    // image: AssetImage('assets/nota_media.jpg'),
                    fit: BoxFit.fill,
                    filterQuality: FilterQuality.high,
                  ),
                ),
          
                const Text('4/4', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400)),

                const SizedBox(height: 30,),
          
                ButtonCustom(
                  onPressed: (){
                    Navigator.pushReplacementNamed(context, ContenidoScreen.nombre);
                  }, 
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