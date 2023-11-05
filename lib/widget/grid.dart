import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:puzzle_game/controllers/controller.dart';
import 'package:puzzle_game/screen/SplashScreen.dart';

import 'gridbutton.dart';

class Grid extends StatelessWidget {
  var numbers = [];
  var size;
  Function clickGrid;
  var cross;
  var success;
  Grid(this.numbers,this.size,this.clickGrid,this.cross,this.success, {super.key});
  var isSound = false;

  @override
  Widget build(BuildContext context) {
    var height = size.height;
    return Container(
      height: 450.w,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/Artboard 4.png"),
        )
      ),
      child: SizedBox(
        height: height * 0.60.w,
        child: Padding(
          padding: EdgeInsets.all(8.0.h),
          child:   GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: cross,
                  mainAxisSpacing: 5.w,
                  crossAxisSpacing: 5.w
                ),
                itemCount:numbers.length,
                itemBuilder: (context,index){

                  if(success){
                    return Obx(()=> Image.asset("assets/${gameController.level.value}/${numbers[index]}.png"));
                  }else{
                    return numbers[index] != 0 ?Obx(
                        ()=> GridButton("assets/${gameController.level.value}/${numbers[index]}.png",(){
                      clickGrid(index);
                    }),
                        ):SizedBox.shrink();
                  }
                }),

        ),
      ),
    );
  }
}
