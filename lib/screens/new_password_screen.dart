import 'package:flutter/material.dart';
import 'package:smart_edu_app/widgets/widgets.dart';
 
class NewPasswordScreen extends StatelessWidget {
  static const nombre = 'NewPasswordScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        // actions: [
        //   IconButton(onPressed: (){}, icon: Icon(Icons.backpack_outlined))
        // ],
      ),

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
            
                // const SafeArea(child: LogoImage(height: 220,)),
            
                const TitleSubTitle(
                  title: '¿Olvidaste tu contraseña?', 
                ),
          
                InputForm(
                  labelText: 'Nueva contraseña',
                ),
                
                InputForm(
                  labelText: 'Confirmar contraseña',
                ),
                
                const SizedBox(height: 30,),
          
                ButtonCustom(
                  onPressed: () {
                    
                  }, 
                  nombre: 'Guardar cambios'
                ),
          
              ],
            ),
          ),
        ),
      ),
    );
  }
}