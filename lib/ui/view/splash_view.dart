import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/routes/routes_names.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class splashView extends StatefulWidget {
  const splashView({super.key});

  @override
  State<splashView> createState() => _splashViewState();
}

class _splashViewState extends State<splashView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushNamed(context, RoutesNames.Home);
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;

    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/Image.png',
              fit: BoxFit.cover,
              width: width * .9,
              height: height * .5,
            ),
            SizedBox(
              height: height * 0.04,
            ),
            Center(
              child: Text(
                "TOP HEADLINES",
                style: GoogleFonts.anton(
                    letterSpacing: 6, color: Colors.grey.shade700),
              ),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            SpinKitSquareCircle(
              color: Colors.blue,
              size: 40,
            )
          ],
        ),
      ),
    );
  }
}
