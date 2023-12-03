import 'package:smart_edu_app/models/models.dart';

List<Ejercicio> convertMapList(Map<String, dynamic> mapa) {
  List<Ejercicio> ejercicios = [];

  mapa.forEach((key, value) {
    Ejercicio ejercicio = Ejercicio.fromJson(value);
    // ejercicio.id = key;
    ejercicios.add(ejercicio);
  });

  return ejercicios;
}

// List<UserResponse> convertMapListUser(Map<String, dynamic> mapa) {
//   List<UserResponse> citas = [];

//   mapa.forEach((key, value) {
//     UserResponse userResponse = UserResponse.fromJson(value);
//     userResponse.id = key; 
//     citas.add(userResponse);
//   });

//   return citas;
// }