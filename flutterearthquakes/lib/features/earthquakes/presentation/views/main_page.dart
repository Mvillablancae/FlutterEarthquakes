import 'package:flutter/material.dart';
import 'package:flutterearthquakes/features/earthquakes/data/models/earthquake.dart';
import 'package:flutterearthquakes/resources/colors.dart';
import 'package:flutterearthquakes/resources/dateformater.dart';
import 'package:flutterearthquakes/resources/viewBuilder/textStyles.dart';
import 'package:flutterearthquakes/resources/viewBuilder/viewBuilder.dart';
import 'package:provider/provider.dart';

import '../../../../resources/viewBuilder/sizing_information.dart';
import '../providers/earthquake_provider.dart';
import '../widgets/customlisttile.dart';

class EarthquakeListPage extends StatelessWidget {
  const EarthquakeListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EarthquakeProvider provider = Provider.of<EarthquakeProvider>(context);

    return ViewBuilder(
      builder: (BuildContext context, SizingInformation sizingInformation) {
        return Scaffold(
            appBar: AppBar(
              title: const Text("SISMOS"),
              backgroundColor: primaryColor,
              centerTitle: true,
            ),
            body: SizedBox(
              width: sizingInformation.screenSize.width,
              height: sizingInformation.screenSize.height,
              child: FutureBuilder(
                future: provider.getEarthquakesList(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: provider.earthquakeList.length,
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        itemBuilder: (context, index) {
                          return CustomListTile(
                            provider: provider,
                            sizingInformation: sizingInformation,
                            sismo: provider.earthquakeList[index],
                          );
                        });
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text(
                        "Error",
                        style: titleStyle,
                      ),
                    );
                  } else {
                    return Center(
                      child: SizedBox(
                          height: 100,
                          width: 100,
                          child: CircularProgressIndicator(
                            color: primaryColor,
                          )),
                    );
                  }
                },
              ),
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.arrow_downward),
              backgroundColor: primaryColor,
              onPressed: (() {
                
              }),
            ));
      },
    );
  }
}
