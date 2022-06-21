import 'package:flutter/material.dart';
import 'package:platzi_trips_aplication/Place/ui/widgets/review_list.dart';

import '../widgets/description_place.dart';
import 'header_app_bar.dart';

class HomeTrips extends StatelessWidget{
  String descriptionDummy ="Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor s simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s" ;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children:<Widget>[
        ListView(
          children: <Widget>[
            DescriptionPlace("Bahamas", 4, descriptionDummy),
            ReviewList()
          ],
        ),
        headerAppBar(),
      ],
    );
  }

}