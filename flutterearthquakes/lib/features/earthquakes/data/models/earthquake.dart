import 'package:meta/meta.dart';
import 'dart:convert';

class Earthquake {
  Earthquake({
    required this.fecha,
    required this.latitud,
    required this.longitud,
    required this.profundidad,
    required this.magnitud,
    required this.agencia,
    required this.refGeografica,
    required this.fechaUpdate,
  });

  final DateTime fecha;
  final String latitud;
  final String longitud;
  final String profundidad;
  final String magnitud;
  final String agencia;
  final String refGeografica;
  final DateTime fechaUpdate;

  Earthquake copyWith({
    required DateTime fecha,
    required String latitud,
    required String longitud,
    required String profundidad,
    required String magnitud,
    required String agencia,
    required String refGeografica,
    required DateTime fechaUpdate,
  }) =>
      Earthquake(
        fecha: fecha,
        latitud: latitud,
        longitud: longitud,
        profundidad: profundidad,
        magnitud: magnitud,
        agencia: agencia,
        refGeografica: refGeografica,
        fechaUpdate: fechaUpdate,
      );


  //TODO: Separate to domain layer
  factory Earthquake.fromJson(Map<String, dynamic> json) => Earthquake(
        fecha: DateTime.parse(json["Fecha"]),
        latitud: json["Latitud"],
        longitud: json["Longitud"],
        profundidad: json["Profundidad"],
        magnitud: json["Magnitud"],
        agencia: json["Agencia"],
        refGeografica: json["RefGeografica"],
        fechaUpdate: DateTime.parse(json["FechaUpdate"]),
      );
      
  //TODO: Separate to domain layer
  Map<String, dynamic> toJson() => {
        "Fecha": fecha.toIso8601String(),
        "Latitud": latitud,
        "Longitud": longitud,
        "Profundidad": profundidad,
        "Magnitud": magnitud,
        "Agencia": agencia,
        "RefGeografica": refGeografica,
        "FechaUpdate": fechaUpdate.toIso8601String(),
      };
}
