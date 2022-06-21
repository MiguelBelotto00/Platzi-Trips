import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_aplication/User/bloc/bloc_user.dart';
import 'package:platzi_trips_aplication/User/model/user.dart';

class ImageBookmarkListView extends StatelessWidget {
  late BlocUser userBloc;
  final UserLocal user;

  ImageBookmarkListView({Key? key, required this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    userBloc = BlocProvider.of<BlocUser>(context);
    return Container(
      height: 850.0,
      margin: const EdgeInsets.only(
        top: 210.0,
      ),
      child: StreamBuilder(
        stream: userBloc.myPlacesListStream(user.uid),
        builder: (context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const CircularProgressIndicator();
            case ConnectionState.active:
            case ConnectionState.done:
            default:
              return Column(
                  children: userBloc.buildPlaces(snapshot.data.docs));
          }
        },
      ),
    );
  }
}
