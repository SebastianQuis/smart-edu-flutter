import 'package:flutter/material.dart';

import 'package:smart_edu_app/screens/ejercicios_screen.dart';
import 'package:smart_edu_app/widgets/title_subtitle.dart';
 
class TemaCursoScreen extends StatelessWidget {
  static const nombre = 'TemaCursoScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
          
              TitleSubTitle(title: 'Ecuaciones de "2do grado"'),
        
              Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quam velit, vulputate eu pharetra nec, mattis ac neque. Duis vulputate commodo lectus, ac blandit elit tincidunt id. Sed rhoncus, tortor sed eleifend tristique, tortor mauris molestie elit, et lacinia ipsum quam nec dui. Quisque nec mauris sit amet elit iaculis pretium sit amet quis magna. Aenean velit odio, elementum in tempus ut, vehicula eu diam. Pellentesque rhoncus aliquam mattis. Ut vulputate eros sed felis sodales nec vulputate justo hendrerit. Vivamus varius pretium ligula, a aliquam odio euismod sit amet. Quisque laoreet sem sit amet orci ullamcorper at ultricies metus viverra. Pellentesque arcu mauris, malesuada quis ornare accumsan, blandit sed diam.',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16),
              ),

              SizedBox(height: 10,),

              ImageButtons(),
        
            ],
          ),
        ),
      ),
    );
  }
}

class ImageButtons extends StatelessWidget {
  const ImageButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [

          Text('Imagen de fórmula', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),

          IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.camera_alt_outlined, size: 100,)
          ),


          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(150, 40),
                  backgroundColor: Colors.blue[800],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  )
                ),
                onPressed: (){}, 
                child: Text('Atrás', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),)
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(150, 40),
                  backgroundColor: Colors.blue[800],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  )
                ),
                onPressed: (){
                  Navigator.pushNamed(context, EjerciciosScreen.nombre);
                }, 
                child: Text('Siguiente', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),)
              ),

            ],
          ),

          SizedBox(height: 20,)

        ],
      ),
    );
  }
}