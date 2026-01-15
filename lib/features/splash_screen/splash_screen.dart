import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/core/theme/colors_palette.dart';
import '../../../core/config/page_routes_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2),
            () => Navigator.pushReplacementNamed(context, PageRoutesName.register));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color:ColorsPalette.primaryColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                      decoration: BoxDecoration(
                      border: Border.all(color: ColorsPalette.secondColor, width: 3), // Set the color and width of the border
                  borderRadius: BorderRadius.circular(20),),
                  child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/icon/resto_icon.png',
                    scale: 2,
                  ),
                ),
              ),
              const Text('Resto'),
            ],
          ),

      ),
      )
    );
  }
}
