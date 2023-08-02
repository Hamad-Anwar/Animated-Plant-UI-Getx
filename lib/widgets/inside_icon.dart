
import 'package:flutter/material.dart';

class InsideIcon extends StatelessWidget {
  const InsideIcon({super.key, required this.data});

  final IconData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: 40,
      width: 40,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(
              color: Colors.white
          )
      ),
      child: Icon(data, color: Colors.white,),
    );
  }
}