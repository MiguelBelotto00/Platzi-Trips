import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Place {
  final String? id;
  final String name;
  final String description;
  final String urlImage;
  final int? likes;
  final User? userOwner;
  late bool liked;
  Place(
      {required this.name,
        this.id,
      this.likes,
      required this.description,
      required this.urlImage,
      this.userOwner,
       this.liked = false});
}
