import 'package:flutter/material.dart';
import 'package:platzi_trips_aplication/Place/ui/widgets/review.dart';

class ReviewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
     children: <Widget>[
        Review("assets/img/doctorstrange.jpg", "Doctor Strange", "1 Review 19 Fotos", "Lindo Lugar para vinito"),
       Review("assets/img/Richard-ortiz.png", "Richard Ortiz", "67 Review 92 Fotos", "Richard ortiz soy"),
       Review("assets/img/people.jpg", "Lionel Messi", "1 Review 1 Fotos", "Lindo Lugar para mates")
     ]
    );
  }

}