import 'dart:async';

import 'package:flutter/material.dart';
import 'package:plant_ui/View/home_page.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 2000), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage(),));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                  text: "Plants",style: TextStyle(color: Colors.green,fontSize: 40,fontWeight: FontWeight.bold),
          ),
              TextSpan(
                text: ".",style: TextStyle(color: Colors.deepOrangeAccent,fontSize: 80,fontWeight: FontWeight.bold),
              )
            ]
          ),
        ),
      ),
    );
  }
}
