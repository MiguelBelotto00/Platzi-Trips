import 'package:flutter/material.dart';
class GradientBack extends StatelessWidget{
  String title ;
  double height = 0.0;
  GradientBack(this.height,this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: height ,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF3D8335),
            Color(0xFF3A7034)
          ],
          begin: FractionalOffset(0.2, 0.0),
          end: FractionalOffset(1.0, 0.6),
          stops: [0.0, 0.6],
          tileMode: TileMode.clamp
        )
      ),
      alignment: const Alignment(-0.9,-0.6),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontFamily: "Lato",
            fontWeight: FontWeight.w900
          ),
        ),
    );
  }

}