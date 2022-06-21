import 'package:flutter/material.dart';
class FloatingActionButtonGreen extends StatefulWidget{
  final IconData iconData;
  final VoidCallback onPressed;
  const FloatingActionButtonGreen({Key? key, required this.iconData, required this.onPressed}) : super(key: key);

  @override
  State<FloatingActionButtonGreen> createState() => _FloatingActionButtonGreenState();
}
class _FloatingActionButtonGreenState extends State<FloatingActionButtonGreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FloatingActionButton(
      heroTag: null,
      backgroundColor: Color(0xFF11DA53),
      mini: true,
      tooltip: "Fav",
      onPressed: widget.onPressed,
      child: Icon(widget.iconData),

    );
  }
  
}