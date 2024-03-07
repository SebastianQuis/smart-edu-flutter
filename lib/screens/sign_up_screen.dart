import 'package:flutter/material.dart'
;
import 'package:provider/provider.dart';

import 'package:smart_edu_app/helpers/helpers.dart';
import 'package:smart_edu_app/models/models.dart';
import 'package:smart_edu_app/providers/providers.dart';
import 'package:smart_edu_app/screens/screens.dart';
import 'package:smart_edu_app/services/services.dart';
import 'package:smart_edu_app/widgets/widgets.dart';
 
class SignUpScreen extends StatelessWidget {
  static const nombre = 'SignUpScreen';

  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
        
            const SafeArea(child: LogoImage(height: 200,)),
        
            TitleSubTitle(
              title: 'Registro como usuario', 
              subtitle: '¡Parece que eres nuevo con nostros! Crea una cuenta para completar tu experiencia.'
            ),

            ChangeNotifierProvider(
              create: (context) => RegisterFormProvider(),
              child: const FormBody()
            ),

          ],
        ),
      ),
    );
  }
}

class FormBody extends StatefulWidget {
  const FormBody({super.key});
  @override
  State<FormBody> createState() => _FormBodyState();
}

class _FormBodyState extends State<FormBody> {
  bool _isAccepted = false;
  bool _obscureText = true;
  
  @override
  Widget build(BuildContext context) {
    final registerForm = Provider.of<RegisterFormProvider>(context);
    final userService = Provider.of<UserService>(context);
    final authService = Provider.of<AuthService>(context);
  
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Form(
        key: registerForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
      
            InputForm(
              labelText: 'Nombres',
              onChanged: (value) => registerForm.nombre = value,
              validator: (value) {
                return (value != null && value.length > 1)
                  ? null
                  : 'Ingrese un nombre valido';
              }, 
              prefixIcon: Icons.person_pin,
            ),
            
            InputForm(
              labelText: 'Apellidos',
              onChanged: (value) => registerForm.apellidos = value,
              validator: (value) {
                return (value != null && value.length > 1)
                  ? null
                  : 'Ingrese un apellido valido';
              },
              prefixIcon: Icons.person,
            ),
            
            InputForm(
              labelText: 'Fecha de nacimiento',
              onChanged: (value) => registerForm.fechaNacimiento = value,
              // textInputType: TextInputType.,
              validator: (value) {
                final RegExp regExp = RegExp(r'^\d{2}/\d{2}/\d{4}$');
                return regExp.hasMatch(value ?? '')
                  ? null
                  : 'Ej: 01/01/2023';
              },
              prefixIcon: Icons.date_range,
            ),
            
            InputForm(
              textInputType: TextInputType.emailAddress,
              onChanged: (value) => registerForm.email = value,
              labelText: 'Correo electrónico',
              validator: (value) {
                String pattern =
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp = RegExp(pattern);
      
                return regExp.hasMatch(value ?? '')
                  ? null
                  : 'Ingrese un correo valido';
              },
              prefixIcon: Icons.email
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
              onChanged: (value) => registerForm.password = value,
              validator: (value) {
                return (value != null && value.length > 5)
                  ? null
                  : 'Ingrese una contraseña valida';
              },
              prefixIcon: Icons.key,
            ),
      
            CheckboxListTile(
              value: _isAccepted, 
              onChanged: (value) {
                mostrarAlerta(context, 'Términos y condiciones',
                  '''Uso personal de la aplicación.\nRespeta la privacidad y derechos de terceros.\nCuida la confidencialidad de tu cuenta.\nNo subas contenido inapropiado.\nNo ganratizamos funcionamiento perfecto.\nLeyes locales aplican.\nTérminos pueden cambiar.''', 
                  [
                    MaterialButton(
                      onPressed: () {
                        _isAccepted = value!;
                        setState(() {});
                        Navigator.pop(context);
                      },
                      elevation: 5,
                      textColor: Colors.blue,
                      child: const Text('Ok'),
                    ),
                    
                  ]
                );
              },
              title: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('He leído y acepto los '),
                  Text('términos y condiciones', style: TextStyle(
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline)
                  ),
                ],
              ),
              controlAffinity: ListTileControlAffinity.leading,
            ),
      
            ButtonCustom(
              onPressed: userService.isLoading 
                ? null
                : () async {
                  FocusScope.of(context).unfocus();
                  if (!registerForm.isValidForm()) return;

                  // registerForm.isLoading = true;

                  await Future.delayed(const Duration(seconds: 1));
                  final newUser = UserModel(
                    apellidos: registerForm.apellidos,
                    correo: registerForm.email, 
                    fechaNacimiento: registerForm.fechaNacimiento, 
                    nombres: registerForm.nombre,
                  );

                  // registerForm.isLoading = false;

                  if (_isAccepted) {
                    final String? token = await authService.createUser(registerForm.email, registerForm.password);
                    await userService.createUser(newUser);
                    if (token == null) {
                      NotificacionService.showSnackBar('Cuenta creada', Colors.black45);
                      // ignore: use_build_context_synchronously
                      Navigator.pushReplacementNamed(context, LoginScreen.nombre);
                    } else {
                      NotificacionService.showSnackBar('Cuenta existente', Colors.red);
                      // registerForm.isLoading = false;
                    }
                  } else {
                    NotificacionService.showSnackBar('Aceptar términos y condiciones', Colors.red);
                    // registerForm.isLoading = false;
                  }

              }, 
              nombre: 'Registrarse'
            ),
      
          ],
        ),
      ),
    );
  }
}