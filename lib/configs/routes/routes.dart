import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/routes/routes_names.dart';
import 'package:flutter_application_1/ui/view/categories_view.dart';
import 'package:flutter_application_1/ui/view/home_view.dart';
import 'package:flutter_application_1/ui/view/splash_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.Splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => splashView());

      case RoutesNames.Home:
        return MaterialPageRoute(
            builder: (BuildContext context) => home_view());

      case RoutesNames.Category_view:
        return MaterialPageRoute(
            builder: (BuildContext context) => categoriesView());

      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text("No Route Defined"),
            ),
          );
        });
    }
  }
}
