import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:smart_edu_app/models/models.dart';


class AuthService extends ChangeNotifier {
  final String _baseURL = 'identitytoolkit.googleapis.com';

  final storage = FlutterSecureStorage();
  LoginResponse? loginResponse;
  
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading( bool value ) {
    _isLoading = value;
    notifyListeners();
  }

  bool _isMarked = false;
  bool get isMarked => _isMarked;
  set isMarked( bool value ) {
    _isMarked = value;
    notifyListeners();
  }


  Future<String?> createUser( String email, String password) async {
    final Map<String, dynamic> authData = {
      'email' : email,
      'password' : password
    };

    final url = Uri.https(_baseURL, '/v1/accounts:signUp', {
      'key': dotenv.env['FIREBASE_TOKEN'],
    });

    isLoading = true;
    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode(resp.body);
    isLoading = false;

    if (decodedResp.containsKey('idToken')) {
      await storage.write(key: 'idToken', value: decodedResp['idToken']);
      return null;
    } else {
      return decodedResp['error']['message'];
    }
  }


  Future<String?> login(String email, String password) async {
    final Map<String, dynamic> autenticacionData = {
      'email': email,
      'password': password,
      'returnSecureToken': true,
    };

    final url = Uri.https(_baseURL, 'v1/accounts:signInWithPassword', {
      'key': dotenv.env['FIREBASE_TOKEN']
    });
    isLoading = true;
    final respuesta = await http.post(url, body: json.encode(autenticacionData));
    final Map<String, dynamic> respuestaDecodificada = json.decode(respuesta.body);
    isLoading = false;
    
    if (respuestaDecodificada.containsKey('idToken')) {
      await storage.write(key: 'idToken', value: respuestaDecodificada['idToken']);
      loginResponse = LoginResponse.fromJson(respuestaDecodificada);
      return null;
    } else {
      return respuestaDecodificada['error']['message'];
    }
  }


  Future<String?> recuperarClave(String email) async {
    final Map<String, dynamic> recuperarData = {
      'email': email,
      'requestType': 'PASSWORD_RESET',
    };

    final url = Uri.https(_baseURL, 'v1/accounts:sendOobCode', {
      'key': dotenv.env['FIREBASE_TOKEN']
    });

    isLoading = true;
    final resp = await http.post(url, body: json.encode(recuperarData));
    final Map<String, dynamic> respDecodificada = jsonDecode(resp.body);
    isLoading = false;

    if (respDecodificada.containsKey('email')) {
      return null;
    } else {
      return respDecodificada['error']['message'];
    }
  }


  Future logOut() async {
    await storage.delete(key: 'idToken');
    return; 
  }

}

