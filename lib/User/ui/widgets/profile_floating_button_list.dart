import 'dart:io';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platzi_trips_aplication/Place/ui/screens/add_place_screen.dart';
import 'package:platzi_trips_aplication/User/ui/widgets/profile_floating_button.dart';
import '../../bloc/bloc_user.dart';

class ProfileFloatingButtonList extends StatelessWidget {
  const ProfileFloatingButtonList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    BlocUser userBloc;
    userBloc = BlocProvider.of(context);
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 190.0),
      child: Row(
        children: <Widget>[
          ProfileFloatingButton(
            mini: false,
            iconbutton: Icons.vpn_key,
            onPressedButton: () => {},
            iconSize: 20.0,
            color: Colors.white,
            heroTag: null,
          ),
          ProfileFloatingButton(
              mini: false,
              iconbutton: Icons.add,
              heroTag: null,
              onPressedButton: () {
                ImagePicker().pickImage(source: ImageSource.camera).then((pickedImage) {
                  if(pickedImage!=null) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                AddPlaceScreen(image: File(
                                    pickedImage.path),
                                ),),);
                  }else{
                    return;
                  }}).catchError((onError)=>print(onError));
              },
              iconSize: 30.0,
              color: Colors.white),
          ProfileFloatingButton(
              heroTag: null,
              mini: false,
              iconbutton: Icons.exit_to_app,
              onPressedButton: () => {userBloc.signOut()},
              iconSize: 30.0,
              color: Colors.white),
        ],
      ),
    );
  }
}
