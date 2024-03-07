import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:http/http.dart' as http;
import 'package:smart_edu_app/models/tema_response.dart';

class CourseService extends ChangeNotifier {
  String? course;
  String? topic;
  int answersCount = 0;

  TemaResponse? temaResponse;

  Future<TemaResponse> getCourseTopic(String course, String tema) async {
    final url = Uri.https(dotenv.env['BD_BASE_URL']!, '$course/$tema.json');
    final resp = await http.get(url);

    if (resp.statusCode == 200) {
      final Map<String, dynamic> temaResponseJson = json.decode(resp.body);
      
      final String firstKey = temaResponseJson.keys.first;
      final Map<String, dynamic> temaData = temaResponseJson[firstKey];

      final temaResponse = TemaResponse.fromJson({
        "ejercicios": temaData["ejercicios"],
        "fotoUrl": temaData["fotoUrl"],
        "introduccion": temaData["introduccion"],
        "titulo": temaData["titulo"],
      });

      return temaResponse;
    } else {
      throw Exception('Error al obtener el tema');
    }
  }

}