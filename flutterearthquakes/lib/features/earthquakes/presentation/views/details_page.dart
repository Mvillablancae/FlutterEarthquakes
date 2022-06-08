import 'package:flutter/material.dart';
import 'package:flutterearthquakes/features/earthquakes/data/models/earthquake.dart';
import 'package:flutterearthquakes/features/earthquakes/presentation/providers/earthquake_provider.dart';
import 'package:flutterearthquakes/resources/dateformater.dart';
import 'package:flutterearthquakes/resources/viewBuilder/textStyles.dart';
import 'package:provider/provider.dart';

import '../../../../resources/colors.dart';
import '../../../../resources/viewBuilder/viewBuilder.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({Key? key, required this.sismo}) : super(key: key);

  Earthquake sismo;

  @override
  Widget build(BuildContext context) {
    print(dateFormat(sismo.fecha));
    return ViewBuilder(
      builder: (context, sizingInformation) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Detalles"),
            backgroundColor: primaryColor,
            centerTitle: true,
          ),
          body: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    "Ubicación del sismo",
                    style: dateStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    sismo.refGeografica,
                    style: detailItemStyle,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    "Coordenadas (Latitud, Longitud)",
                    style: dateStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    '( ${sismo.latitud} , ${sismo.longitud} )',
                    style: detailItemStyle,
                  ),
                ),
                SizedBox(
                  height: sizingInformation.screenSize.height * 0.08,
                  width: sizingInformation.screenSize.width,
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text(
                              "Fecha",
                              style: dateStyle,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              dateFormat(sismo.fecha).split(' ')[0],
                              style: detailItemStyle,
                            ),
                          ),
                        ],
                      ),
                      Flexible(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                "Hora",
                                style: dateStyle,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                dateFormat(sismo.fecha).split(' ').last,
                                style: detailItemStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: sizingInformation.screenSize.height * 0.08,
                  width: sizingInformation.screenSize.width,
                  child: Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                "Intensidad",
                                style: dateStyle,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                sismo.magnitud,
                                style: detailItemStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                "Profundidad",
                                style: dateStyle,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                "${sismo.profundidad} metros",
                                style: detailItemStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    "Agencia",
                    style: dateStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    sismo.agencia,
                    style: detailItemStyle,
                  ),
                ),
                Flexible(flex: 2, child: SizedBox()),
              ],
            ),
          ),
        );
      },
    );
  }
}
