import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:puzzle_game/controllers/controller.dart';
import 'package:puzzle_game/levels/EasyScreen.dart';
import 'package:puzzle_game/levels/HardScreen.dart';

import '../levels/MediumScreen.dart';
import 'SplashScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // void _handleItemsClick(int index){
  //   setState(() {
  //     switch (index){
  //       case 0:
  //
  //         Navigator.push(context, MaterialPageRoute(builder: (context)=> const EasyScreen()));
  //       break;
  //       case 1:
  //         Navigator.push(context, MaterialPageRoute(builder: (context)=> const MediumScreen()));
  //         break;
  //       default:
  //         Navigator.push(context, MaterialPageRoute(builder: (context)=> const HardScreen()));
  //         break;
  //     }
  //
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    var width;
    size = MediaQuery.of(context).size;
    hieght = size.height;
    width = size.width;
    return Scaffold(
      body: Center(
        child: Container(
          height: hieght,
          width: width,
          decoration: const BoxDecoration(
              image:DecorationImage(
                  image: AssetImage("assets/back ground_.png"),fit: BoxFit.fill
              )
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 26.w),
                  height: 300.w,
                  width: width,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/puzzle1.png"),
                      )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          gameController.level.value = 'easy';
                          setState(() {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>EasyScreen()));
                          });
                        },
                        child: Image.asset("assets/4x4.png",width: 100.w),
                      ),
                      GestureDetector(
                        onTap: (){
                          gameController.level.value = 'medium';
                          setState(() {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>MediumScreen()));
                          });
                        },
                       child: Image.asset("assets/5x5.png",width: 100.w,)
                      ),
                      GestureDetector(
                        onTap: (){
                          gameController.level.value = 'hard';
                          setState(() {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>HardScreen()));
                          });
                        },
                       child: Image.asset("assets/6x6.png",width: 100.w,))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Container(
// height: height,
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: List.generate(level.length, (index){
// return GestureDetector(
// onTap: (){
// setState(() {
// _handleItemsClick(index);
// });
// },
// child: CardLevel(level: Text(level[index])));
// }),
// ),
// ),