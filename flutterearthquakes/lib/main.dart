import 'package:flutter/material.dart';
import 'package:flutterearthquakes/features/earthquakes/presentation/providers/earthquake_provider.dart';
import 'package:flutterearthquakes/features/earthquakes/presentation/views/main_page.dart';
import 'package:flutterearthquakes/resources/colors.dart';
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
        title: 'Flutter Earthquakes',
        theme: ThemeData(
          fontFamily: 'Montserrat',
          backgroundColor: backgroundColor,
        ),
        home: const EarthquakeListPage(),
      ),
    );
  }
}
