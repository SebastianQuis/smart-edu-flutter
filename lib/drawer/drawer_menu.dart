import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:smart_edu_app/helpers/helpers.dart';
import 'package:smart_edu_app/screens/screens.dart';
import 'package:smart_edu_app/services/services.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final email = Provider.of<AuthService>(context).loginResponse!.email;
    
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      child: Column(
        children: [
          
          _DrawerCabecera(),

          ListTile(
            title: Center(child: Text(getNameEmail(email), style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),)),
            subtitle: Center(child: Text(email, style: const TextStyle(fontSize: 16),)),
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

          const Spacer(),
          
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.blue,),
            title: const Text('Cerrar sesión'),
            onTap: () {
              final authService = Provider.of<AuthService>(context, listen: false);
              authService.logOut();
              Navigator.pushReplacementNamed(context, LoginScreen.nombre);
            }
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