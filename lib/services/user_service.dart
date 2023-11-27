import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:smart_edu_app/models/models.dart';


class UserService extends ChangeNotifier {

  final String _baseURL = 'flutter-smart-edu-default-rtdb.firebaseio.com';
  
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading( bool value ) {
    _isLoading = value;
    notifyListeners();
  }

  Future<String?> createUser(UserModel user) async {
    try {
      isLoading = true;
      final url = Uri.https(_baseURL, 'usuarios.json');
      final rspta = await http.post(url, body: user.toRawJson());
      final dataDecodificada = jsonDecode(rspta.body);
      user.id = dataDecodificada['name'];
      isLoading = false;
      return user.id!;  
    } catch (e) {
      return null;
    }
  }


}

