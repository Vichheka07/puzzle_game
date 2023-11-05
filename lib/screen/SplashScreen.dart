import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'HomeScreen.dart';

var size,hieght,width;
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // callHomeScreen();
  }
  // void callHomeScreen(){
  //   Timer(const Duration(seconds: 10),(){
  //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
  //   });
  // }
  @override
  Widget build(BuildContext context) {

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,overlays: []);
    size = MediaQuery.of(context).size;
    hieght = size.height;
    width = size.width;
    return Scaffold(
      body: Container(
        height: hieght,
        width: width,
        decoration: const BoxDecoration(
        image:DecorationImage(
          image: AssetImage("assets/back ground_.png"),fit: BoxFit.fill
        )
        ),
        child: Column(
          children: [
            SizedBox(
              height: 160.w,
            ),
              SizedBox(
                  height: 200.w,
                  child: Image.asset("assets/puzzle  shap.png")),
            const SizedBox(
              height: 100,
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                });
              },
              child: SizedBox(
                width: 200.w,
                child: Image.asset("assets/Next.png"),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            GestureDetector(
              onTap: (){
                exit(0);
              },
              child: SizedBox(
                width: 200.w,
                child: Image.asset("assets/Back.png"),
              ),
            ),
          ],
        ),
      )
    );
  }
}
