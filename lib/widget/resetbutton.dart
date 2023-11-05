import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetButton extends StatelessWidget {
  Function reset;
  ResetButton(this.reset);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        reset();
      },
      child: Container(
        child: Image.asset("assets/Artboard 6.png",width: 100.w,),
      ),
    );
  }
}
