import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTitle extends StatelessWidget {
  var size;
  var level;
  MyTitle(this.size,this.level, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.10.h,
      padding: EdgeInsets.only(top: 5.0.h),
      child: Image.asset(level)
    );
  }
}
