import 'package:flutter/material.dart';

import '../../Place/model/place.dart';
class UserLocal {
  final String uid;
  final String userName;
  final String userEmail;
  final String photoURL;
  final List<Place>? myPlaces;
  final List<Place>? myFavoritePlaces;

  UserLocal({ required this.uid, this.myPlaces, this.myFavoritePlaces,required this.userName, required this.userEmail, required this.photoURL});

}