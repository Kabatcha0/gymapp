import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gym_app/components/components.dart';
import 'package:gym_app/layout/layout.dart';
import 'package:gym_app/modules/onBoarding.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      navigatorAndPushReplacement(context: context, widget: OnBoarding());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 220,
                      height: 220,
                      child: Image.asset(
                        "assets/splash.jpg",
                      ))
                ],
              ))),
    );
  }
}
