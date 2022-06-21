import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_aplication/Place/ui/widgets/card_image_list.dart';
import 'package:platzi_trips_aplication/User/bloc/bloc_user.dart';
import 'package:platzi_trips_aplication/User/model/user.dart';
import 'package:platzi_trips_aplication/widgets/gradient_back.dart';
class headerAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    BlocUser userBloc;
    userBloc = BlocProvider.of(context);
    return StreamBuilder(
        stream: userBloc.authStatus,
        builder: (BuildContext context, AsyncSnapshot snapshot){
          switch(snapshot.connectionState){
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.active:
            case ConnectionState.done:
            default:
              return showPlacesData(snapshot);
          }
        });
    /*return Stack(
      children: <Widget>[
        GradientBack(250,"Popular"),
        CardImageList()
      ],
    );*/
  }
  Widget showPlacesData(AsyncSnapshot snapshot){
    if(!snapshot.hasData || snapshot.hasError){
      return Stack(
        children: [
          GradientBack(250.0, ""),
          Text("Usuario no logeado. Haz Login")
        ],
      );
    }else{
      UserLocal user = UserLocal(
          uid: snapshot.data.uid,
          userName: snapshot.data.displayName,
          userEmail: snapshot.data.email,
          photoURL: snapshot.data.photoURL
      );
      return Stack(
        children: [
          GradientBack(250.0, ""),
          CardImageList(user: user,),
        ],
      );
    }
  }

}