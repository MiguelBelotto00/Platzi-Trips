import  'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_aplication/Place/ui/widgets/card_image.dart';
import 'package:platzi_trips_aplication/User/bloc/bloc_user.dart';
import 'package:platzi_trips_aplication/User/model/user.dart';
import '../../model/place.dart';
class CardImageList extends StatefulWidget {
  late UserLocal user;

  CardImageList({Key? key, required this.user}) : super(key: key);
  @override
  State<CardImageList> createState() => _CardImageList();
}
  late BlocUser userBloc;
class _CardImageList extends State<CardImageList> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    userBloc = BlocProvider.of<BlocUser>(context);
    return Container(
        height: 350.0,
        child: StreamBuilder(
          stream: userBloc.placesStream,
          builder: (context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const CircularProgressIndicator();
              case ConnectionState.active:
              case ConnectionState.done:
              default:
                return listViewPlaces(userBloc.buildStandardPlaces(snapshot.data.docs, widget.user));
            }
          },
        )
    );
  }

  Widget listViewPlaces(List<Place> places) {
    void setLiked(Place place){
      setState((){
        place.liked = !place.liked;
        userBloc.likePlace(place, widget.user.uid);
      });
    }
    IconData iconDataLiked = Icons.favorite;
    IconData iconDataLike = Icons.favorite_border;
    return ListView(
      padding: const EdgeInsets.all(25),
      scrollDirection: Axis.horizontal,
      children: places.map((place){
        return CardImage(pathImage: place.urlImage,
            height: 250.0,
            width: 300.0,
            onPressedFabIcon: (){
              setLiked(place);
            },
            iconData: place.liked ? iconDataLiked:iconDataLike,
            left: 20.0);
      }).toList(),
    );
  }
}