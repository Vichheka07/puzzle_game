import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:puzzle_game/widget/Move.dart';
import 'package:puzzle_game/widget/timer.dart';

import '../widget/resetbutton.dart';
class Menu extends StatelessWidget {
  Function reset;
  int move;
  var size;
  int secondsPassed;
  Menu(this.reset,this.move,this.size,this.secondsPassed ,{super.key});


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.10.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ResetButton(reset),
          Move(move),
          Time(secondsPassed)
        ],
      ),
    );
  }
}

