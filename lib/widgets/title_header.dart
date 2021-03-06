import 'package:flutter/material.dart';
class TitleHeader extends StatelessWidget{
  final String title;
  const TitleHeader({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Text(
            title,
            style: const TextStyle(
             color: Colors.white,
             fontSize: 30.0,
             fontFamily: "Lato",
             fontWeight: FontWeight.bold,
            ),
          );
  }

}