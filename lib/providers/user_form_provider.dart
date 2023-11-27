import 'package:flutter/material.dart';

class UserFormPorvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  
  String nombre = '';
  String apellidos = '';
  String fechaNacimiento = '';
  String email = '';
  String password = '';

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}

