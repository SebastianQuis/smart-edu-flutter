import 'package:flutter/material.dart';
import 'package:smart_edu_app/screens/avance_screen.dart';
import 'package:smart_edu_app/screens/cursos_screen.dart';
import 'package:smart_edu_app/screens/home_screen.dart';
import 'package:smart_edu_app/screens/login_screen.dart';
import 'package:smart_edu_app/screens/perfil_screen.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Drawer(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      child: Column(
        children: [
          
          _DrawerCabecera(),

          ListTile(
            title: Center(child: Text('Jonathan R.', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),)),
            subtitle: Center(child: Text('jonathan@smartedu.com', style: TextStyle(fontSize: 16),)),
          ),

          ListTile(
            leading: const Icon(Icons.home_rounded, color: Colors.blue,),
            title: const Text('Menú'),
            onTap: () => Navigator.pushReplacementNamed(context, HomeScreen.nombre),
            trailing: Icon(Icons.arrow_forward_ios_rounded, size: 20, color: Colors.blue[800],),
          ),
          
          ListTile(
            leading: const Icon(Icons.person_2_rounded, color: Colors.blue,),
            title: const Text('Perfil'),
            onTap: () => Navigator.pushReplacementNamed(context, PerfilScreen.nombre),
            trailing: Icon(Icons.arrow_forward_ios_rounded, size: 20, color: Colors.blue[800],),
          ),
          
          ListTile(
            leading: const Icon(Icons.equalizer, color: Colors.blue,),
            title: const Text('Avance'),
            onTap: () => Navigator.pushReplacementNamed(context, AvanceScreen.nombre),
            trailing: Icon(Icons.arrow_forward_ios_rounded, size: 20, color: Colors.blue[800],),
          ),
          
          ListTile(
            leading: const Icon(Icons.class_, color: Colors.blue,),
            title: const Text('Cursos'),
            onTap: () => Navigator.pushReplacementNamed(context, CursosScreen.nombre),
            trailing: Icon(Icons.arrow_forward_ios_rounded, size: 20, color: Colors.blue[800],),
          ),

          Spacer(),
          
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.blue,),
            title: const Text('Cerrar sesión'),
            onTap: () {
              // TODO: CERRAR SESION
              Navigator.pushReplacementNamed(context, LoginScreen.nombre);
            },
        ),
          

        ],
      ),
    );
  }
}

class _DrawerCabecera extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/icon_child.png'),
          fit: BoxFit.fitWidth
        )
      ),
      child: Container(),
    );
  }
}