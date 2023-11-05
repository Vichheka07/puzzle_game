import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:puzzle_game/controllers/controller.dart';

class Bord extends StatelessWidget {
  var size;
  Bord(this.size,{super.key});

  @override
  Widget build(BuildContext context) {
    var width = size.width;
    return Container(
      width: width,
      height: 100.h,
      decoration: const BoxDecoration(
          image:DecorationImage(
              image: AssetImage("assets/Artboard 5.png"),
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset("assets/${gameController.level.value}.png",height: 80.h,),
          Image.asset("assets/${gameController.level.value}/0.png",height: 80.h,),
        ],
      ),
    );
  }
}
