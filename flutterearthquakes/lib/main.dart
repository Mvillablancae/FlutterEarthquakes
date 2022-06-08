import 'package:flutter/material.dart';
import 'package:flutterearthquakes/features/earthquakes/presentation/providers/earthquake_provider.dart';
import 'package:flutterearthquakes/features/earthquakes/presentation/views/main_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EarthquakeProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const EarthquakeListPage(),
      ),
    );
  }
}
