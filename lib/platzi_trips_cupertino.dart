import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_aplication/Place/ui/screens/home_trip.dart';
import 'package:platzi_trips_aplication/User/bloc/bloc_user.dart';
import 'package:platzi_trips_aplication/User/ui/screens/profile.dart';
import 'package:platzi_trips_aplication/Place/ui/screens/search_trips.dart';
class PlatziTripsCupertino extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw Scaffold(
      bottomNavigationBar: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.green,),label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.search, color: Colors.green,),label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.person, color: Colors.green,),label: ""),
          ],
        ),
        tabBuilder: (BuildContext context, int index){
          switch(index){
            case 0:
              return CupertinoTabView(
                builder: (BuildContext context) => HomeTrips(),
              );
              break;
            case 1:
              return CupertinoTabView(
                builder: (BuildContext context) => SearchTrips(),
              );
              break;
            case 2:
              return CupertinoTabView(
                builder: (BuildContext context) => BlocProvider(bloc: BlocUser(), child: Profile()),
              );
              break;
            default:
              return (CupertinoTabView(
                builder: (BuildContext context) => HomeTrips(),
              ));
          }
        },
      ),
    );
  }

}