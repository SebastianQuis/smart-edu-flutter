import 'dart:convert';

class UserModel {
  final String apellidos;
  final String correo;
  final String fechaNacimiento;
  final String nombres;
  final AvanceCursos avanceCursos;
  String? id;

  UserModel({
    required this.apellidos,
    required this.correo,
    required this.fechaNacimiento,
    required this.nombres,
    this.id,
    AvanceCursos? avanceCursos,
  })  : avanceCursos = avanceCursos ?? AvanceCursos();

  factory UserModel.fromRawJson(String str) => UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        apellidos: json["apellidos"],
        correo: json["correo"],
        fechaNacimiento: json["fechaNacimiento"],
        nombres: json["nombres"],
        avanceCursos: AvanceCursos.fromJson(json["avanceCursos"]),
      );

  Map<String, dynamic> toJson() => {
        "apellidos": apellidos,
        "correo": correo,
        "fechaNacimiento": fechaNacimiento,
        "nombres": nombres,
        "avanceCursos": avanceCursos.toJson(),
      };
}


class AvanceCursos {
    final Curso biologia;
    final Curso literatura;
    final Curso razonamientoMatematico;

    AvanceCursos({
      Curso? biologia,
      Curso? literatura,
      Curso? razonamientoMatematico,
    })  : biologia = biologia ?? Curso(),
          literatura = literatura ?? Curso(),
          razonamientoMatematico = razonamientoMatematico ?? Curso();

    factory AvanceCursos.fromRawJson(String str) => AvanceCursos.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AvanceCursos.fromJson(Map<String, dynamic> json) => AvanceCursos(
        biologia: Curso.fromJson(json["biologia"]),
        literatura: Curso.fromJson(json["literatura"]),
        razonamientoMatematico: Curso.fromJson(json["razonamientoMatematico"]),
    );

    Map<String, dynamic> toJson() => {
        "biologia": biologia.toJson(),
        "literatura": literatura.toJson(),
        "razonamientoMatematico": razonamientoMatematico.toJson(),
    };
}

class Curso {
    int? tema1;
    int? tema2;
    int? tema3;
    int? tema4;
    int? nota;

    Curso({
        this.tema1 = 0,
        this.tema2 = 0,
        this.tema3 = 0,
        this.tema4 = 0,
        this.nota = 0
    });

    factory Curso.fromRawJson(String str) => Curso.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Curso.fromJson(Map<String, dynamic> json) => Curso(
        tema1: json["tema1"],
        tema2: json["tema2"],
        tema3: json["tema3"],
        tema4: json["tema4"],
        nota: json["nota"],
    );

    Map<String, dynamic> toJson() => {
        "tema1": tema1,
        "tema2": tema2,
        "tema3": tema3,
        "tema4": tema4,
        "nota": nota,
    };
}

