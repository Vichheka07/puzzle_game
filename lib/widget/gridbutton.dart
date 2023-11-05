import 'package:flutter/material.dart';

class GridButton extends StatelessWidget {
  Function click;
  String image;
  GridButton(this.image, this.click);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        click();
      },
      child: Image.asset(
          image),
    );
  }
}

// Text(
// text,
// style: const TextStyle(
// fontSize: 30,
// fontWeight: FontWeight.bold,
// color: Colors.black
// ),
// )

// ElevatedButton(
// style: ElevatedButton.styleFrom(
// backgroundColor: Colors.white,
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(8.0)
// ),
// ),
// onPressed: (){
// click();
// },
// child: Container(
// child: Image.asset(
// image,
// fit: BoxFit.cover,
// ),
// ),
// );