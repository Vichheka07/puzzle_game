import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:puzzle_game/controllers/controller.dart';
import 'package:puzzle_game/screen/menu.dart';

import '../widget/Bord.dart';
import '../widget/grid.dart';
import '../widget/mytitle.dart';

class EasyScreen extends StatefulWidget {
  const EasyScreen({super.key});

  @override
  State<EasyScreen> createState() => _EasyScreenState();
}

class _EasyScreenState extends State<EasyScreen> {
  var numbers = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,0];
  int move = 0;
  int secondsPassed= 0;
  late Timer? timer;
  bool success = false;
  Duration duration = const Duration(seconds: 1);



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    numbers;
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
    final size = MediaQuery.of(context).size;
    int count = 0;
    return SafeArea(
        child: Container(
          height: size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/back ground_.png"),fit: BoxFit.fill,
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MyTitle(size,"assets/level Easy.png"),
              Grid(numbers,size,clickGrid,4,success),
              Bord(size),
              Menu(reset,move,size,secondsPassed),
            ],
          ),
        ));
   }
  void clickGrid(index){
      if(index - 1 >= 0 && numbers[index - 1] == 0 && index % 4 != 0 ||
          //left
        index + 1 < 16 && numbers[index + 1] == 0 && (index + 1) % 4 !=0 ||
          //Right
          (index - 4 >= 0 && numbers[index - 4] == 0) ||
          //up
          (index + 4 <=16 && numbers[index + 4] == 0)
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
  bool isSorted(List list){
    int prev = list.first;
    debugPrint("list fist $prev");
    for (var i =1; i< list.length - 1; i++){
      int next = list[i];
      debugPrint("next $next");
      if(prev > next) return false;
      prev = next;
    }
    return true;
  }
  void checkWin(){
    if(isSorted(numbers)){
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
      numbers.shuffle();
      success = false;
      move = 0;
      secondsPassed = 0;
    });
  }

}
