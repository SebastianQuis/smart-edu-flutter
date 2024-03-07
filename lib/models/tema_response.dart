import 'dart:convert';

class TemaResponse {
  final Map<String, Ejercicio> ejercicios;
  final String? fotoUrl;
  final String? introduccion;
  final String? titulo;

  TemaResponse({
    required this.ejercicios,
    this.fotoUrl,
    this.introduccion,
    this.titulo,
  });

  factory TemaResponse.fromRawJson(String str) => TemaResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  List<Ejercicio> obtenerEjerciciosAleatorios() {
    final List<String> keys = ejercicios.keys.toList()..shuffle();
    return keys.map((key) => ejercicios[key]!).toList();
  }

  factory TemaResponse.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> ejerciciosJson = json['ejercicios'] ?? {};
    Map<String, Ejercicio> ejercicios = ejerciciosJson.map(
      (key, value) => MapEntry(key, Ejercicio.fromJson(value)),
    );

    return TemaResponse(
      ejercicios: ejercicios,
      fotoUrl: json["fotoUrl"],
      introduccion: json["introduccion"],
      titulo: json["titulo"],
    );    
  }

  Map<String, dynamic> toJson() => {
    "ejercicios": Map.from(ejercicios).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    "fotoUrl": fotoUrl,
    "introduccion": introduccion,
    "titulo": titulo,
  };

  List<Ejercicio> getEjerciciosList() {
    return ejercicios.values.toList();
  }
}


class Ejercicio {
    final String enunciado;
    final List<Opcione> opciones;

    Ejercicio({
        required this.enunciado,
        required this.opciones,
    });

    factory Ejercicio.fromRawJson(String str) => Ejercicio.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Ejercicio.fromJson(Map<String, dynamic> json) => Ejercicio(
        enunciado: json["enunciado"],
        opciones: List<Opcione>.from(json["opciones"].map((x) => Opcione.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "enunciado": enunciado,
        "opciones": List<dynamic>.from(opciones.map((x) => x.toJson())),
    };

}

class Opcione {
    final bool respuesta;
    final String texto;

    Opcione({
        required this.respuesta,
        required this.texto,
    });

    factory Opcione.fromRawJson(String str) => Opcione.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Opcione.fromJson(Map<String, dynamic> json) => Opcione(
        respuesta: json["respuesta"],
        texto: json["texto"],
    );

    Map<String, dynamic> toJson() => {
        "respuesta": respuesta,
        "texto": texto,
    };
}
