import 'package:flutter/material.dart';

class Time extends StatelessWidget {
  int secondsPressed;
  Time(this.secondsPressed,{super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 8,top: 10),
      height: 90,
      width: 100,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/Artboard 8.png"),
        )
      ),
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          "$secondsPressed",
          style:  const TextStyle(
            color: Colors.white,
            fontSize: 18,
            decoration: TextDecoration.none,
          ),
        ),
      )
    );
  }
}
