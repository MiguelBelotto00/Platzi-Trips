import 'package:flutter/material.dart';
import 'package:platzi_trips_aplication/widgets/button.dart';

class DescriptionPlace extends StatelessWidget{
  String namePlace;
  int stars;
  String descriptionPlace;
  DescriptionPlace(this.namePlace,this.stars,this.descriptionPlace);

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    final starBorder= Container(margin: const EdgeInsets.only(
      top:320.0, //320
      right: 3.0,
    ),
        child: const Icon(
          Icons.star_border,
          color: Color(0xFFf2c611),
        ));
    final starHalf= Container(margin: const EdgeInsets.only(
      top:320.0, //320
      right: 3.0,
    ),
        child: const Icon(
          Icons.star_half,
          color: Color(0xFFf2c611),
        ));

    final star = Container(
      margin: const EdgeInsets.only(
        top:320.0, //320
        right: 3.0,
      ),
      child: const Icon(
        Icons.star,
        color: Color(0xFFf2c611),
      ),
    );
    final description = Container(
      margin: const EdgeInsets.only(
        top: 20.0,
        right: 20.0,
        left: 20.0,
      ),
      child: Text(
        descriptionPlace,
        style: const TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.bold,
          fontFamily: "Lato"
        ),
        textAlign: TextAlign.left,
    ) ,
    );
    final titleStars = Row(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(
            top: 320.0, //320
            left: 20.0,
            right: 20.0,
          ),
          child: Text(
            namePlace,
            style: const TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.w900,
              fontFamily: "Lato",
            ),
            textAlign: TextAlign.left,
          ),
        ),
        Row(
          children:<Widget> [
            star,
            star,
            star,
            starHalf,
            starBorder
          ],
        ),
      ],
    );
    final descriptionZone = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        titleStars,
        description,
        ButtonPurple(buttonText: "Navigate", onPressed: (){

        },)
      ],
    );


    return descriptionZone;
  }

}