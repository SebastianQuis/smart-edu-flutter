import 'dart:convert';

class UserModel {
  final String apellidos;
  final String correo;
  final String fechaNacimiento;
  final String nombres;
  final AvanceCursos avanceCursos;
  final NotasTotales notasTotales;
  String? id;

  UserModel({
    required this.apellidos,
    required this.correo,
    required this.fechaNacimiento,
    required this.nombres,
    this.id,
    AvanceCursos? avanceCursos,
    NotasTotales? notasTotales,
  })  : this.avanceCursos = avanceCursos ?? AvanceCursos(),
        this.notasTotales = notasTotales ?? NotasTotales();

  factory UserModel.fromRawJson(String str) => UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        apellidos: json["apellidos"],
        correo: json["correo"],
        fechaNacimiento: json["fechaNacimiento"],
        nombres: json["nombres"],
        avanceCursos: AvanceCursos.fromJson(json["avanceCursos"]),
        notasTotales: NotasTotales.fromJson(json["notasTotales"]),
      );

  Map<String, dynamic> toJson() => {
        "apellidos": apellidos,
        "correo": correo,
        "fechaNacimiento": fechaNacimiento,
        "nombres": nombres,
        "avanceCursos": avanceCursos.toJson(),
        "notasTotales": notasTotales.toJson(),
      };
}


class AvanceCursos {
    final Curso biologia;
    final Curso literaturaEspanola;
    final Curso razonamientoMatematico;

    AvanceCursos({
      Curso? biologia,
      Curso? literaturaEspanola,
      Curso? razonamientoMatematico,
    })  : this.biologia = biologia ?? Curso(),
          this.literaturaEspanola = literaturaEspanola ?? Curso(),
          this.razonamientoMatematico = razonamientoMatematico ?? Curso();

    factory AvanceCursos.fromRawJson(String str) => AvanceCursos.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AvanceCursos.fromJson(Map<String, dynamic> json) => AvanceCursos(
        biologia: Curso.fromJson(json["biologia"]),
        literaturaEspanola: Curso.fromJson(json["literaturaEspanola"]),
        razonamientoMatematico: Curso.fromJson(json["razonamientoMatematico"]),
    );

    Map<String, dynamic> toJson() => {
        "biologia": biologia.toJson(),
        "literaturaEspanola": literaturaEspanola.toJson(),
        "razonamientoMatematico": razonamientoMatematico.toJson(),
    };
}

class Curso {
    int? tema1;
    int? tema2;
    int? tema3;
    int? tema4;

    Curso({
        this.tema1 = 0,
        this.tema2 = 0,
        this.tema3 = 0,
        this.tema4 = 0,
    });

    factory Curso.fromRawJson(String str) => Curso.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Curso.fromJson(Map<String, dynamic> json) => Curso(
        tema1: json["tema1"],
        tema2: json["tema2"],
        tema3: json["tema3"],
        tema4: json["tema4"],
    );

    Map<String, dynamic> toJson() => {
        "tema1": tema1,
        "tema2": tema2,
        "tema3": tema3,
        "tema4": tema4,
    };
}

class NotasTotales {
    int? biologia;
    int? literaturaEspanola;
    int? razonamientoMatematico;

    NotasTotales({
        this.biologia = 0,
        this.literaturaEspanola = 0,
        this.razonamientoMatematico = 0,
    });

    factory NotasTotales.fromRawJson(String str) => NotasTotales.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory NotasTotales.fromJson(Map<String, dynamic> json) => NotasTotales(
        biologia: json["biologia"],
        literaturaEspanola: json["literaturaEspanola"],
        razonamientoMatematico: json["razonamientoMatematico"],
    );

    Map<String, dynamic> toJson() => {
        "biologia": biologia,
        "literaturaEspanola": literaturaEspanola,
        "razonamientoMatematico": razonamientoMatematico,
    };
}