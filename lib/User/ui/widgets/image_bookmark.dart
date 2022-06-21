import 'package:flutter/material.dart';
import 'package:platzi_trips_aplication/Place/model/place.dart';

class ImageBookmark extends StatelessWidget {
  final Place place;
  const ImageBookmark(this.place, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final Image = Container(
      height: 250.0,
      width: 500.0,
      margin: const EdgeInsets.only(top: 50.0, right: 20.0, left: 20.0),
      decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(place.urlImage),
            fit: BoxFit.cover,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(40)),
          boxShadow: const <BoxShadow>[
            BoxShadow(
                color: Colors.black,
                blurRadius: 15.0,
                offset: Offset(0.0, 7.0)),
          ]),
    );

    final titledescription = Container(
      margin: const EdgeInsets.only(
        top: 10,
      ),
      child: Text(
        place.name,
        textAlign: TextAlign.left,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          fontFamily: "Lato",
        ),
      ),
    );

    final ubicationPlace = Container(
      margin: const EdgeInsets.only(
        top: 10,
      ),
      child: Text(
        place.description,
        textAlign: TextAlign.left,
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 15.0,
          fontWeight: FontWeight.bold,
          fontFamily: "Lato",
        ),
      ),
    );

    final stepsCount = Container(
      margin: const EdgeInsets.only(top: 10, left: 10.0, right: 10.0),
      color: Colors.white,
      child: Text(
        "Place Likes: ${place.likes}",
        textAlign: TextAlign.left,
        style: const TextStyle(
          color: Colors.orange,
          fontSize: 15.0,
          fontWeight: FontWeight.bold,
          fontFamily: "Lato",
        ),
      ),
    );

    final descriptionPlaceProfile = Container(
      height: 120.0,
      width: 250.0,
      margin: const EdgeInsets.only(top: 250, left: 80.0, right: 80.0),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black45,
                blurRadius: 15.0,
                offset: Offset(0.0, 7.0)),
          ]),
      child: Column(
        children: [titledescription, ubicationPlace, stepsCount],
      ),
    );

    return Stack(
      children: [Image, descriptionPlaceProfile],
    );
  }
}
