import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/routes/routes.dart';
import 'package:flutter_application_1/configs/routes/routes_names.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: RoutesNames.Splash,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
