import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:puzzle_game/controllers/controller.dart';
import 'package:puzzle_game/screen/menu.dart';
import 'package:puzzle_game/widget/mytitle.dart';

import '../screen/SplashScreen.dart';
import '../widget/Bord.dart';
import '../widget/grid.dart';

class HardScreen extends StatefulWidget {
  const HardScreen({super.key});

  @override
  State<HardScreen> createState() => _HardScreenState();
}

class _HardScreenState extends State<HardScreen> {
  var numbers = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,0];
  var move = 0;
  var secondsPassed = 0;
  late Timer timer;
  bool success = false;
  Duration duration = Duration(seconds: 1);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    numbers.shuffle();
    timer = Timer.periodic(duration, (t) {
      setState(() {
        secondsPassed++;
      });
      if(success){
        timer.cancel();
      }
    });
  }
  AudioPlayer gameSound =AudioPlayer();
  void callGameSuccess(){
    gameSound.play(AssetSource('sound-effect-twinklesparkle-115095.mp3'));
  }
  void callGameClick(){
    gameSound.play(AssetSource('shooting-sound-fx-159024.mp3'));
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
          height: hieght,
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/back ground_.png"),fit: BoxFit.fill,
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  MyTitle(size, "assets/level Hard_.png"),
                  Grid(numbers,size,clickGrid,6,success),
                  Bord(size),
                  Menu(reset, move, size, secondsPassed)
                ],
              )
            ],
          ),
        ));
  }
  void clickGrid(index){
    if(index - 1 >= 0 && numbers[index - 1] == 0 && index % 6 != 0 ||
        //left
        index + 1 < 36 && numbers[index + 1] == 0 && (index + 1) % 6 !=0 ||
        //Right
        (index - 6 >= 0 && numbers[index - 6] == 0) ||
        //up
        (index + 6 <=36 && numbers[index + 6] == 0)
    //down
    ){
      setState(() {
        callGameClick();
        numbers[numbers.indexOf(0)] = numbers[index];
        numbers[index] = 0;
        move ++;
      });
    }
    checkWin();
  }
  bool isShort(List list){
    int prev = list.first;
    for(int i = 1;i<list.length-1;i++){
      int next = list[i];
      if(prev>next) return false;
    }
    return true;
  }
  checkWin(){
    if(isShort(numbers)){
      showDialog(context: context, builder: (context){
        callGameSuccess();
        success = true;
        return Image.asset("assets/you_win_text.png");
      });
    }
  }
  void reset(){
    setState(() {
      success = false;
      numbers.shuffle();
      move = 0;
      secondsPassed = 0;
    });
  }
}
