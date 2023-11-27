import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:smart_edu_app/models/tema_response.dart';

class CourseService extends ChangeNotifier {

  final String _baseUrl = 'flutter-smart-edu-default-rtdb.firebaseio.com';

  String? course;
  String? topic;
  int answersCount = 0;

  TemaResponse? temaResponse;


  Future<TemaResponse> getCourseTopic(String course, String tema) async {
  final url = Uri.https(_baseUrl, '$course/$tema.json');
  final resp = await http.get(url);

  if (resp.statusCode == 200) {
    final Map<String, dynamic> temaResponseJson = json.decode(resp.body);
    
    // Obtiene la primera entrada del mapa (el identificador único)
    final String firstKey = temaResponseJson.keys.first;
    final Map<String, dynamic> temaData = temaResponseJson[firstKey];

    // Construye el objeto TemaResponse con los datos obtenidos
    final temaResponse = TemaResponse.fromJson({
      "ejercicios": temaData["ejercicios"],
      "fotoUrl": temaData["fotoUrl"],
      "introduccion": temaData["introduccion"],
      "titulo": temaData["titulo"],
    });

    // print(temaResponse.titulo);
    return temaResponse;
  } else {
    throw Exception('Error al obtener el tema');
  }
}

}