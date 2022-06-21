import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:platzi_trips_aplication/widgets/floating_action_button_green.dart';
class CardImage extends StatelessWidget{
  final String pathImage;
  final double height;
  final double width;
  final double left;
  final VoidCallback onPressedFabIcon;
  final IconData iconData;
  const CardImage({Key? key,required this.pathImage, required this.height, required this.width, required this.onPressedFabIcon, required this.iconData, required this.left}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final card = Container(
      height: height,
      width: width,
      margin: EdgeInsets.only(
        left: left,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: pathImage.contains('http') ? NetworkImage(pathImage) : FileImage(File(pathImage)) as ImageProvider
        ),
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      shape: BoxShape.rectangle,
      boxShadow: const <BoxShadow>[
        BoxShadow(
          color: Colors.black,
          blurRadius: 15.0,
          offset: Offset(0.0,7.0)
        )
      ]
      ),
    );

    return Stack(
      alignment: const Alignment(0.9,1.1),
      children: <Widget>[
        card,
       FloatingActionButtonGreen(iconData: iconData,onPressed: onPressedFabIcon,)
      ],
    );
  }

}