import 'package:smart_edu_app/models/tema_response.dart';

List<Ejercicio> convertMapList(Map<String, dynamic> mapa) {
  List<Ejercicio> ejercicios = [];

  mapa.forEach((key, value) {
    Ejercicio ejercicio = Ejercicio.fromJson(value);
    // ejercicio.id = key;
    ejercicios.add(ejercicio);
  });

  return ejercicios;
}