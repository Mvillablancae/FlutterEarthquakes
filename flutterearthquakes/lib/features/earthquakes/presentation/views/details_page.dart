import 'package:flutter/material.dart';
import 'package:flutterearthquakes/features/earthquakes/data/models/earthquake.dart';
import 'package:flutterearthquakes/features/earthquakes/presentation/providers/earthquake_provider.dart';
import 'package:flutterearthquakes/resources/dateformater.dart';
import 'package:flutterearthquakes/resources/viewBuilder/textStyles.dart';
import 'package:provider/provider.dart';

import '../../../../resources/colors.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({Key? key, required this.sismo}) : super(key: key);

  Earthquake sismo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalles"),
        backgroundColor: primaryColor,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Ubicación del sismo",
              style: dateStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              sismo.refGeografica,
              style: titleStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Coordenadas (Latitud, Longitud)",
              style: dateStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '( ${sismo.latitud} , ${sismo.longitud} )',
              style: titleStyle,
            ),
          ),
          Flexible(
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Fecha",
                          style: dateStyle,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          dateFormat(sismo.fecha).split(' ')[0],
                          style: dateStyle,
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Hora",
                          style: dateStyle,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          dateFormat(sismo.fecha).split(' ')[1],
                          style: dateStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Intensidad",
                          style: dateStyle,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          sismo.magnitud,
                          style: dateStyle,
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Profundidad",
                          style: dateStyle,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          sismo.profundidad,
                          style: dateStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Agencia",
              style: dateStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              sismo.agencia,
              style: dateStyle,
            ),
          ),
          Flexible(flex: 5, child: SizedBox()),
        ],
      ),
    );
  }
}
