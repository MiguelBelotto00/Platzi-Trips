import 'package:flutter/material.dart';

class ProfileFloatingButton extends StatefulWidget {
  final bool mini;
  final IconData iconbutton;
  final VoidCallback onPressedButton;
  final double iconSize;
  final Color color;
  final Object? heroTag;
  const ProfileFloatingButton(
      {required this.mini,
      required this.iconbutton,
      required this.onPressedButton,
      required this.iconSize,
      required this.color,
      required this.heroTag,
      Key? key})
      : super(key: key);
  @override
  State<ProfileFloatingButton> createState() => _ProfileFloatingButton();
}

class _ProfileFloatingButton extends State<ProfileFloatingButton> {
  void onPressedButton(String key) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
      child: FloatingActionButton(
        key: const Key("Bookmark"),
        backgroundColor: widget.color,
        mini: widget.mini,
        tooltip: "Bookmark",
        onPressed: widget.onPressedButton,
        heroTag: widget.heroTag,
        child: Icon(
          widget.iconbutton,
          size: widget.iconSize,
          color: Colors.green,
        ),
      ),
    );
  }
}
