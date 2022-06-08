import 'package:dio/dio.dart';

import '../../models/earthquake.dart';

class EarthquakeAPI {
  Future<List<Earthquake>> getEarthquakes() async {
    List<Earthquake> earthquakes = [];
    try {
      Response<List> res =
          await Dio().get('https://api.gael.cloud/general/public/sismos');

      if (res.statusCode == 200) {
        if (res.data != null) {
          res.data!.forEach((element) {
            earthquakes.add(Earthquake.fromJson(element));
          });
        }
        return earthquakes;
      } else if (res.statusCode == 500) {
        throw Exception([
          {"Error": "Server error"}
        ]);
      } else {
        throw Exception([
          {"Error": "Error al traer información."}
        ]);
      }
    } catch (e) {
      throw Exception([
        {"Error": "Error al traer información."}
      ]);
    }
  }
}
