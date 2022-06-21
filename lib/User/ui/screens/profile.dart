import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_aplication/User/model/user.dart';
import 'package:platzi_trips_aplication/User/ui/widgets/image_bookmark_list_view.dart';
import 'package:platzi_trips_aplication/User/ui/widgets/profile_floating_button.dart';
import 'package:platzi_trips_aplication/User/ui/screens/profile_header.dart';
import 'package:platzi_trips_aplication/User/ui/widgets/profile_floating_button_list.dart';

import '../../bloc/bloc_user.dart';
class Profile extends StatelessWidget {
  late BlocUser userBloc;
  Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    userBloc = BlocProvider.of<BlocUser>(context);
     return  StreamBuilder(
        stream: userBloc.authStatus,
        builder: (BuildContext context, AsyncSnapshot snapshot){
          switch(snapshot.connectionState){
            case ConnectionState.none:
            case ConnectionState.waiting:
                return const CircularProgressIndicator();
            case ConnectionState.active:
            case ConnectionState.done:
            default:
              return showProfileData(snapshot);
          }
        },
      );
  }

  Widget showProfileData(AsyncSnapshot snapshot){
    if(!snapshot.hasData || snapshot.hasError){
      print("No logeado");
      return Stack(
        children: const <Widget>[
          Text("Usuario no logeado haz Login")
        ],
      );
    }else{
      print("Usuario Logeado");
      var user= UserLocal(uid: snapshot.data.uid, userName: snapshot.data.displayName, userEmail: snapshot.data.email, photoURL: snapshot.data.photoURL);
      return Stack(
        children: <Widget>[
          ListView(children:<Widget>[ImageBookmarkListView(user: user,)]),
          ProfileHeader(user: user,),
          const ProfileFloatingButtonList(),
        ],
      );
    }
  }
}