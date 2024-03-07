import 'package:flutter/material.dart';

class RegisterFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  
  String nombre = '';
  String apellidos = '';
  String fechaNacimiento = '';
  String email = '';
  String password = '';

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}

