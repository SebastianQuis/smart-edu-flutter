import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import 'package:smart_edu_app/models/models.dart';


class UserService extends ChangeNotifier {
  UserModel? userLogged;
  Curso? updatedCourse;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading( bool value ) {
    _isLoading = value;
    notifyListeners();
  }

  Future<String?> createUser(UserModel user) async {
    try {
      isLoading = true;
      final url = Uri.https(dotenv.env['BD_BASE_URL']!, 'usuarios.json');
      final rspta = await http.post(url, body: user.toRawJson());
      final dataDecodificada = jsonDecode(rspta.body);
      user.id = dataDecodificada['name'];
      isLoading = false;
      return user.id!;  
    } catch (e) {
      return null;
    }
  }

  Future<String> updatedNotaTema({required String id, required String course, required String topic, required int nota }) async {
    try {
      isLoading = true;
      final url = Uri.https(dotenv.env['BD_BASE_URL']!,'usuarios/$id/avanceCursos/$course/$topic.json');
      await http.put(url, body: '$nota');
      isLoading = false;
      return 'ok';
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> getUserByEmail(String email) async {
    try {
      final url = Uri.https(dotenv.env['BD_BASE_URL']!, 'usuarios.json',{
        "orderBy": '"correo"',
        "equalTo": '"$email"',
      });
      final respuesta = await http.get(url);
      if (respuesta.statusCode == 200) {
        final dataDecodificada = jsonDecode(respuesta.body);
        final id = dataDecodificada.keys.first;
        userLogged = UserModel.fromJson(dataDecodificada[id]);
        return id;
      } else {
        return null;
      }
    } catch (e) {
      return  null;
    }
  }

  Future getNotasTotales({required String id, required String course}) async {
    try {
      final url = Uri.https(dotenv.env['BD_BASE_URL']!, 'usuarios/$id/avanceCursos/$course.json');
      final rspt = await http.get(url);
      if (rspt.statusCode == 200) {
        final dataDecodificada = jsonDecode(rspt.body);
        final cursoResponse = Curso.fromJson(dataDecodificada);
        updatedCourse = cursoResponse;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<String?> updatedNotasTotales({required String id, required String course}) async {
    try {
      await getNotasTotales(id: id, course: course);
      final nota = updatedCourse!.tema1! + updatedCourse!.tema2! + updatedCourse!.tema3! + updatedCourse!.tema4!;
      final url = Uri.https(dotenv.env['BD_BASE_URL']!, 'usuarios/$id/avanceCursos/$course.json');
    
      final newCurso = Curso(
        tema1: updatedCourse!.tema1,
        tema2: updatedCourse!.tema2,
        tema3: updatedCourse!.tema3,
        tema4: updatedCourse!.tema4,
        nota: nota,
      );

      final respuesta = await http.put( url, headers: {'Content-Type': 'application/json'}, body: json.encode(newCurso.toJson()),);

      if (respuesta.statusCode == 200) {
        return 'ok';
      } else {
        return null;
      }
    } catch (e) {
      return e.toString();
    }
  }
}