import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:platzi_trips_aplication/User/repository/cloud_firestore_api.dart';

import '../../Place/model/place.dart';
import '../../Place/ui/widgets/card_image.dart';
import '../model/user.dart';
import '../ui/widgets/image_bookmark.dart';
class CloudFirestoreRepository {
  final _cloudFirestoreAPI = CloudFirestoreAPI();

  void updateUserDataFirestore(UserLocal user) =>
      _cloudFirestoreAPI.updateUserData(user);
  Future<void> updatePlaceData(Place place) => _cloudFirestoreAPI.updatePlaceData(place);
  List<ImageBookmark> buildPlaces(List<DocumentSnapshot> placesListSnapshot) => _cloudFirestoreAPI.buildPlaces(placesListSnapshot);
  List<Place> buildStandardPlaces (List<DocumentSnapshot> placesListSnapshot,UserLocal user) => _cloudFirestoreAPI.buildStandardPlaces(placesListSnapshot,user);
  Future likePlace(Place place, String uid) => _cloudFirestoreAPI.likePlace(place, uid);
}

