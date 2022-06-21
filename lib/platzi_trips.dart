import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_aplication/Place/ui/screens/home_trip.dart';
import 'package:platzi_trips_aplication/User/bloc/bloc_user.dart';
import 'package:platzi_trips_aplication/User/ui/screens/profile.dart';
import 'package:platzi_trips_aplication/Place/ui/screens/search_trips.dart';
class PlatziTrips extends StatefulWidget {
  const PlatziTrips({Key? key}) : super(key: key);

  @override
  State<PlatziTrips> createState()=> _PlatziTrips();

}
class _PlatziTrips extends State<PlatziTrips>{
  int indexTap = 0;

  final List<Widget> widgetsChildren = [
    HomeTrips(),SearchTrips(),Profile(),
  ];
  void onTapTapped(int index){
    setState(() {
      indexTap = index;
    });

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      body: BlocProvider<BlocUser>(
          bloc: BlocUser(),
          child: widgetsChildren[indexTap]),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
          primaryColor: Colors.green,
        ),
        child: BottomNavigationBar(
          onTap: onTapTapped,
          currentIndex: indexTap,
          items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, color: Colors.green,),
            label: "Inicio"
          ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map_outlined,color: Colors.green,),
              label: "Rutas"
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline,color: Colors.green,),
              label: "Perfil"
            ),
        ],),
      ),
    );
  }

}