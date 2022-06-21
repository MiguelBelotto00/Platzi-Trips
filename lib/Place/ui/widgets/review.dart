import 'package:flutter/material.dart';
class Review extends StatelessWidget{
  String name ;
  String details ;
  String comment ;
  String pathImage ;

  Review(this.pathImage,this.name,this.details, this.comment);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final starsBorder= Container(margin: const EdgeInsets.only(
      top:3.0,
      right: 3.0,
      left: 5.0
    ),
        child: const Icon(
          Icons.star_border,
          color: Color(0xFFf2c611),
          size: 15.0,
        ));
    final starsHalf= Container(margin: const EdgeInsets.only(
      top:3.0,
      right: 3.0,
      left: 5.0
    ),
        child: const Icon(
          Icons.star_half,
          color: Color(0xFFf2c611),
          size: 15.0,
        ));

    final stars = Container(
      margin: const EdgeInsets.only(
        top:3.0,
        right: 3.0,
        left: 5.0
      ),
      child: const Icon(
        Icons.star,
        color: Color(0xFFf2c611),
        size: 15.0,
      ),
    );
   final rowOfStars= Row(
     children: <Widget>[
       stars,
       stars,
       stars,
       starsHalf,
       starsBorder
     ],
   );
   final userComment = Container(
     margin: const EdgeInsets.only(
         left: 20.0
     ),
     child: Text(
       comment,
       textAlign: TextAlign.left,
       style: const TextStyle(
           fontSize: 13.0,
           fontFamily: "Lato",
          fontWeight: FontWeight.w900
       ),
     ),
   );


    final userInfo = Container(
      margin: const EdgeInsets.only(
          left: 20.0
      ),
      child: Text(
        details,
        textAlign: TextAlign.left,
        style: const TextStyle(
          fontSize: 13.0,
          fontFamily: "Lato",
          color: Color(0xFFa3a5a7)
        ),
      ),
    );

    final userName = Container(
      margin: const EdgeInsets.only(
        left: 20.0
      ),
      child: Text(
        name,
        textAlign: TextAlign.left,
        style: const TextStyle(
          fontSize: 16.0,
          fontFamily: "Lato",
        ),
      ),
    );

    final userInfoStars = Row(
      children: <Widget>[
        userInfo,
        rowOfStars
      ],
    );

    final userDetails = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        userName,
        userInfoStars,
        userComment,
      ],
    );

    final photo = Container(
      margin: const EdgeInsets.only(
        top: 20.0,
        left: 20.0,
      ),
      width: 80.0,
      height: 80.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(pathImage),
        ),
      ),
    );


    return Row(
      children: <Widget>[
        photo,
        userDetails,
      ],
    );
  }

}