import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_aplication/User/model/user.dart';
import 'package:platzi_trips_aplication/User/repository/auth_repository.dart';
import 'package:platzi_trips_aplication/User/repository/cloud_firestore_api.dart';
import 'package:platzi_trips_aplication/User/repository/cloud_firestore_repository.dart';

import '../../Place/model/place.dart';
import '../../Place/repository/firebase_storage_repository.dart';
import '../../Place/ui/widgets/card_image.dart';
import '../ui/widgets/image_bookmark.dart';
class BlocUser extends Bloc {
  final _authRepository = AuthRepository();
  //Flujo de datos - Streams proveniente de Firebase
  Stream<User?> streamFirebase = FirebaseAuth.instance.authStateChanges();
  Stream<User?> get authStatus => streamFirebase;
  Future<User?> currentUser()async{
    User? user = FirebaseAuth.instance.currentUser;
    return user;
  }

  //Casos de uso del objeto user
  //1- Sign in a la aplicacion con Google.
  Future<UserCredential> signIn() {
    return _authRepository.signInFirebase();
  }
  //2- Registro de usuario en Base de datos:
  final _cloudFirestoreRepository = CloudFirestoreRepository();
  void updateUserData(UserLocal user) => _cloudFirestoreRepository.updateUserDataFirestore(user);
  Future<void> updatePlaceData(Place place)=> _cloudFirestoreRepository.updatePlaceData(place);
  //Creando Stream para estar siempre en escucha
  Stream<QuerySnapshot> placesListStream = FirebaseFirestore.instance.collection(CloudFirestoreAPI().places).snapshots();
  Stream<QuerySnapshot> get placesStream => placesListStream;
  List<ImageBookmark> buildPlaces(List<DocumentSnapshot> placesListSnapshot) => _cloudFirestoreRepository.buildPlaces(placesListSnapshot);
  List<Place> buildStandardPlaces (List<DocumentSnapshot> placesListSnapshot,UserLocal user) => _cloudFirestoreRepository.buildStandardPlaces(placesListSnapshot,user);
  Stream<QuerySnapshot> myPlacesListStream(String uid) => FirebaseFirestore.instance.collection(CloudFirestoreAPI().places).where("userOwner",isEqualTo: FirebaseFirestore.instance.doc("${CloudFirestoreAPI().users}/$uid")).snapshots();
  Future likePlace(Place place, String uid) => _cloudFirestoreRepository.likePlace(place,uid);
  final _firebaseStorageRepository = FirebaseStorageRepository();
  Future<UploadTask?> uploadFile(String path, File image) => _firebaseStorageRepository.uploadFile(path, image);
  //3- Sign out a la aplicacion
  signOut(){
    _authRepository.signOut();
  }
  @override
  void dispose() {
    // TODO: implement dispose
  }

}