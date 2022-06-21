import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_aplication/User/bloc/bloc_user.dart';
import 'package:platzi_trips_aplication/widgets/gradient_back.dart';
import 'package:platzi_trips_aplication/User/ui/widgets/profile_information.dart';
import 'package:platzi_trips_aplication/User/model/user.dart';
class ProfileHeader extends StatelessWidget {
  final UserLocal user;

  const ProfileHeader({Key? key, required this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        GradientBack(250.0,"Perfil"),
        ProfileInformation(user: user),
      ],
    );
  }
  Widget showProfileData(AsyncSnapshot snapshot){
    if(!snapshot.hasData || snapshot.hasError ){
      return Stack(
        children: <Widget>[
          GradientBack(250.0,"Profile"),
          const CircularProgressIndicator(),
          const Text("No se pudo cargar la informacion. Haz login"),
        ],
      );
    }else{
      return Stack(
        children: <Widget>[
          GradientBack(250.0,"Profile"),
          ProfileInformation(user: user),
        ],
      );
    }
}

}