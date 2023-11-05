import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardLevel extends StatelessWidget {
  const CardLevel({super.key, required this.level});
  final Text level;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16.w),
      alignment: Alignment.center,
      color: Colors.green,
      height: 100.w,
      width: 100.w,
      child: level,
    );
  }
}
