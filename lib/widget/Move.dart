import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Move extends StatelessWidget {
  int move;
  Move(this.move,{super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 10),
      height: 100,
      width: 100,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/Artboard 7.png")
        )
      ),
      child: Center(
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            move.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              decoration: TextDecoration.none
            ),
          ),
        ),
      ),
    );
  }
}
// Text(
// "Move: $move",
// style: const TextStyle(
// color: Colors.white,
// decoration: TextDecoration.none,
// fontSize: 18,
// ),
// ),