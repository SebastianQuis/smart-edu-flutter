import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_edu_app/helpers/notificacion_service.dart';
import 'package:smart_edu_app/providers/login_form_provider.dart';
import 'package:smart_edu_app/screens/login_screen.dart';
import 'package:smart_edu_app/services/auth_service.dart';
import 'package:smart_edu_app/widgets/widgets.dart';
 
class SignUpScreen extends StatelessWidget {
  static const nombre = 'SignUpScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
        
            const SafeArea(child: LogoImage(height: 200,)),
        
            const TitleSubTitle(
              title: 'Registro como usuario', 
              subtitle: '¡Parece que eres nuevo con nostros! Crea una cuenta para completar tu experiencia.'
            ),

            ChangeNotifierProvider(
              create: (context) => LoginFormProvider(),
              child: FormBody()
            ),

            // SignUpForgotPassword(),

          ],
        ),
      ),
    );
  }
}

class FormBody extends StatefulWidget {
  const FormBody();

  @override
  State<FormBody> createState() => _FormBodyState();
}

class _FormBodyState extends State<FormBody> {
  bool _isAccepted = false;
  bool _obscureText = true;
  
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    final authService = Provider.of<AuthService>(context);
  
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: loginForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
      
            InputForm(
              labelText: 'Nombres',
            ),
            
            InputForm(
              labelText: 'Apellidos',
            ),
            
            InputForm(
              labelText: 'Fecha de nacimiento',
            ),
            
            InputForm(
              textInputType: TextInputType.emailAddress,
              onChanged: (value) => loginForm.email = value,
              labelText: 'Correo electrónico',
              validator: (value) {
                String pattern =
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp = RegExp(pattern);
      
                return regExp.hasMatch(value ?? '')
                  ? null
                  : 'Ingrese un correo valido';
              },
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
              onPressed: loginForm.isLoading
                ? null
                : () async {
                  FocusScope.of(context).unfocus();
                  if (!loginForm.isValidForm()) return;

                  loginForm.isLoading = true;

                  await Future.delayed(Duration(seconds: 1));
                  
                  print(_isAccepted);

                  if (_isAccepted) {
                    final String? token = await authService.createUser(loginForm.email, loginForm.password);
                    if (token == null) {
                      NotificacionService.showSnackBar('Cuenta creada', Colors.black45);
                      Navigator.pushReplacementNamed(context, LoginScreen.nombre);
                    } else {
                      NotificacionService.showSnackBar('Cuenta existente', Colors.red);
                      loginForm.isLoading = false;
                    }
                  } else {
                    NotificacionService.showSnackBar('Aceptar términos y condiciones', Colors.red);
                    loginForm.isLoading = false;
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