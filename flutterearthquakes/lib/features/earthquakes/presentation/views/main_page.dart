import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/earthquake_provider.dart';





class EarthquakeListPage extends StatelessWidget {
  const EarthquakeListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EarthquakeProvider provider = Provider.of<EarthquakeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("SISMOS"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: FutureBuilder(
            future: provider.getEarthquakesList(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: provider.earthquakeList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title:
                            Text(provider.earthquakeList[index].refGeografica),
                      );
                    });
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("Error"),
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}
