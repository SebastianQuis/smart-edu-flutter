import 'package:smart_edu_app/models/models.dart';

List<Ejercicio> convertMapList(Map<String, dynamic> mapa) {
  List<Ejercicio> ejercicios = [];

  mapa.forEach((key, value) {
    Ejercicio ejercicio = Ejercicio.fromJson(value);
    ejercicios.add(ejercicio);
  });

  return ejercicios;
}