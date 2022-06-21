import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_aplication/Place/model/place.dart';
import 'package:platzi_trips_aplication/Place/ui/widgets/card_image.dart';
import 'package:platzi_trips_aplication/Place/ui/widgets/title_input_location.dart';
import 'package:platzi_trips_aplication/User/bloc/bloc_user.dart';
import 'package:platzi_trips_aplication/widgets/button.dart';
import 'package:platzi_trips_aplication/widgets/gradient_back.dart';
import 'package:platzi_trips_aplication/widgets/text_input.dart';
import 'package:platzi_trips_aplication/widgets/title_header.dart';
class AddPlaceScreen extends StatefulWidget{
 final File? image;
  const AddPlaceScreen({Key? key,  this.image}) : super(key: key);

  @override
  State<AddPlaceScreen> createState()=> _AddPlaceScreen();
}
  class _AddPlaceScreen extends State<AddPlaceScreen>{
  final _controllerTitlePlace = TextEditingController();
  final _controllerDescriptionPlace = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final BlocUser userBloc = BlocProvider.of<BlocUser>(context);
    // TODO: implement build
    return Scaffold(
      body: Stack(
      children: <Widget>[
        GradientBack(300.0, ""),
        Row(children: <Widget>[
          Container(
            padding: const EdgeInsets.only(
              top: 25.0,
              left: 5.0,
            ),
            child: SizedBox(
              height: 45.0,
              width: 45.0,
              child: IconButton(onPressed: (){
                Navigator.pop(context);
                }, icon: const Icon(Icons.keyboard_arrow_left,color: Colors.white,size: 45,)),
            ),
          ),
          Flexible(
            child: Container(
              width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(top: 45.0, left: 20.0, right: 10.0),
              child: const TitleHeader(title: "Add a new Place",),
          ),),
        ],),
        Container(
          margin: const EdgeInsets.only(top: 120.0,bottom: 20.0),
          child: ListView(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                child: CardImage(pathImage: widget.image!.path, iconData: Icons.camera_alt, left: 20.0, height: 300.0, onPressedFabIcon: () {  }, width: 350.0,),
              ),//Image
              Container(
                margin: const EdgeInsets.only(top:20.0,bottom: 20.0),
                child: TextInputCreate(
                  hintText: "Title",
                  inputType: null,
                  maxLines: 1,
                  controller: _controllerTitlePlace,
                )
              ),
              TextInputCreate(
                  hintText: "Description",
                  inputType: TextInputType.multiline,
                  controller: _controllerDescriptionPlace,
                  maxLines: 4),
              Container(
                margin: const EdgeInsets.only(top:10.0),
                child: const TitleInputLocation(
                  hintText: "Add a Location",
                  iconData: Icons.location_on_outlined,
                ),
              ),
              Container(
                width: 70.0,
                child: ButtonPurple(
                  buttonText: "Add Place",
                  onPressed: () {
                    //Firebase Storage
                    //Url - Cloud Firestore
                      userBloc.currentUser().then((user){
                        if(user!=null){
                          String uid = user.uid;
                          String path = "${uid}/${DateTime.now().toString()}.jpg";
                          userBloc.uploadFile(path,widget.image!).then((UploadTask? uploadTask) {
                            uploadTask!.then((TaskSnapshot taskSnapshot){
                              taskSnapshot.ref.getDownloadURL().then((urlImage){
                                userBloc.updatePlaceData(Place(name: _controllerTitlePlace.text, description: _controllerDescriptionPlace.text,likes: 0, urlImage: urlImage)).whenComplete(() => Navigator.pop(context));
                              });
                            });
                          });
                        }
                      });
                    //Insertar todo el objeto Place
                  },
                ),
              )
            ],
          ),
        )
      ],

      ),
    );
  }
  }
