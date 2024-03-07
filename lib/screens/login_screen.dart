import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:smart_edu_app/helpers/helpers.dart';
import 'package:smart_edu_app/providers/providers.dart';
import 'package:smart_edu_app/screens/screens.dart';
import 'package:smart_edu_app/services/services.dart';
import 'package:smart_edu_app/widgets/widgets.dart';
 
class LoginScreen extends StatelessWidget {
  static const nombre = 'LoginScreen';
  const LoginScreen({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
        
            const SafeArea(child: LogoImage(height: 220,)),
        
            TitleSubTitle(
              title: 'Iniciar sesión', 
              subtitle: '¡Hola! ¿Estás listo para aprender?'
            ),

            ChangeNotifierProvider(
              create: (context) => LoginFormProvider(),
              child: const _FormBody()
            ),

            const SignUpForgotPassword(),

          ],
        ),
      ),
    );
  }
}

class SignUpForgotPassword extends StatelessWidget {
  const SignUpForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        children: [

          GestureDetector(
            onTap: () => Navigator.pushNamed(context, SignUpScreen.nombre),
            child: const Text('Regístrate', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700))
          ),

          const SizedBox(height: 10,),

          GestureDetector(
            onTap: () => Navigator.pushNamed(context, ForgotPasswordScreen.nombre),
            child: Text('¿Olvídaste tu contraseña?', style: TextStyle(fontSize: 18, color: Colors.grey[700]))
          ),

        ],
      ),
    );
  }
}

class _FormBody extends StatefulWidget {
  const _FormBody();

  @override
  State<_FormBody> createState() => _FormBodyState();
}

class _FormBodyState extends State<_FormBody> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final loginForm = Provider.of<LoginFormProvider>(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Form(
        key: loginForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
      
            InputForm(
              labelText: 'Correo',
              textInputType: TextInputType.emailAddress,
              onChanged: (value) => loginForm.email = value,
              validator: (value) {
                String pattern =
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp = RegExp(pattern);
      
                return regExp.hasMatch(value ?? '')
                  ? null
                  : 'Ingrese un correo valido';
              },
              prefixIcon: Icons.email,
            ),
      
            InputForm(
              obscureText: _obscureText,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                }, 
                icon: Icon( _obscureText ? Icons.visibility : Icons.visibility_off)
              ),
              labelText: 'Contraseña',
              onChanged: (value) => loginForm.password = value,
              validator: (value) {
                return (value != null && value.length > 5)
                    ? null
                    : 'Ingrese una contraseña valida';
              },
              prefixIcon: Icons.key,
            ),
      
            ButtonCustom(
              onPressed: authService.isLoading
                ? null
                : () async {
                  
                  FocusScope.of(context).unfocus();
                  if(!loginForm.isValidForm()) return;
            
                  await Future.delayed(const Duration(seconds: 1));
                  final String? token = await authService.login(loginForm.email, loginForm.password);
      
                  if (token == null) {
                    NotificacionService.showSnackBar('Bienvenido!!', Colors.black45);
                    Navigator.pushReplacementNamed(context, HomeScreen.nombre);
                  } else {
                    NotificacionService.showSnackBar('Cuenta no existe', Colors.red);
                    // loginForm.isLoading = false;
                  }             
              }, 
              nombre: 'Iniciar Sesión'
            ),
      
          ],
        ),
      ),
    );
  }
}