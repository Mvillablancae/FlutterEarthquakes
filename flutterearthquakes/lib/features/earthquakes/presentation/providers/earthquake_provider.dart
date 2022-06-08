import 'package:flutter/material.dart';

import '../../data/datasources/remotedatasources/earthquakeAPI.dart';
import '../../data/models/earthquake.dart';

class EarthquakeProvider with ChangeNotifier {
  List<Earthquake> _earthquakesList = [];
  bool isReversed = false;
  final EarthquakeAPI _api = EarthquakeAPI();

  List<Earthquake> get earthquakeList => _earthquakesList;

  //TODO: Separar en capa de Dominio
  // Caso de uso 1
  Future<List<Earthquake>> getEarthquakesList() async {
    if (_earthquakesList.isNotEmpty) {
      return _earthquakesList;
    } else {
      try {
        _earthquakesList = await _api.getEarthquakes();
      } on Exception catch (exception) {
        print(exception.toString());
      } catch (error) {
        print(error);
      }
      return _earthquakesList;
    }
  }

  // Caso de uso 1
  void invertList() {
    _earthquakesList = _earthquakesList.reversed.toList();
    isReversed = !isReversed;
    notifyListeners();
  }

  //TODO: Separar en capa de Dominio
  // Caso de uso 2
  Future<List<Earthquake>> reloadEarthquakesList() async {
    try {
      _earthquakesList = await _api.getEarthquakes();
    } on Exception catch (exception) {
      print(exception.toString());
    } catch (error) {
      print(error);
    }
    return _earthquakesList;
  }
}
