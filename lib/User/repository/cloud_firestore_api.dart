import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:platzi_trips_aplication/User/model/user.dart';
import 'package:platzi_trips_aplication/User/ui/widgets/image_bookmark.dart';

import '../../Place/model/place.dart';
import '../../Place/ui/widgets/card_image.dart';
class CloudFirestoreAPI{
  final String users = "users";
  final String places = "places";

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;


  Future<void> updateUserData(UserLocal user) async {
    DocumentReference ref = _db.collection(users).doc(user.uid);
    return ref.set({
      'uid': user.uid,
      'name': user.userName,
      'email': user.userEmail,
      'photoURL': user.photoURL,
      'myPlaces': user.myPlaces,
      'myFavoritePlaces': user.myFavoritePlaces,
      'lastSignIn': DateTime.now()
    },SetOptions(merge: true));
  }
  Future<void> updatePlaceData(Place place)async {
    CollectionReference refPlaces = _db.collection(places);
    User? user = _auth.currentUser;
    refPlaces.add({
      'name': place.name,
      'description': place.description,
      'likes': place.likes,
      'userOwner': _db.doc("${users}/${user?.uid}"), //Dato referencia
      'urlImage': place.urlImage,
    }).then((DocumentReference dr){
      dr.get().then((DocumentSnapshot snapshot) {
        snapshot.id;
        DocumentReference refUsers = _db.collection(users).doc(user!.uid);
        refUsers.update({
          'myPlaces': FieldValue.arrayUnion([_db.doc("$places/${snapshot.id}")])
        });
      });
    });
  }

  List<ImageBookmark> buildPlaces(List<DocumentSnapshot> placesListSnapshot){
    List<ImageBookmark> profilePlaces = [];
    placesListSnapshot.forEach((places) {
      profilePlaces.add(ImageBookmark(
        Place(name: places['name'], description: places['description'], urlImage: places['urlImage'], likes: places['likes'])
      ));
    });
    return profilePlaces;
  }
  List <Place> buildStandardPlaces (List<DocumentSnapshot> placesListSnapshot,UserLocal user){
    List<Place> places= <Place>[];
    placesListSnapshot.forEach((p) {
      Place place = Place(
          id: p["id"],
          name: p["name"],
          description: p["description"],
          urlImage: p["urlImage"],
          likes: p["likes"],
      );
      places.add(place);

    });
    return places;
  }
  Future likePlace(Place place, String uid) async {
    await _db.collection(places).doc(place.id).get()
        .then((DocumentSnapshot ds){
          int lik = ds['likes'];
          _db.collection(places).doc(place.id).update({
            'likes': place.liked? lik+1 : lik-1,
            'userLiked': place.liked? FieldValue.arrayUnion([_db.doc("${users}/$uid")]) : FieldValue.arrayRemove([_db.doc("$users/$uid")])
          });
    });
  }
}