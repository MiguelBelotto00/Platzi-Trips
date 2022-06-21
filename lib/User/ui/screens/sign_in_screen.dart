import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:platzi_trips_aplication/User/model/user.dart';
import 'package:platzi_trips_aplication/platzi_trips.dart';
import 'package:platzi_trips_aplication/widgets/button_green.dart';
import 'package:platzi_trips_aplication/widgets/gradient_back.dart';
import 'package:platzi_trips_aplication/User/bloc/bloc_user.dart';
class SignInScreen extends StatefulWidget{
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreen();
}
class _SignInScreen extends State<SignInScreen>{
  late BlocUser userBloc;
  late AsyncSnapshot snapshot;
  late double widthScreen;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    userBloc = BlocProvider.of(context);
    widthScreen = MediaQuery.of(context).size.width;
    return _handleCurrentStatusSession();
  }
  Widget signInGooUi(){
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GradientBack(MediaQuery.of(context).size.height,""),
          Container(
            margin: const EdgeInsets.only(
              top: 250,
            ),
            child: Column(
              children:  <Widget>[
                Flexible(child: Container(
                  width: widthScreen - (widthScreen/14),
                  child: const FittedBox(
                    fit: BoxFit.contain,
                    child:Text("Welcome \n This is your Travel App",
                    style: TextStyle(
                        fontSize: 37.0,
                        fontFamily: "Lato",
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                  ),),
                ), ),
                ButtonGreen(width: 300.0, height: 50.0, text: "Login with Gmail",onPressed: () {
                  userBloc.signOut();
                  userBloc.signIn().then((value){
                    userBloc.updateUserData(UserLocal(uid: value.user?.uid??'', userName: value.user?.displayName??'', userEmail: value.user?.email??'', photoURL: value.user?.photoURL??''));
                  });
                },)
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _handleCurrentStatusSession(){
    return StreamBuilder<User?>(
      stream: userBloc.authStatus,
      builder: (BuildContext context,AsyncSnapshot snapshot){
        //Snapshot contiene nuestro objeto user traido de firebase
        if(!snapshot.hasData || snapshot.hasError){
          return signInGooUi();
        }else if(snapshot.hasData){
          return const PlatziTrips();
        }else{
          return const Center(
            child:CircularProgressIndicator() ,
          );
        }
      },
    );
  }

}