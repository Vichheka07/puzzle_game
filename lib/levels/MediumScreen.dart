import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:puzzle_game/controllers/controller.dart';
import 'package:puzzle_game/screen/SplashScreen.dart';
import 'package:puzzle_game/screen/menu.dart';
import 'package:puzzle_game/widget/mytitle.dart';

import '../widget/Bord.dart';
import '../widget/grid.dart';

class MediumScreen extends StatefulWidget {
  const MediumScreen({super.key});

  @override
  State<MediumScreen> createState() => _MediumScreenState();
}

class _MediumScreenState extends State<MediumScreen> {
  var numbers = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,0];
  var move = 0;
  var secondsPassed = 0;
  bool success = false;
  Duration duration = const Duration(seconds: 1);
  Timer? timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    numbers.shuffle();
    timer = Timer.periodic(duration, (timer) {
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
              MyTitle(size,"assets/level Hard  copy.png"),
              Grid(numbers,size,clickGrid,5,success),
              Bord(size),
              Menu(reset, move, size, secondsPassed)
            ],
          ),
        )
    );
  }
  void clickGrid(index){
    if(index - 1 >= 0 && numbers[index - 1] == 0 && index % 5 != 0 ||
        //left
        index + 1 < 25 && numbers[index + 1] == 0 && (index + 1) % 5 !=0 ||
        //Right
        (index - 5 >= 0 && numbers[index - 5] == 0) ||
        //up
        (index + 5 <=25 && numbers[index + 5] == 0)
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
    for(int i =1;i < list.length -1; i ++){
      int next = list[i];
      if(prev > next) return false;
      prev = next;
    }
    return true;
  }
  void checkWin(){
    if(isShort(numbers)){
      callGameSuccess();
      success = true;
      showDialog(
          context: context, builder: (context){
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
