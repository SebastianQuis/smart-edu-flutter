import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:smart_edu_app/helpers/helpers.dart';
import 'package:smart_edu_app/services/services.dart';
import 'package:smart_edu_app/widgets/widgets.dart';
 
class ForgotPasswordScreen extends StatelessWidget {
  static const nombre = 'ForgotPasswordScreen';
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final textEditingController = TextEditingController();
    final focusNode = FocusNode();

    return Scaffold(

      appBar: AppBar(
        // backgroundColor: Colors.,
      ),

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [

                
            
                TitleSubTitle(
                  title: '¿Olvidaste tu contraseña?', 
                ),
          
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  focusNode: focusNode,
                  controller: textEditingController,
                  decoration: const InputDecoration(
                    labelText: 'Correo electrónico'
                  ),
                ),
                
                const SizedBox(height: 30,),
          
                ButtonCustom(
                  onPressed: authService.isLoading
                    ? null
                    : () async {
                      await Future.delayed(const Duration(seconds: 1));
                      final String? resp = await authService.recuperarClave(textEditingController.text.trim());
                      focusNode.requestFocus();

                      if (resp == null) {
                        NotificacionService.showSnackBar('Se envió correo', Colors.black45);
                      } else {
                        NotificacionService.showSnackBar('Cuenta no existe', Colors.red);
                      }

                    }, 
                  nombre: 'Enviar'
                ),
          
              ],
            ),
          ),
        ),
      ),
    );
  }
}